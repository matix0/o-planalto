extends SceneTree
## Screenshots of the impeachment scene (lote E, T-09 boards). Not part of run_all.sh. On a copy:
##   xvfb-run -a -s "-screen 0 1280x1024x24" $G --path <copy> --rendering-driver opengl3 \
##     --resolution 390x844 -s res://tests/shot_impeachment.gd -- --out=<abs dir>
##   xvfb-run -a -s "-screen 0 1600x1000x24" $G --path <copy> --rendering-driver opengl3 \
##     --resolution 1500x844 -s res://tests/shot_impeachment.gd -- --out=<abs dir> --pc
## The real Game plays a seeded run (careful policy) until the scene opens; the run is kept at
## the opening and reloaded for the second ending. Safe areas 48 / 32 as on the boards.
## Saves and settings go to temporary files.

const MAIN_SCENE := "res://scenes/main.tscn"
const TEST_SETTINGS := "user://shot_imp_settings.cfg"
const SAFE := Vector4(0, 48, 0, 32)       # Tela board: safe_top 48, safe_bottom 32 (illustrative)

var _out := ""
var _main: Control
var _game: Node
var _saves: Node
var _settings: Node
var _data: Object
var _order: Array


func _initialize() -> void:
	_run.call_deferred()


func _run() -> void:
	create_timer(300.0, true, false, true).timeout.connect(func() -> void:
		printerr("shot_impeachment timed out")
		quit(1))
	var pc := false
	for a in OS.get_cmdline_user_args():
		if a.begins_with("--out="):
			_out = a.trim_prefix("--out=")
		elif a == "--pc":
			pc = true
	if _out == "":
		_out = ProjectSettings.globalize_path("user://shots")
	DirAccess.make_dir_recursive_absolute(_out)
	await process_frame
	_game = root.get_node(^"Game")
	_saves = root.get_node(^"SaveManager")
	_settings = root.get_node(^"Settings")
	_data = root.get_node(^"GameData")
	_order = Array(_data.meter_ids)
	var real_settings: String = _settings.storage_path
	_settings.storage_path = TEST_SETTINGS
	_settings.reset_defaults(false)
	_apply_base_settings()   # -- --text=N (16-36) and --hc: base text size and high contrast (P-014 etapa 7)
	_saves.path = "user://shot_imp_%d.json" % OS.get_process_id()
	_saves.delete()

	var seed := _reach_scene(15)
	print("scene opened with seed ", seed)
	if pc:
		await _pc_shots()
	else:
		await _phone_shots()
	if _main:
		_main.queue_free()
	await process_frame
	_saves.delete()
	_saves.path = _saves.DEFAULT_PATH
	if FileAccess.file_exists(TEST_SETTINGS):
		DirAccess.remove_absolute(ProjectSettings.globalize_path(TEST_SETTINGS))
	_settings.storage_path = real_settings
	print("shots saved in ", _out)
	quit(0)


## PC (D-171): column ≤ 430 centered; the scene background and the darkened opening cover
## the side bands too.
func _pc_shots() -> void:
	await _open_app()
	var screen: Node = _main.current_screen()
	await _until(func() -> bool: return screen.stage() == "intro" and not screen.is_locked())
	await _wait(0.8)
	await _shot("pc_t09_1_intro")
	_key(KEY_ENTER)
	await _until(func() -> bool: return screen.stage() == "phase" and not screen.is_locked())
	await _wait(0.4)
	await _shot("pc_t09_2_phase1")


func _phone_shots() -> void:
	var opening := FileAccess.get_file_as_string(_saves.path)
	await _acquittal_path()
	await _restore(opening)
	await _conviction_path()
	await _restore(opening)
	_game.flow.run.impeachment["automatic"] = true   # T-09.9 (Consciência e Integridade < 15)
	await _open_app()
	var screen: Node = _main.current_screen()
	await _until(func() -> bool: return screen.stage() == "intro" and not screen.is_locked())
	_key(KEY_ENTER)
	await _until(func() -> bool: return screen.stage() == "result" and not screen.is_locked())
	await _shot("t09_9_automatic")


## Phases 1-2 and 4-5 passed, phase 3 lost (342 / 513 on the chamber) → acquittal.
func _acquittal_path() -> void:
	await _open_app()
	var screen: Node = _main.current_screen()
	await _until(func() -> bool: return screen.stage() == "intro" and not screen.is_locked())
	await _wait(0.8)
	await _shot("t09_1_intro")
	_key(KEY_ENTER)
	var plan := [true, true, false, true, true]
	for phase in range(1, 6):
		await _until(func() -> bool: return screen.stage() == "phase" and not screen.is_locked())
		await _wait(0.4)
		match phase:
			1:
				screen.card().preview_drag(1, _settings.drag_limit)
				await _shot("t09_2_phase1_drag")
				screen.card().reset()
			2:
				await _shot("t09_3_committee")
			3:
				await _shot("t09_4_chamber")
				_settings.set_value(&"high_contrast", true)
				await _wait(0.2)
				await _shot("t09_4_chamber_hc")
				_settings.set_value(&"high_contrast", false)
				_settings.set_value(&"text_step", 24)
				await _wait(0.3)
				await _shot("t09_4_chamber_24px")
				_settings.set_value(&"text_step", 18)
				await _wait(0.2)
			4:
				await _shot("t09_5_senate_target")
			5:
				var sides: Dictionary = _game.impeachment_view()["card"]["sides"]
				var longest := -1 if String(sides[-1]["text"]).length() >= String(sides[1]["text"]).length() else 1
				screen.card().preview_drag(longest, _settings.drag_limit)
				await _shot("t09_6_phase5_limit")
				screen.card().reset()
		await _choose(screen, plan[phase - 1])
		await _until(func() -> bool: return screen.stage() == "consequence")
		await _wait(0.9)
		if phase == 2:
			await _shot("t09_3b_committee_after")
		if phase == 3:
			await _shot("t09_4b_chamber_lost")
			# F-07: the app closes on the consequence and reopens read-only.
			_game.flow = null
			_game.resume()
			await _open_app()
			screen = _main.current_screen()
			await _wait(0.5)
			await _shot("f07_consequence_readonly")
		if phase == 4:
			await _shot("t09_5b_senate_after")
		_key(KEY_ENTER)
		await _until(func() -> bool: return screen.stage() in ["learning", "phase", "result"])
		if screen.stage() == "learning":
			await _wait(0.6)
			if phase == 1:
				await _shot("t09_learning")
			screen.sheet().continue_button().pressed.emit()
	await _until(func() -> bool: return screen.stage() == "result" and not screen.is_locked())
	await _wait(0.8)
	await _shot("t09_7_%s" % _game.impeachment_view()["result"]["outcome"])


## Every test failed → conviction (Senate 54 / 81). Restart on the phase-3 card (F-07).
func _conviction_path() -> void:
	await _open_app()
	var screen: Node = _main.current_screen()
	await _until(func() -> bool: return screen.stage() == "intro" and not screen.is_locked())
	_key(KEY_ENTER)
	for phase in range(1, 6):
		await _until(func() -> bool: return screen.stage() == "phase" and not screen.is_locked())
		if phase == 3:
			_game.flow = null
			_game.resume()
			await _open_app()
			screen = _main.current_screen()
			await _wait(0.5)
			await _shot("f07_resume_phase3")
		await _choose(screen, false)
		await _until(func() -> bool: return screen.stage() == "consequence")
		await _wait(0.3)
		_key(KEY_ENTER)
		await _until(func() -> bool: return screen.stage() in ["learning", "phase", "result"])
		if screen.stage() == "learning":
			await _wait(0.4)
			screen.sheet().continue_button().pressed.emit()
	await _until(func() -> bool: return screen.stage() == "result" and not screen.is_locked())
	await _wait(0.8)
	await _shot("t09_8_%s" % _game.impeachment_view()["result"]["outcome"])


func _choose(screen: Node, want_pass: bool) -> void:
	var side := _scene_side(want_pass)
	screen.card().grab_focus()
	_key(KEY_RIGHT if side == 1 else KEY_LEFT)
	await _frames(2)
	_key(KEY_ENTER)


func _restore(save_text: String) -> void:
	if _main:
		_main.queue_free()
		_main = null
		await process_frame
	var f := FileAccess.open(_saves.path, FileAccess.WRITE)
	f.store_string(save_text)
	f.close()
	_game.flow = null
	_game.resume()


func _open_app() -> void:
	if _main:
		_main.queue_free()
		await process_frame
	_main = (load(MAIN_SCENE) as PackedScene).instantiate() as Control
	_main.start_screen = &""
	if root.size.x <= Tokens.COLUMN_MAX:
		_main.debug_safe_insets = SAFE   # phone: the board's safe areas
	root.add_child(_main)
	await process_frame
	_main.go_to(_main.screen_for_state(_game.current_state()))
	await _settle()


func _reach_scene(from_seed: int) -> int:
	for s in range(from_seed, from_seed + 60):
		_game.new_run(s)
		var guard := 0
		while _game.current_state() != &"impeachment" and _game.current_state() != &"final" and guard < 1000:
			guard += 1
			match _game.current_state():
				&"calibration":
					_game.answer_calibration(1)
				&"year_intro":
					_game.continue_from_year()
				&"events":
					_game.continue_from_event()
				&"card":
					_game.choose(_careful_pick())
				&"consequence":
					_game.continue_from_consequence()
				&"learning":
					_game.continue_from_learning()
		if _game.current_state() == &"impeachment" and not bool(_game.flow.run.impeachment["automatic"]):
			return s
	return -1


func _careful_pick() -> int:
	var run: Object = _game.flow.run
	var card: Dictionary = _data.cards[run.current_card["id"]]
	var side_a := int(run.current_card["side_a"])
	var scores := {}
	for side in [-1, 1]:
		var opt: Dictionary = card[CardRules.option_key(side, side_a)]
		var m: Dictionary = run.meters.duplicate()
		MeterRules.apply_effects(m, _game.flow._ints(opt["effects"]), _game.flow._multiplier(), _data.balance, _order)
		scores[side] = m.values().min() * 1000 + m.values().reduce(func(a, v): return a + v, 0)
	return -1 if scores[-1] > scores[1] else 1


func _scene_side(want_pass: bool) -> int:
	var imp: Dictionary = _game.flow.run.impeachment
	var card: Dictionary = _data.impeachment_cards[int(imp["phase"]) - 1]
	var a_passes := ImpeachmentRules.test_passes(card["option_a"]["test"], _game.flow.run.meters)
	var b_passes := ImpeachmentRules.test_passes(card["option_b"]["test"], _game.flow.run.meters)
	var take_a := (a_passes or not b_passes) if want_pass else not a_passes
	return int(imp["side_a"]) if take_a else -int(imp["side_a"])


func _shot(name: String) -> void:
	await _frames(3)
	await RenderingServer.frame_post_draw
	var img := root.get_texture().get_image()
	var path := _out.path_join(name + ".png")
	img.save_png(path)
	print("shot ", path, " ", img.get_size())


func _until(cond: Callable, timeout: float = 20.0) -> bool:
	var t0 := Time.get_ticks_msec()
	while not cond.call():
		if Time.get_ticks_msec() - t0 > int(timeout * 1000.0):
			printerr("shot_impeachment: wait timed out")
			return false
		await process_frame
	return true


func _wait(seconds: float) -> void:
	await create_timer(seconds).timeout


func _settle() -> void:
	await process_frame
	var guard := 0
	while _main.is_busy() and guard < 2000:
		guard += 1
		await process_frame
	await _frames(3)


func _frames(n: int) -> void:
	for i in n:
		await process_frame


func _key(code: Key) -> void:
	var down := InputEventKey.new()
	down.keycode = code
	down.physical_keycode = code
	down.pressed = true
	root.push_input(down)
	var up := down.duplicate() as InputEventKey
	up.pressed = false
	root.push_input(up)


## Base settings from the command line: --text=16|18|20|24|36 and --hc. The variant shots of
## this script still set their own sizes; this only changes the base pages.
func _apply_base_settings() -> void:
	for a in OS.get_cmdline_user_args():
		if a.begins_with("--text="):
			_settings.set_value(&"text_step", int(a.trim_prefix("--text=")))
		elif a == "--hc":
			_settings.set_value(&"high_contrast", true)
