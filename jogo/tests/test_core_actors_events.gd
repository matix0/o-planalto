extends SceneTree
## gdd/sistemas/07_atores.md and 08_eventos.md — §4 examples and acceptance criteria.
## godot --headless --path jogo -s res://tests/test_core_actors_events.gd

var failures: PackedStringArray = []
var data: GameDatabase
var order: Array


func _initialize() -> void:
	data = GameDatabase.new()
	data.load_all()
	order = Array(data.meter_ids)
	_actors()
	_event_schedule()
	_event_firing()
	_event_endings()
	data.free()
	_done("test_core_actors_events")


func _meters(values: Dictionary, base: int = 50) -> Dictionary:
	var m := {}
	for id in order:
		m[id] = values.get(id, base)
	return m


func _flow(year: int, meters: Dictionary = {}) -> GameFlow:
	var f := GameFlow.new(data)
	f.start(13)
	f.run.meters = _meters(meters)
	f._begin_year(year)
	return f


func _actors() -> void:
	var levels: Array = data.balance["actor_levels"]
	# CA-06: the 24 actors start at 50 (Neutro).
	var f := GameFlow.new(data)
	f.start(1)
	_check(f.run.actors.size() == 24 and f.run.actors.values().all(func(v): return v == 50), "CA-06 24 actors at 50")
	# §4 example: three contrary options 50 → 40 → 30 → 20 (Furioso); one favour → 30.
	var a := {"ACT-001": 50}
	for _i in 3:
		ActorRules.apply(a, {"ACT-001": -1}, 10)
	_eq([a["ACT-001"], ActorRules.level_of(20, levels)["id"]], [20, "furious"], "§4 example → Furioso")
	ActorRules.apply(a, {"ACT-001": 1}, 10)
	_eq(ActorRules.role_of(a["ACT-001"], levels), "demand", "back to Insatisfeito → demand")
	# CA-08: six contrary options → stops at 0.
	a = {"ACT-001": 50}
	for _i in 6:
		ActorRules.apply(a, {"ACT-001": -1}, 10)
	_eq(a["ACT-001"], 0, "CA-08 clamps at 0")
	# Level limits (§3.2).
	var ids: Array = [20, 21, 40, 41, 60, 61, 80, 81, 100].map(func(v): return ActorRules.level_of(v, levels)["id"])
	_eq(ids, ["furious", "dissatisfied", "dissatisfied", "neutral", "neutral", "satisfied", "satisfied", "ally", "ally"], "level limits")
	# CA-07: −10 with no year multiplier, in any year (Ano 4 here).
	data.cards["INST-994"] = _card("INST-994", {"dignity": -5, "treasury": 5}, [], {"ACT-001": -1})
	f = _flow(4)
	f.run.state = &"card"
	f.run.current_card = {"id": "INST-994", "kind": "draw", "target": "", "side_a": 1}
	f.choose(1)
	_eq(f.run.actors["ACT-001"], 40, "CA-07 −10 in Ano 4")


func _event_schedule() -> void:
	var run := RunState.new()
	# §4: X + delay; > 4 → epilogue without effect (CA-06).
	EventRules.schedule(run, [{"text": "A", "delay": 2, "effects": {"dignity": -15}}], 1, "INST-001", "T")
	EventRules.schedule(run, [{"text": "B", "delay": 2, "effects": {"dignity": -15}}], 2, "INST-001", "T")
	EventRules.schedule(run, [{"text": "C", "delay": 2, "effects": {"dignity": -15}}], 3, "INST-001", "T")
	_eq(run.event_queue.map(func(e): return [e["text"], e["target"]]), [["A", 3], ["B", 4]], "targets X + delay")
	_eq(run.epilogue, ["C"], "CA-06 target 5 → epilogue")
	_eq(EventRules.take_due(run, 2), [], "nothing due in Ano 2")
	_eq(EventRules.take_due(run, 3).map(func(e): return e["text"]), ["A"], "due in Ano 3")


func _event_firing() -> void:
	# CA-04 + §4 example: Ano 1 option with delay 2 → warning at the start of Ano 3, before the
	# first card, at ×1,0 (−15).
	data.cards["INST-995"] = _card("INST-995", {"dignity": -5, "treasury": 5}, [{"text": "Epidemia na periferia", "delay": 2, "effects": {"dignity": -15}}], {})
	var f := _flow(1)
	f.run.state = &"card"
	f.run.current_card = {"id": "INST-995", "kind": "draw", "target": "", "side_a": 1}
	f.choose(1)
	_eq(f.run.event_queue[0]["target"], 3, "scheduled for Ano 3")
	f._close_turn()
	f.continue_from_year()
	_check(f.state() != &"events", "CA-02 (gdd 10) no event in Ano 2 for this one")
	f._close_turn()
	_eq(f.run.year, 3, "Ano 3")
	f.run.meters["dignity"] = 60
	f.continue_from_year()
	var v := f.event_view()
	_eq([f.state(), v["text"], v["index"], v["total"]], [&"events", "Epidemia na periferia", 1, 1], "CA-04 warning before the first card")
	_eq(f.run.meters["dignity"], 45, "§4 example −15 at ×1,0")
	_eq(v["origin_title"], "Teste", "origin card title")
	_eq(v["footer"], "Ano 3 · Crise", "event footer: year and phase, no card count")
	f.continue_from_event()
	_eq(f.state(), &"card", "then the cards")
	# CA-05: Dignidade −15 firing in Ano 4 → −23.
	f = _flow(4, {"dignity": 60})
	f.run.event_queue = [_ev("X", {"dignity": -15}, 4, 0)]
	f.continue_from_year()
	_eq(f.run.meters["dignity"], 37, "CA-05 −15 × 1,5 → −23")
	# CA-07: two events with the same target fire in scheduling order, each with its screen.
	f = _flow(2)
	f.run.event_queue = [_ev("second", {"treasury": 5}, 2, 1), _ev("first", {"dignity": 5}, 2, 0)]
	f.continue_from_year()
	var seen: Array = []
	while f.state() == &"events":
		seen.append(f.event_view()["text"])
		f.continue_from_event()
	_eq(seen, ["first", "second"], "CA-07 scheduling order")


func _event_endings() -> void:
	# CA-08: an event zeroes Dignidade with another in the queue → catastrophe; the other one
	# goes to the epilogue.
	var f := _flow(3, {"dignity": 10})
	f.run.event_queue = [_ev("fatal", {"dignity": -20}, 3, 0), _ev("later", {"dignity": 5}, 3, 1), _ev("next year", {"treasury": 5}, 4, 2)]
	f.continue_from_year()
	var v := f.event_view()
	_eq([v["outcome"], v["ending_id"]], ["final", "END-001"], "event view announces the final")
	f.continue_from_event()
	_eq(f.state(), &"final", "CA-08 catastrophe after the warning")
	_eq(f.final_view()["epilogue"], ["later", "next year"], "CA-08 the others go to the epilogue")
	# CA-12: final with no queued events → empty epilogue (the screen hides the section).
	f = _flow(4)
	f._close_turn()
	_eq(f.final_view()["epilogue"], [], "CA-12 empty epilogue")
	# Abandon with queued events → they go to the Renúncia epilogue (gdd 08 §3.4).
	f = _flow(2)
	f.run.event_queue = [_ev("pending", {"dignity": 5}, 3, 0)]
	f.run.state = &"card"
	f.run.current_card = {"id": "INST-001", "kind": "draw", "target": "", "side_a": 1}
	f.abandon()
	_eq([f.final_view()["ending"]["id"], f.final_view()["epilogue"]], ["END-028", ["pending"]], "Renúncia keeps the epilogue")


func _ev(text: String, effects: Dictionary, target: int, seq: int) -> Dictionary:
	return {"text": text, "effects": effects, "target": target, "origin_id": "INST-001", "origin_title": "T", "seq": seq}


func _card(id: String, eff_a: Dictionary, events_a: Array, actors_a: Dictionary) -> Dictionary:
	return {
		"id": id, "title": "Teste", "mode": "congress", "type": "institutional", "problem": "Teste",
		"option_a": {"text": "A", "color": "red", "axis": [0, 0, 0, 0], "effects": eff_a, "actors": actors_a, "events": events_a, "consequence": "cA"},
		"option_b": {"text": "B", "color": "blue", "axis": [0, 0, 0, 0], "effects": {"dignity": -5, "treasury": 5}, "actors": {}, "events": [], "consequence": "cB"},
		"learning_id": "APR-001", "prerequisites": {"min_year": 1},
	}


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
