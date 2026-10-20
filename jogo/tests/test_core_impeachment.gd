extends SceneTree
## gdd/sistemas/03_impeachment.md — triggers, the 5-card scene, scoreboards and §8 acceptance
## criteria; returns to the point where the run stopped (gdd 10 §3.2.6, CA-04).
## godot --headless --path jogo -s res://tests/test_core_impeachment.gd

var failures: PackedStringArray = []
var data: GameDatabase
var order: Array


func _initialize() -> void:
	data = GameDatabase.new()
	data.load_all()
	order = Array(data.meter_ids)
	_triggers()
	_scene_cards_data()
	_automatic_conviction()
	_support_rules()
	_pre_effect_test_and_no_multiplier()
	_acquittal_effects()
	_catastrophe_in_scene()
	_capital_zero_card_and_return()
	_alternative_trigger()
	_event_trigger()
	_closing_trigger_and_once_per_run()
	data.free()
	_done("test_core_impeachment")


func _meters(values: Dictionary, base: int = 50) -> Dictionary:
	var m := {}
	for id in order:
		m[id] = values.get(id, base)
	return m


func _flow(year: int, meters: Dictionary) -> GameFlow:
	var f := GameFlow.new(data)
	f.start(5)
	f.run.meters = _meters(meters)
	f._begin_year(year)
	return f


## Chooses `key` on the current phase card, first setting the tested meter so the test
## passes or fails (all scene tests use ">", gdd 03 §4.1).
func _phase(f: GameFlow, key: String, passes: bool) -> Dictionary:
	var imp := f.run.impeachment
	var card: Dictionary = data.impeachment_cards[int(imp["phase"]) - 1]
	var t: Dictionary = card[key]["test"]
	f.run.meters[t["meter"]] = int(t["value"]) + (1 if passes else 0)
	var side := int(imp["side_a"]) if key == "option_a" else -int(imp["side_a"])
	return f.choose_impeachment(side)


## Consequence → learning → next phase (or result).
func _advance(f: GameFlow) -> void:
	while f.state() == &"impeachment" and f.run.impeachment["stage"] in ["consequence", "learning"]:
		f.continue_impeachment()


## Plays the 5 phases: `plan` = [[key, passes], …].
func _play(f: GameFlow, plan: Array) -> void:
	f.continue_impeachment()   # intro → phase 1
	for step in plan:
		if f.state() != &"impeachment" or f.run.impeachment["stage"] != "phase":
			return
		_phase(f, step[0], step[1])
		_advance(f)


func _triggers() -> void:
	# CA-1: Legitimidade 18 and Capital Político 15 in Ano 2 → the scene opens.
	_eq(ImpeachmentRules.closing_triggers(_meters({"legitimacy": 18, "political_capital": 15}), 2), ["principal"], "CA-1 principal")
	_eq(ImpeachmentRules.closing_triggers(_meters({"legitimacy": 18, "political_capital": 15}), 1), [], "principal only from Ano 2")
	_eq(ImpeachmentRules.closing_triggers(_meters({"integrity": 19, "awareness": 19}), 3), ["crisis"], "crisis")
	_eq(ImpeachmentRules.closing_triggers(_meters({"political_capital": 0}), 1), ["capital_zero"], "capital 0 from Ano 1")
	# Two triggers at once → one scene; capital 0 among them → support ≥ 3 (§5).
	var both := ImpeachmentRules.closing_triggers(_meters({"political_capital": 0, "legitimacy": 10}), 2)
	_eq(both, ["capital_zero", "principal"], "two triggers")
	_eq(ImpeachmentRules.min_support(both), 3, "capital 0 → support ≥ 3")
	_eq(ImpeachmentRules.min_support(["principal"]), 2, "otherwise support ≥ 2")
	_check(ImpeachmentRules.alternative_fires(3, 2) and not ImpeachmentRules.alternative_fires(3, 1) and not ImpeachmentRules.alternative_fires(2, 2), "alternative: 3 in a row from Ano 2")
	# Through the closing of Ano 2 (relations first, then step 6).
	var f := _flow(2, {"legitimacy": 18, "political_capital": 15})
	f._close_turn()
	_eq(f.state(), &"impeachment", "CA-1 scene opens at the closing")
	_eq(f.run.impeachment["return_to"], "next_year", "closing scene returns to the next year")


func _scene_cards_data() -> void:
	_eq(data.impeachment_cards.size(), 5, "5 scene cards")
	var titles: Array = data.impeachment_cards.map(func(c): return c["title"])
	_eq(titles, ["O Pedido", "A Comissão", "A Votação", "O Julgamento", "O Desfecho"], "phase titles (docs/15 §15.07.2)")
	var tests: Array = data.impeachment_cards.map(func(c): return [c["option_a"]["test"]["meter"], int(c["option_a"]["test"]["value"]), c["option_b"]["test"]["meter"], int(c["option_b"]["test"]["value"])])
	_eq(tests, [["awareness", 45, "treasury", 45], ["integrity", 45, "political_capital", 25], ["awareness", 55, "political_capital", 35],
		["dignity", 50, "political_capital", 40], ["legitimacy", 45, "integrity", 51]], "tests of gdd 03 §4.1")


func _automatic_conviction() -> void:
	# CA-2: Integridade 12 and Consciência 12 at the start → automatic conviction.
	var f := _flow(2, {"integrity": 12, "awareness": 12})
	f._start_impeachment(["crisis"], "next_year")
	_eq(f.impeachment_view()["stage"], "intro", "scene starts at the intro")
	f.continue_impeachment()
	var v := f.impeachment_view()
	_eq([v["stage"], v["result"]["outcome"], v["result"]["automatic"]], ["result", "convicted", true], "CA-2 automatic conviction")
	_eq(v["scoreboard"]["votes"], 54, "Senate reaches 54 of 81 on conviction (§3.3)")
	f.continue_impeachment()
	_eq(f.final_view()["ending"]["id"], "END-007", "conviction → Impeachment")


func _support_rules() -> void:
	# CA-3: support 1 → conviction whatever the outcome card.
	var f := _flow(2, {})
	f._start_impeachment(["principal"], "next_year")
	_play(f, [["option_b", true], ["option_b", false], ["option_b", false], ["option_b", false], ["option_a", true]])
	_eq([f.impeachment_view()["support"], f.run.impeachment["outcome"]], [1, "convicted"], "CA-3 support 1 → conviction")
	# Support 2 and the outcome test → acquittal (principal); outcome test failing → conviction.
	f = _flow(2, {})
	f._start_impeachment(["principal"], "next_year")
	_play(f, [["option_a", true], ["option_b", true], ["option_a", false], ["option_b", false], ["option_b", true]])
	_eq(f.run.impeachment["outcome"], "acquitted", "support 2 + outcome test → acquitted")
	f = _flow(2, {})
	f._start_impeachment(["principal"], "next_year")
	_play(f, [["option_a", true], ["option_a", true], ["option_a", true], ["option_a", true], ["option_a", false]])
	_eq([f.run.impeachment["support"], f.run.impeachment["outcome"]], [4, "convicted"], "outcome test failing → conviction")
	# CA-6: scene opened by capital 0, support 2, outcome passing → conviction.
	f = _flow(2, {})
	f._start_impeachment(["capital_zero"], "consequence")
	_play(f, [["option_a", true], ["option_b", true], ["option_a", false], ["option_b", false], ["option_b", true]])
	_eq(f.run.impeachment["outcome"], "convicted", "CA-6 capital 0 needs support 3")
	# Scoreboards (§3.3): committee approves when phase 2 is lost; Chamber 342 when phase 3 is lost.
	f = _flow(2, {})
	f._start_impeachment(["principal"], "next_year")
	f.continue_impeachment()
	_phase(f, "option_a", true)
	_advance(f)
	_eq(f.impeachment_view()["scoreboard"]["kind"], "committee", "phase 2 shows the committee")
	_phase(f, "option_a", false)
	_eq(f.impeachment_view()["scoreboard"]["reached"], true, "phase 2 lost → committee approves")
	_advance(f)
	_eq(f.impeachment_view()["scoreboard"]["votes"], null, "Chamber count unknown before the choice")
	_phase(f, "option_b", false)
	_eq(f.impeachment_view()["scoreboard"]["votes"], 342, "phase 3 lost → 342 of 513")
	_advance(f)
	_eq([f.impeachment_view()["scoreboard"]["total"], f.impeachment_view()["scoreboard"]["quorum"]], [81, 54], "phase 4 shows the Senate target")


func _pre_effect_test_and_no_multiplier() -> void:
	# §3.2.3: the test uses the value before the effect. CA-7: no year multiplier (×1) in Ano 4.
	var f := _flow(4, {"awareness": 40})
	f._start_impeachment(["principal"], "finals")
	f.continue_impeachment()
	var side_a := int(f.run.impeachment["side_a"])
	var r := f.choose_impeachment(side_a)   # phase 1 option A: test awareness > 45, awareness +10
	_eq(r["test_passed"], false, "test reads the value before the effect")
	_eq(f.run.meters["awareness"], 50, "CA-7 ×1 in Ano 4 (+10, not +15)")
	_check(f.run.governed_count[3] == 1, "scene cards score the axis (gdd 04 §3.2)")
	var v := f.impeachment_view()
	_eq(v["stage"], "consequence", "consequence after each phase card (T-09.2)")
	f.continue_impeachment()
	_eq(f.impeachment_view()["stage"], "learning", "then its learning card")
	_check(f.impeachment_view()["learning"]["lived"] != "", "scene learning card")


func _acquittal_effects() -> void:
	# CA-4: acquittal with Capital Político 40 → stays 40; Legitimidade +10. The outcome is
	# computed when leaving the last learning card; the values are set just before.
	var f := _flow(3, {})
	f._start_impeachment(["principal"], "next_year")
	_play(f, [["option_a", true], ["option_a", true], ["option_a", false], ["option_a", false]])
	_phase(f, "option_a", true)
	f.continue_impeachment()
	f.run.meters["political_capital"] = 40
	f.run.meters["legitimacy"] = 50
	f.continue_impeachment()
	_eq([f.run.impeachment["outcome"], f.run.meters["political_capital"], f.run.meters["legitimacy"]], ["acquitted", 40, 60], "CA-4 capital stays 40, legitimacy +10")
	_eq(f.impeachment_view()["scoreboard"]["votes"], null, "acquittal: Senate below the quorum, count undefined")
	f.continue_impeachment()
	_eq([f.state(), f.run.year], [&"year_intro", 4], "acquittal at a closing → next year")
	# Capital below 20 is raised to 20.
	_eq(ImpeachmentRules.acquittal_effects(_meters({"political_capital": 3})), {"political_capital": 17, "legitimacy": 10}, "capital = max(current; 20)")


func _catastrophe_in_scene() -> void:
	# §5: another meter at 0 in the scene → catastrophe; the scene stops.
	var f := _flow(2, {"treasury": 45})
	f._start_impeachment(["principal"], "next_year")
	f.continue_impeachment()
	f.run.meters["treasury"] = 10
	var r := f.choose_impeachment(-int(f.run.impeachment["side_a"]))   # phase 1 option B: treasury −10
	_eq([r["next"], r["ending_id"]], [&"final", "END-006"], "meter at 0 in the scene → catastrophe")
	# §3.2.7: capital at 0 during the scene does nothing.
	f = _flow(2, {"political_capital": 0})
	f._start_impeachment(["capital_zero"], "next_year")
	_play(f, [["option_a", true], ["option_a", true], ["option_a", true], ["option_a", true]])
	_eq(f.state(), &"impeachment", "capital 0 inside the scene does not end it")


func _capital_zero_card_and_return() -> void:
	# gdd 10 CA-04: capital at 0 on the 3rd card of Ano 2, acquittal → the turn goes on at the 4th.
	var card := _synthetic("INST-991", {"political_capital": -30, "dignity": 5}, [{"text": "Evento X", "delay": 1, "effects": {"dignity": 5}}])
	var f := _flow(2, {"political_capital": 10})
	f.run.state = &"card"
	f.run.turn_cards = ["INST-001", "INST-021"]
	f.run.played = ["INST-001", "INST-021"]
	f.run.current_card = {"id": card["id"], "kind": "draw", "target": "", "side_a": 1}
	var r := f.choose(1)
	_eq(r["next"], &"impeachment", "gdd 05 CA-09 capital 0 → scene")
	_eq(f.run.governed_count[0], 1, "axis added before the scene (step 2)")
	_eq(f.run.event_queue.size(), 0, "event not scheduled yet (steps 3-4 after the scene)")
	_eq(f.run.impeachment["min_support"], 3, "capital 0 → support 3")
	_play(f, [["option_a", true], ["option_a", true], ["option_a", true], ["option_b", false], ["option_a", true]])
	_eq(f.run.impeachment["outcome"], "acquitted", "acquitted")
	f.continue_impeachment()
	_eq(f.state(), &"consequence", "back to the card's consequence")
	_eq(f.run.event_queue.size(), 1, "event scheduled after acquittal")
	f.continue_from_consequence()
	f.continue_from_learning()
	_eq(f.state(), &"card", "next card")
	_check(f.card_view()["footer"].ends_with("4/7"), "CA-04 the turn continues at the 4th card (%s)" % f.card_view()["footer"])
	# CA-5: capital at 0 again → Impeachment ending at once.
	f.run.meters["political_capital"] = 5
	f.run.current_card = {"id": card["id"], "kind": "draw", "target": "", "side_a": 1}
	f.run.played.erase(card["id"])
	r = f.choose(1)
	_eq([r["next"], r["ending_id"]], [&"final", "END-007"], "CA-5 second capital 0 → Impeachment")


func _alternative_trigger() -> void:
	var card := _synthetic("INST-992", {"political_capital": -5, "dignity": 5}, [])
	for year in [1, 2]:
		var f := _flow(year, {})
		for i in 3:
			f.run.state = &"card"
			f.run.current_card = {"id": card["id"], "kind": "draw", "target": "", "side_a": 1}
			f.run.played.erase(card["id"])
			f.choose(1)
			f.continue_from_consequence()
			f.continue_from_learning()
		if year == 1:
			_check(f.run.impeachment.is_empty(), "alternative not before Ano 2")
		else:
			_eq([f.state(), f.run.impeachment["triggers"], f.run.impeachment["min_support"]], [&"impeachment", ["alternative"], 2], "3 options lowering capital → scene after the 3rd card")


func _event_trigger() -> void:
	# gdd 08 CA-09: an event zeroes capital → the scene opens; afterwards the other events fire.
	var f := _flow(3, {"political_capital": 10})
	f.run.event_queue = [
		{"text": "E1", "effects": {"political_capital": -20}, "target": 3, "origin_id": "INST-001", "origin_title": "T", "seq": 0},
		{"text": "E2", "effects": {"dignity": 10}, "target": 3, "origin_id": "INST-001", "origin_title": "T", "seq": 1},
	]
	f.continue_from_year()
	_eq([f.state(), f.event_view()["outcome"]], [&"events", "impeachment"], "event view announces the scene")
	f.continue_from_event()
	_eq(f.state(), &"impeachment", "scene after the event")
	_play(f, [["option_a", true], ["option_a", true], ["option_a", true], ["option_a", false], ["option_a", true]])
	f.continue_impeachment()
	_eq([f.state(), f.event_view()["text"]], [&"events", "E2"], "remaining event fires after the scene")


func _closing_trigger_and_once_per_run() -> void:
	# Ano 4 trigger → the scene before the finals (gdd 02 §3.3); acquittal → finals.
	var f := _flow(4, {"legitimacy": 15, "political_capital": 15})
	f._close_turn()
	_eq([f.state(), f.run.impeachment["return_to"]], [&"impeachment", "finals"], "Ano 4 trigger → scene first")
	_play(f, [["option_a", true], ["option_a", true], ["option_a", true], ["option_a", true], ["option_a", true]])
	f.continue_impeachment()
	_eq(f.state(), &"final", "acquittal at the end of Ano 4 → finals")
	_eq(f.final_view()["reason"], "end_of_term", "end-of-term ending after the scene")
	# A trigger after the scene happened is ignored (§5).
	f = _flow(2, {})
	f.run.impeachment = {"triggers": ["principal"], "outcome": "acquitted", "stage": "done"}
	f.run.meters = _meters({"legitimacy": 15, "political_capital": 15})
	f._close_turn()
	_eq([f.state(), f.run.year], [&"year_intro", 3], "second trigger ignored")


func _synthetic(id: String, eff_a: Dictionary, events_a: Array) -> Dictionary:
	var card := {
		"id": id, "title": "Teste", "mode": "congress", "type": "institutional", "problem": "Teste",
		"option_a": {"text": "A", "color": "red", "axis": [1, 0, 0, 0], "effects": eff_a, "actors": {}, "events": events_a, "consequence": "cA"},
		"option_b": {"text": "B", "color": "blue", "axis": [0, 0, 0, 0], "effects": {"dignity": -5, "treasury": 5}, "actors": {}, "events": [], "consequence": "cB"},
		"learning_id": "APR-001", "prerequisites": {"min_year": 1},
	}
	data.cards[id] = card
	return card


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
