extends SceneTree
## gdd/sistemas/10_estado_partida.md §3.5 and §5 through the SaveManager and Game autoloads:
## automatic save, one saved run deleted on FINAL or abandon, unreadable / old-format save,
## write failure warned once per run (CA-08..CA-12), atomic write (V-008). Uses its own save file.
## godot --headless --path jogo -s res://tests/test_core_save.gd

var failures: PackedStringArray = []
var game: Node
var saves: Node
var path := ""
var toasts: Array = []
var states: Array = []


func _initialize() -> void:
	await process_frame   # autoloads are ready after the first frame
	game = root.get_node("Game")
	saves = root.get_node("SaveManager")
	path = "user://test_lote_a_save_%d.json" % OS.get_process_id()
	saves.path = path
	saves.delete()
	game.toast_requested.connect(func(kind): toasts.append(kind))
	game.state_changed.connect(func(s): states.append(s))
	_save_manager()
	_atomic_write()
	_automatic_save()
	_finish_deletes_save()
	_new_run_and_abandon()
	_corrupted_and_old_saves()
	_write_failure()
	saves.path = path
	saves.delete()
	saves.path = saves.DEFAULT_PATH
	_done("test_core_save")


func _save_manager() -> void:
	_check(not saves.has_save(), "no save at start")
	_check(saves.save_run({"format_version": RunState.FORMAT_VERSION, "x": 1}), "save_run")
	_check(saves.has_save(), "has_save after writing")
	_eq(saves.load_run()["x"], 1.0, "load_run reads it back")
	saves.delete()
	_check(not saves.has_save(), "delete")


## V-008: the run is written to `<path>.tmp`, which then replaces the save. A crash while
## writing leaves the previous save; a crash between remove and rename leaves only the .tmp.
func _atomic_write() -> void:
	var tmp: String = path + ".tmp"
	_check(saves.save_run({"format_version": RunState.FORMAT_VERSION, "x": 1}), "first save")
	_check(not FileAccess.file_exists(tmp), "no .tmp left after a save")
	_check(saves.save_run({"format_version": RunState.FORMAT_VERSION, "x": 2}), "save over an old one")
	_eq(saves.load_run()["x"], 2.0, "the new save replaced the old one")
	# Crash in the middle of a write: half a .tmp next to the good save.
	var f := FileAccess.open(tmp, FileAccess.WRITE)
	f.store_string("{ \"format_version\": ")
	f.close()
	_eq(saves.load_run()["x"], 2.0, "a broken .tmp does not hide the last good save")
	_check(saves.save_run({"format_version": RunState.FORMAT_VERSION, "x": 3}), "save after a crash")
	_eq(saves.load_run()["x"], 3.0, "the next save works")
	# Crash between the remove and the rename of the fallback: only the .tmp is there.
	DirAccess.rename_absolute(path, tmp)
	_check(saves.has_save(), "a lone .tmp counts as a save")
	_eq(saves.load_run()["x"], 3.0, "a lone .tmp is read")
	saves.delete()
	_check(not FileAccess.file_exists(path) and not FileAccess.file_exists(tmp), "delete removes both")


func _automatic_save() -> void:
	game.new_run(42)
	_eq(game.current_state(), &"calibration", "new_run → calibration")
	_check(saves.has_save(), "saved after the transition (§3.5)")
	_eq(states.back(), &"calibration", "state_changed emitted")
	var side: int = game.flow.run.calibration_side_a
	game.answer_calibration(side)
	_eq(int(saves.load_run()["calibration_index"]), 1, "saved after each answer")
	# Play into the first card and choose: the choice is saved before the consequence (§3.5).
	while game.current_state() == &"calibration":
		game.answer_calibration(1)
	game.continue_from_year()
	_eq(game.current_state(), &"card", "first card")
	var card_id: String = game.card_view()["id"]
	var r: Dictionary = game.choose(1)
	_eq(r["next"], &"consequence", "choice → consequence")
	var saved: Dictionary = saves.load_run()
	_eq([saved["state"], saved["played"]], ["consequence", [card_id]], "choice saved before the consequence")
	# "Continuar": resume() returns to the consequence, read-only.
	game.flow = null
	_check(game.resume(), "resume")
	_eq([game.current_state(), game.consequence_view()["readonly"]], [&"consequence", true], "resumed read-only (CA-07)")


func _finish_deletes_save() -> void:
	# CA-08: the save disappears when the run ends; no "Continuar".
	game.new_run(43)
	_check(saves.has_save(), "saved")
	var guard := 0
	while game.current_state() != &"final" and guard < 1000:
		guard += 1
		_step()
	_eq(game.current_state(), &"final", "run finished")
	_check(not saves.has_save() and not game.has_save(), "CA-08 save deleted on FINAL")
	_check(game.final_view()["ending"]["id"] != "", "final view after the save is gone")


func _new_run_and_abandon() -> void:
	# CA-11: "Novo mandato" with a saved run → deleted without an ending; calibration starts.
	game.new_run(44)
	game.answer_calibration(1)
	game.new_run(45)
	_eq([game.current_state(), int(saves.load_run()["calibration_index"]), saves.load_run()["seed"]], [&"calibration", 0, "45"], "CA-11 new run replaces the save")
	# CA-10: abandon in the calibration → start screen, save deleted, no ending.
	game.answer_calibration(1)
	game.answer_calibration(1)
	game.abandon()
	_eq(game.current_state(), &"start", "CA-10 back to the start screen")
	_check(not saves.has_save(), "CA-10 save deleted")
	_eq(game.final_view(), {}, "CA-10 no ending")
	# CA-09: abandon in the run → Renúncia, save deleted.
	game.new_run(46)
	while game.current_state() == &"calibration":
		game.answer_calibration(1)
	game.continue_from_year()
	game.abandon()
	_eq([game.current_state(), game.final_view()["ending"]["name"]], [&"final", "Renúncia"], "CA-09 Renúncia")
	_check(not saves.has_save(), "CA-09 save deleted")


func _corrupted_and_old_saves() -> void:
	# CA-12: unreadable save → resume() false, save deleted, message for the UI, no crash.
	var f := FileAccess.open(path, FileAccess.WRITE)
	f.store_string("{ not json")
	f.close()
	_check(game.has_save(), "corrupted file still counts as a save")
	_check(not game.resume(), "CA-12 resume fails")
	_check(not saves.has_save(), "CA-12 corrupted save deleted")
	_check(game.last_resume_error != "", "reason recorded")
	_eq(game.RESUME_FAILED_TEXT, "Não foi possível continuar o mandato", "message (gdd 10 §5)")
	_eq(game.current_state(), &"start", "stays on the start screen")
	# Old format (game update) → same rule (gdd 10 §5).
	game.new_run(47)
	var d: Dictionary = saves.load_run()
	d["format_version"] = RunState.FORMAT_VERSION + 1
	saves.save_run(d)
	_check(not game.resume() and not saves.has_save(), "other format → deleted")
	# Valid JSON of the right version but not fitting the data → deleted too.
	game.new_run(48)
	d = saves.load_run()
	d["played"] = ["NOPE-1"]
	saves.save_run(d)
	_check(not game.resume() and not saves.has_save(), "save not fitting the data → deleted")


func _write_failure() -> void:
	# §5: the game goes on without saving; discreet warning once per run (C-21).
	toasts.clear()
	saves.path = "user://no_such_dir_%d/deeper/save.json" % OS.get_process_id()
	game.new_run(49)
	game.answer_calibration(1)
	game.answer_calibration(1)
	_eq(toasts, [&"save_failed"], "toast once per run")
	_eq(game.current_state(), &"calibration", "the run goes on")
	game.new_run(50)
	_eq(toasts, [&"save_failed", &"save_failed"], "once more for a new run")
	game.abandon()


func _step() -> void:
	match game.current_state():
		&"calibration":
			game.answer_calibration(1)
		&"year_intro":
			game.continue_from_year()
		&"events":
			game.continue_from_event()
		&"card":
			game.choose(1)
		&"consequence":
			game.continue_from_consequence()
		&"learning":
			game.continue_from_learning()
		&"impeachment":
			if game.impeachment_view()["stage"] == "phase":
				game.choose_impeachment(1)
			else:
				game.continue_impeachment()


func _eq(got: Variant, want: Variant, what: String) -> void:
	if got != want:
		failures.append("%s: got %s, want %s" % [what, str(got), str(want)])


func _check(cond: bool, what: String) -> void:
	if not cond:
		failures.append(what)


func _done(test_name: String) -> void:
	if failures.is_empty():
		print("%s: OK" % test_name)
		quit(0)
	else:
		for f in failures:
			printerr("FAIL: " + f)
		quit(1)
