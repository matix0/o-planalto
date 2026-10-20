extends SceneTree
## P-005 — whole runs with fixed seeds through the Game API (what the screens call): normal
## end, catastrophe, impeachment acquittal and conviction, abandon in the calibration and
## mid-run, save/resume round trips (the app closed and reopened) and a corrupted save.
## Every view is scanned for side words (D-084). Uses its own save file.
## godot --headless --path jogo -s res://tests/test_playthrough.gd

const FORBIDDEN := ["esquerda", "direita", "◀", "▶"]
const SEEDS := 40

var failures: PackedStringArray = []
var game: Node
var saves: Node
var data: GameDatabase
var order: Array


func _initialize() -> void:
	await process_frame   # autoloads are ready after the first frame
	game = root.get_node("Game")
	saves = root.get_node("SaveManager")
	data = root.get_node("GameData")
	order = Array(data.meter_ids)
	saves.path = "user://test_lote_a_play_%d.json" % OS.get_process_id()
	saves.delete()
	_scenarios()
	_round_trips()
	_abandon()
	_corrupted_save()
	saves.delete()
	saves.path = saves.DEFAULT_PATH
	_done("test_playthrough")


## Plays seeds until each kind of end shows up (deterministic: fixed seeds and policies).
func _scenarios() -> void:
	var found := {}
	for combo in [["careful", true], ["careful", false], ["reckless", true], ["capital", true], ["capital", false]]:
		for s in range(1, SEEDS + 1):
			var r := _play(s, combo[0], combo[1], 9 if s % 2 == 0 else 0)
			found[r["reason"]] = found.get(r["reason"], [s, combo])
			if r["outcome"] != "":
				found[r["outcome"]] = found.get(r["outcome"], [s, combo])
	for kind in ["end_of_term", "catastrophe", "impeachment", "acquitted", "convicted"]:
		_check(found.has(kind), "a run ending with '%s' (%s)" % [kind, str(found.keys())])
	print("  first seed per kind: ", found)


## Same seed and choices: closing and reopening the app every few steps changes nothing.
func _round_trips() -> void:
	for s in range(1, 9):
		var straight := _play(s, "careful", true, 0)
		var reopened := _play(s, "careful", true, 4)
		_check(reopened["reopened"] > 0, "seed %d reopened at least once" % s)
		_eq(reopened["final"], straight["final"], "seed %d save/resume round trip" % s)


func _abandon() -> void:
	# In the calibration: back to the start screen, no ending, save deleted (gdd 10 CA-10).
	game.new_run(5)
	game.answer_calibration(1)
	game.answer_calibration(-1)
	game.abandon()
	_eq([game.current_state(), game.final_view(), saves.has_save()], [&"start", {}, false], "abandon in the calibration")
	# Mid-run: Renúncia with the queued events in the epilogue, save deleted (CA-09).
	game.new_run(5)
	var guard := 0
	while not (game.current_state() == &"card" and game.flow.run.year == 2) and game.current_state() != &"final" and guard < 400:
		guard += 1
		_act("careful", true)
	var queued: Array = game.flow.run.event_queue.map(func(e): return e["text"])
	var epilogue_before: Array = game.flow.run.epilogue.duplicate()
	game.abandon()
	var v: Dictionary = game.final_view()
	_eq([v["ending"]["id"], v["reason"]], ["END-028", "exit"], "abandon mid-run → Renúncia")
	_eq(v["epilogue"], epilogue_before + queued, "queued events go to the epilogue")
	_check(not saves.has_save(), "save deleted after the Renúncia")
	_scan(v, "final")


func _corrupted_save() -> void:
	game.new_run(6)
	for _i in 10:
		_act("careful", true)
	var text := FileAccess.get_file_as_string(saves.path)
	var f := FileAccess.open(saves.path, FileAccess.WRITE)
	f.store_string(text.substr(0, text.length() / 2))   # a write cut in the middle
	f.close()
	game.flow = null   # the app closes
	_check(not game.resume(), "corrupted save → resume() false")
	_check(not game.has_save(), "corrupted save deleted")
	game.new_run(6)
	_eq(game.current_state(), &"calibration", "a new run starts normally afterwards")
	game.abandon()


## One whole run. `reopen_every` > 0 simulates closing and reopening the app.
func _play(s: int, policy: String, scene_pass: bool, reopen_every: int) -> Dictionary:
	game.new_run(s)
	var steps := 0
	var reopened := 0
	var per_year := {}
	while game.current_state() != &"final" and steps < 1000:
		steps += 1
		if reopen_every > 0 and steps % reopen_every == 0:
			game.flow = null
			if not game.resume():
				failures.append("seed %d: resume failed (%s)" % [s, game.last_resume_error])
				break
			reopened += 1
		_scan_current()
		if game.current_state() == &"card":
			per_year[game.flow.run.year] = per_year.get(game.flow.run.year, 0) + 1
		_check(not (game.current_state() == &"events" and game.flow.run.year == 1), "seed %d no event in Ano 1" % s)
		_act(policy, scene_pass)
	_eq(game.current_state(), &"final", "seed %d %s reaches the final screen" % [s, policy])
	_check(not saves.has_save(), "seed %d save deleted on the final screen" % s)
	var played: Array = game.flow.run.played
	_eq(played.size(), played.reduce(func(acc, id): return acc if acc.has(id) else acc + [id], []).size(), "seed %d no card twice" % s)
	_check(per_year.values().all(func(n): return n <= 7), "seed %d at most 7 cards a year" % s)
	var v: Dictionary = game.final_view()
	_scan(v, "final")
	return {
		"reason": v["reason"],
		"ending": v["ending"]["id"],
		"outcome": String(game.flow.run.impeachment.get("outcome", "")),
		"final": v,
		"reopened": reopened,
	}


func _act(policy: String, scene_pass: bool) -> void:
	match game.current_state():
		&"calibration":
			game.answer_calibration(1)
		&"year_intro":
			game.continue_from_year()
		&"events":
			game.continue_from_event()
		&"card":
			game.choose(_pick(policy))
		&"consequence":
			game.continue_from_consequence()
		&"learning":
			game.continue_from_learning()
		&"impeachment":
			if game.impeachment_view()["stage"] == "phase":
				game.choose_impeachment(_scene_pick(scene_pass))
			else:
				game.continue_impeachment()


## careful: keep the lowest meter high; reckless: the opposite; capital: drain capital.
func _pick(policy: String) -> int:
	var run: RunState = game.flow.run
	var card: Dictionary = data.cards[run.current_card["id"]]
	var side_a := int(run.current_card["side_a"])
	var scores := {}
	for side in [-1, 1]:
		var opt: Dictionary = card[CardRules.option_key(side, side_a)]
		var m: Dictionary = run.meters.duplicate()
		MeterRules.apply_effects(m, game.flow._ints(opt["effects"]), game.flow._multiplier(), data.balance, order)
		var safe: int = m.values().min() * 1000 + m.values().reduce(func(a, v): return a + v, 0)
		match policy:
			"careful":
				scores[side] = safe
			"reckless":
				scores[side] = -safe
			_:
				scores[side] = -int(opt["effects"].get("political_capital", 0)) * 100000 + safe
	return -1 if scores[-1] > scores[1] else 1


func _scene_pick(want_pass: bool) -> int:
	var imp: Dictionary = game.flow.run.impeachment
	var card: Dictionary = data.impeachment_cards[int(imp["phase"]) - 1]
	var a_passes := ImpeachmentRules.test_passes(card["option_a"]["test"], game.flow.run.meters)
	var b_passes := ImpeachmentRules.test_passes(card["option_b"]["test"], game.flow.run.meters)
	var take_a := a_passes or not b_passes if want_pass else not a_passes
	return int(imp["side_a"]) if take_a else -int(imp["side_a"])


func _scan_current() -> void:
	match game.current_state():
		&"calibration":
			_scan(game.calibration_view(), "calibration")
		&"year_intro":
			_scan(game.year_view(), "year")
		&"events":
			_scan(game.event_view(), "event")
		&"card":
			_scan(game.card_view(), "card")
		&"consequence":
			_scan(game.consequence_view(), "consequence")
		&"learning":
			_scan(game.learning_view(), "learning")
		&"impeachment":
			_scan(game.impeachment_view(), "impeachment")


## No displayed text names a side (D-084).
func _scan(v: Variant, where: String) -> void:
	if v is String:
		var low := (v as String).to_lower()
		for w in FORBIDDEN:
			if low.contains(w):
				failures.append("%s view shows '%s': %s" % [where, w, v])
	elif v is Array:
		for x in v:
			_scan(x, where)
	elif v is Dictionary:
		for k in v:
			_scan(v[k], where)


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
		for f in failures.slice(0, 40):
			printerr("FAIL: " + f)
		quit(1)
