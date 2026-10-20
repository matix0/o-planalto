extends SceneTree
## gdd/sistemas/10_estado_partida.md — transitions (§3.2), abandon (§3.3), saved state and
## resume at the exact point (§3.4-3.5, §5) and acceptance criteria CA-01..CA-10, through
## GameFlow and RunState (files: test_core_save.gd).
## godot --headless --path jogo -s res://tests/test_core_state.gd

var failures: PackedStringArray = []
var data: GameDatabase
var order: Array


func _initialize() -> void:
	data = GameDatabase.new()
	data.load_all()
	order = Array(data.meter_ids)
	_full_flow_order()
	_year_four_closing()
	_abandon()
	_resume_points()
	_determinism()
	_rejected_saves()
	data.free()
	_done("test_core_state")


## One step of a deterministic test policy; returns false when the run is over.
func _step(f: GameFlow) -> bool:
	match f.state():
		&"calibration":
			f.answer_calibration(-1 if f.run.calibration_index % 2 == 0 else 1)
		&"year_intro":
			f.continue_from_year()
		&"events":
			f.continue_from_event()
		&"card":
			f.choose(_careful(f))
		&"consequence":
			f.continue_from_consequence()
		&"learning":
			f.continue_from_learning()
		&"impeachment":
			if f.run.impeachment["stage"] == "phase":
				f.choose_impeachment(_scene_pass(f))
			else:
				f.continue_impeachment()
		_:
			return false
	return true


func _careful(f: GameFlow) -> int:
	var card: Dictionary = data.cards[f.run.current_card["id"]]
	var best := 0
	var best_score := -999999
	for side in [-1, 1]:
		var m: Dictionary = f.run.meters.duplicate()
		var opt: Dictionary = card[CardRules.option_key(side, int(f.run.current_card["side_a"]))]
		MeterRules.apply_effects(m, f._ints(opt["effects"]), f._multiplier(), data.balance, order)
		var score: int = m.values().min() * 1000 + m.values().reduce(func(a, v): return a + v, 0)
		if score > best_score:
			best = side
			best_score = score
	return best


func _scene_pass(f: GameFlow) -> int:
	var imp := f.run.impeachment
	var card: Dictionary = data.impeachment_cards[int(imp["phase"]) - 1]
	var a_passes := ImpeachmentRules.test_passes(card["option_a"]["test"], f.run.meters)
	return int(imp["side_a"]) if a_passes else -int(imp["side_a"])


## Save → JSON text → restore, as the app does when it is closed and reopened.
func _reopen(f: GameFlow) -> GameFlow:
	var text := JSON.stringify(f.to_dict())
	return GameFlow.restore(data, JSON.parse_string(text))


func _full_flow_order() -> void:
	# CA-01: calibration → 4 × (events → up to 7 cards → closing) → final, in this order.
	for s in [3, 21, 40]:
		var f := GameFlow.new(data)
		f.start(s)
		var trail: Array = []
		while true:
			trail.append([f.state(), f.run.year])
			if not _step(f):
				break
		_eq(trail.slice(0, 6).map(func(t): return t[0]), [&"calibration", &"calibration", &"calibration", &"calibration", &"calibration", &"calibration"], "CA-01 seed %d starts with 6 questions" % s)
		_eq(trail[6], [&"year_intro", 1], "CA-01 then Ano 1")
		_eq(trail.back()[0], &"final", "ends on the final screen")
		var years: Array = trail.filter(func(t): return t[0] == &"year_intro").map(func(t): return t[1])
		_eq(years, range(1, years.size() + 1), "CA-01 seed %d years in order" % s)
		_check(not trail.any(func(t): return t[0] == &"events" and t[1] == 1), "CA-02 no events in Ano 1")
		var last_year := 0
		for t in trail:
			_check(t[1] >= last_year, "year never goes back")
			last_year = t[1]


func _year_four_closing() -> void:
	# CA-03: after the last card of Ano 4, only step 6 (no relations nor bonus), then the final.
	var f := GameFlow.new(data)
	f.start(1)
	f.run.meters = {"dignity": 28, "awareness": 50, "sovereignty": 50, "security": 50, "integrity": 50, "treasury": 50, "political_capital": 50, "legitimacy": 50}
	f._begin_year(4)
	var before := f.run.meters.duplicate()
	f._close_turn()
	_eq(f.state(), &"final", "CA-03 final after Ano 4")
	_eq(f.run.meters, before, "CA-03 no relation (Dignidade 28 would cost Consciência −5)")


func _abandon() -> void:
	# CA-10: abandon in the calibration (3rd question) → start screen, no ending.
	var f := GameFlow.new(data)
	f.start(2)
	f.answer_calibration(1)
	f.answer_calibration(1)
	f.abandon()
	_eq([f.state(), f.run.ending], [&"start", {}], "CA-10 abandon in calibration")
	# CA-09: abandon in Ano 2 → Renúncia with quote, epilogue, axis and meters.
	f = GameFlow.new(data)
	f.start(2)
	while not (f.run.year == 2 and f.state() == &"card"):
		_step(f)
	f.abandon()
	var v := f.final_view()
	_eq([f.state(), v["ending"]["id"], v["ending"]["category_label"]], [&"final", "END-028", "Saída"], "CA-09 Renúncia")
	_check(v["ending"]["quote"] != "" and v["axis"]["said"].size() == 4 and v["meters"].size() == 8, "CA-09 complete final screen")
	f.abandon()
	_eq(f.state(), &"final", "no abandon on the final screen")
	# Abandon during the impeachment scene → Renúncia; the scene does not end (§5).
	f = GameFlow.new(data)
	f.start(2)
	f._begin_year(2)
	f._start_impeachment(["principal"], "next_year")
	f.abandon()
	_eq(f.final_view()["ending"]["id"], "END-028", "abandon in the scene → Renúncia")


func _resume_points() -> void:
	# CA-06: closed at the 4th card of Ano 3 → back to the same card and state.
	var f := GameFlow.new(data)
	f.start(5)
	while f.state() != &"final" and not (f.run.year == 3 and f.state() == &"card" and f.run.turn_cards.size() == 3):
		_step(f)
	if f.state() == &"final":
		failures.append("seed 5 did not reach the 4th card of Ano 3")
	else:
		var r := _reopen(f)
		_eq([r.state(), r.card_view()], [f.state(), f.card_view()], "CA-06 same card, same sides, same footer")
		_check(r.card_view()["footer"].ends_with("4/7"), "4th card")
		_eq(r.hud(), f.hud(), "same meters")
	# CA-07: closed on the consequence screen → consequence and learning again, read-only; the
	# choice is not offered again.
	f = GameFlow.new(data)
	f.start(5)
	while f.state() != &"consequence":
		_step(f)
	var r := _reopen(f)
	_eq([r.state(), r.consequence_view()["readonly"]], [&"consequence", true], "CA-07 consequence read-only")
	_eq(r.choose(1), {}, "CA-07 no new choice")
	_eq(r.consequence_view()["text"], f.consequence_view()["text"], "same consequence")
	_eq(r.consequence_view()["footer"], "Ano 1 · Lua de Mel · %d/7" % r.run.turn_cards.size(), "consequence footer survives the resume")
	r.continue_from_consequence()
	_eq(r.learning_view()["readonly"], true, "learning read-only")
	r.continue_from_learning()
	_eq([r.state(), r.run.readonly], [&"card", false], "next card is a normal one")
	# Calibration resumes at the question where it stopped.
	f = GameFlow.new(data)
	f.start(6)
	f.answer_calibration(1)
	f.answer_calibration(-1)
	r = _reopen(f)
	_eq([r.state(), r.calibration_view()], [&"calibration", f.calibration_view()], "calibration at the 3rd question")
	# Mid-impeachment: same phase, support kept.
	f = GameFlow.new(data)
	f.start(6)
	f._begin_year(2)
	f._start_impeachment(["principal"], "next_year")
	f.continue_impeachment()
	f.run.meters["awareness"] = 60
	f.choose_impeachment(int(f.run.impeachment["side_a"]))   # phase 1, option A passes
	f.continue_impeachment()
	f.continue_impeachment()
	r = _reopen(f)
	_eq([r.impeachment_view()["stage"], r.impeachment_view()["phase"], r.impeachment_view()["support"]], ["phase", 2, 1], "scene resumes at phase 2 with support 1")
	_eq(r.impeachment_view()["card"], f.impeachment_view()["card"], "same scene card and sides")
	# Events: the warning comes back read-only, effects not applied twice.
	f = GameFlow.new(data)
	f.start(6)
	f._begin_year(2)
	f.run.event_queue = [{"text": "E", "effects": {"dignity": -5}, "target": 2, "origin_id": "INST-001", "origin_title": "T", "seq": 0}]
	f.continue_from_year()
	r = _reopen(f)
	_eq([r.state(), r.event_view()["readonly"], r.run.meters["dignity"]], [&"events", true, f.run.meters["dignity"]], "event read-only, applied once")


func _determinism() -> void:
	# Same seed and choices → same run, with or without closing and reopening the app at
	# every 7th step (the RNG state travels in the save).
	for s in [8, 17, 33]:
		var a := GameFlow.new(data)
		a.start(s)
		while _step(a):
			pass
		var b := GameFlow.new(data)
		b.start(s)
		var n := 0
		while b.state() != &"final":
			n += 1
			if n % 7 == 0:
				b = _reopen(b)
			_step(b)
		_eq(b.final_view(), a.final_view(), "seed %d resumed run == uninterrupted run" % s)
		_eq(b.run.played, a.run.played, "seed %d same cards" % s)


func _rejected_saves() -> void:
	var f := GameFlow.new(data)
	f.start(4)
	var good := f.to_dict()
	_check(GameFlow.restore(data, good) != null, "valid save restores")
	var bad := good.duplicate(true)
	bad["format_version"] = 0
	_check(GameFlow.restore(data, bad) == null, "old format → rejected")
	bad = good.duplicate(true)
	bad.erase("meters")
	_check(GameFlow.restore(data, bad) == null, "missing meters → rejected")
	bad = good.duplicate(true)
	bad["year"] = {"x": 1}
	_check(GameFlow.restore(data, bad) == null, "wrong type → rejected, no script error")
	bad = good.duplicate(true)
	bad["played"] = ["INST-999"]
	_check(GameFlow.restore(data, bad) == null, "unknown card → rejected")
	bad = good.duplicate(true)
	bad["state"] = "final"
	_check(GameFlow.restore(data, bad) == null, "final is never resumed")
	var rs := RunState.from_dict(good)
	_eq(rs.to_dict(), good, "RunState round trip")


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
