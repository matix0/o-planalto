extends SceneTree
## gdd/sistemas/05_cartas.md and 06_sorteio.md — card views, side draw, resolution, and
## the draw (eligibility, mandatory cards, random slots), with their acceptance criteria;
## gdd 07 CA-09/10 (role per level) and gdd 09 CA-08 (crisis pulls a linked card).
## godot --headless --path jogo -s res://tests/test_core_cards_draw.gd

var failures: PackedStringArray = []
var data: GameDatabase
var order: Array


func _initialize() -> void:
	data = GameDatabase.new()
	data.load_all()
	order = Array(data.meter_ids)
	_side_draw()
	_card_view()
	_resolution()
	_zeroing_option()
	_eligibility()
	_mandatory_cap()
	_mandatory_edge_cases()
	_turn_variety_and_size()
	_emergency_and_attack_next_turn()
	_uniform_draw()
	_no_repetition()
	data.free()
	_done("test_core_cards_draw")


func _meters(values: Dictionary, base: int = 50) -> Dictionary:
	var m := {}
	for id in order:
		m[id] = values.get(id, base)
	return m


func _flow(year: int, meters: Dictionary = {}) -> GameFlow:
	var f := GameFlow.new(data)
	f.start(9)
	f.run.meters = _meters(meters)
	f._begin_year(year)
	return f


func _side_draw() -> void:
	# gdd 05 CA-05: 1,000 displays → option A on a given side 45%-55%.
	var rng := RandomNumberGenerator.new()
	rng.seed = 2026
	var minus := 0
	for _i in 1000:
		if CardRules.draw_side(rng) == -1:
			minus += 1
	_check(minus >= 450 and minus <= 550, "gdd 05 CA-05 side draw %d/1000" % minus)
	_eq(CardRules.option_key(1, -1), "option_b", "side → option")


func _card_view() -> void:
	var f := _flow(1)
	f.run.state = &"card"
	f.run.current_card = {"id": "INST-001", "kind": "draw", "target": "", "side_a": -1}
	var v := f.card_view()
	_eq(v["sides"][-1]["text"], data.cards["INST-001"]["option_a"]["text"], "option A on side −1")
	_eq(v["sides"][1]["color"], data.cards["INST-001"]["option_b"]["color"], "option B colour on side +1")
	_eq(v["footer"], "Ano 1 · Lua de Mel · 1/7", "footer")
	_eq([v["speaker"], v["speaker_actor"], v["mode_name"]], ["Congresso", "", "Congresso"], "institutional speaker = mode (D-164)")
	f.run.current_card = {"id": "ATOR-002", "kind": "draw", "target": "", "side_a": 1}
	_eq([f.card_view()["speaker"], f.card_view()["speaker_actor"]], ["Latifundiários", "ACT-001"], "actor card speaker")
	f.run.current_card = {"id": "THEM-001", "kind": "draw", "target": "", "side_a": 1}
	_eq(f.card_view()["speaker"], GameDatabase.SPEAKER_TBD, "thematic speaker undefined")
	_eq(data.speaker_for({"quem_fala": "ACT-010", "type": "institutional", "mode": "congress"})["actor"], "ACT-010", "quem_fala wins")
	# Calibration: no party colour (D-166).
	var c := GameFlow.new(data)
	c.start(1)
	var cv := c.calibration_view()
	_check(cv["sides"][-1]["color"] == "" and cv["sides"][1]["color"] == "", "calibration sides without colour")
	_eq([cv["index"], cv["total"]], [1, 6], "calibration progress")


func _resolution() -> void:
	# gdd 05 CA-07 order: effects → axis → actors → event → consequence → learning.
	var f := _flow(1)
	f.run.state = &"card"
	f.run.current_card = {"id": "INST-001", "kind": "draw", "target": "", "side_a": 1}
	var r := f.choose(1)   # option A: political_capital +25, legitimacy +10, integrity −25, treasury −5; ACT-004 +1; event (delay 2)
	_eq(r["next"], &"consequence", "consequence after the choice")
	_eq(f.run.meters["political_capital"], 56, "effects ×0,25 (25 → 6)")
	_eq(f.run.governed_count, [1, 1, 1, 1], "governed axis")
	_eq(f.run.actors["ACT-004"], 60, "actor +10 (gdd 07 CA-07)")
	_eq([f.run.event_queue.size(), f.run.event_queue[0]["target"]], [1, 3], "event scheduled for Ano 1 + 2")
	_eq(f.consequence_view()["text"], data.cards["INST-001"]["option_a"]["consequence"], "consequence text")
	_check(f.consequence_view()["changes"].all(func(c): return c.has("dot") and c.has("name")), "changes carry name and dot")
	f.continue_from_consequence()
	var l := f.learning_view()
	_eq([l["id"], l["readonly"]], ["APR-001", false], "learning card of the card")
	_check(l["source"].has("label") and l["source"].has("url"), "source {label, url}")
	# gdd 08 CA-03: only the chosen option schedules (option B of INST-001 has no event).
	f = _flow(1)
	f.run.state = &"card"
	f.run.current_card = {"id": "INST-001", "kind": "draw", "target": "", "side_a": 1}
	f.choose(-1)
	_eq(f.run.event_queue.size(), 0, "gdd 08 CA-03 other option's event not scheduled")
	# gdd 09: the influencer card's learning card names the technique.
	f = _flow(1)
	f.run.state = &"card"
	f.run.current_card = {"id": "INST-181", "kind": "draw", "target": "", "side_a": 1}
	f.choose(1)
	f.continue_from_consequence()
	_eq(f.learning_view()["technique"], "Fazenda de IA", "technique named (gdd 09 §3.2)")


func _zeroing_option() -> void:
	# gdd 05 CA-08 / gdd 07 CA-11 / gdd 08 CA-11: everything up to 2b, then the final; no event.
	data.cards["INST-993"] = {
		"id": "INST-993", "title": "Teste", "mode": "congress", "type": "institutional", "problem": "Teste",
		"option_a": {"text": "A", "color": "red", "axis": [2, 0, 0, 0], "effects": {"dignity": -30, "treasury": 10},
			"actors": {"ACT-002": -1}, "events": [{"text": "Nunca", "delay": 2, "effects": {"dignity": 5}}], "consequence": "cA"},
		"option_b": {"text": "B", "color": "blue", "axis": [0, 0, 0, 0], "effects": {"dignity": -5, "treasury": 5},
			"actors": {}, "events": [], "consequence": "cB"},
		"learning_id": "APR-001", "prerequisites": {"min_year": 1},
	}
	var f := _flow(3, {"dignity": 20})
	f.run.state = &"card"
	f.run.current_card = {"id": "INST-993", "kind": "draw", "target": "", "side_a": 1}
	var r := f.choose(1)
	_eq([r["next"], r["ending_id"]], [&"final", "END-001"], "CA-08 final at once (Barbárie)")
	_eq(f.run.meters["treasury"], 60, "all effects applied")
	_eq(f.run.governed_sum[0], 2, "axis summed")
	_eq(f.run.actors["ACT-002"], 40, "actor updated before the final")
	_check(not f.run.epilogue.has("Nunca"), "event neither scheduled nor in the epilogue")
	_eq(f.consequence_view(), {}, "no consequence screen")
	data.cards.erase("INST-993")


func _eligibility() -> void:
	var run := _flow(2).run
	# CA-03: min_year 3 in Ano 2; learning card missing; impeachment type.
	_check(not DrawRules.is_eligible(data, run, "INST-002"), "CA-03 min_year 3 not in Ano 2")
	run.year = 3
	_check(DrawRules.is_eligible(data, run, "INST-002"), "min_year 3 in Ano 3")
	var saved: Dictionary = data.learning["APR-001"]
	data.learning.erase("APR-001")
	_check(not DrawRules.is_eligible(data, run, "INST-001"), "gdd 05 CA-12 no learning card → never drawn")
	data.learning["APR-001"] = saved
	data.cards["IMP-9"] = data.impeachment_cards[0].duplicate(true)
	_check(not DrawRules.is_eligible(data, run, "IMP-9"), "impeachment cards only in the scene")
	data.cards.erase("IMP-9")
	run.played.append("INST-001")
	_check(not DrawRules.is_eligible(data, run, "INST-001"), "played card not eligible")
	# CA-04 / gdd 07 CA-09: only the card of the actor's current level.
	run.actors["ACT-001"] = 50
	_eq(["ATOR-001", "ATOR-002", "ATOR-003"].filter(func(id): return DrawRules.is_eligible(data, run, id)), ["ATOR-002"], "CA-04 neutral → demand only")
	run.actors["ACT-001"] = 20
	_eq(["ATOR-001", "ATOR-002", "ATOR-003"].filter(func(id): return DrawRules.is_eligible(data, run, id)), ["ATOR-001"], "furious → attack only")
	run.actors["ACT-001"] = 61
	_eq(["ATOR-001", "ATOR-002", "ATOR-003"].filter(func(id): return DrawRules.is_eligible(data, run, id)), ["ATOR-003"], "satisfied → offer")
	# gdd 07 CA-10: actor without an offer card, as Ally → nothing eligible.
	run.actors["ACT-010"] = 90
	_eq(["ATOR-004", "ATOR-005"].filter(func(id): return DrawRules.is_eligible(data, run, id)), [], "gdd 07 CA-10")


func _mandatory_cap() -> void:
	# CA-07: 1 emergency, 2 furious actors, 2 meters < 30 → emergency, lowest-satisfaction
	# actor, the other actor; no meter card. (Legitimidade's linked cards are never actor
	# cards, so the emergency cannot be one of the attacks — that would count once, §5.)
	var f := _flow(2, {"legitimacy": 8, "treasury": 20, "dignity": 25})
	var run := f.run
	run.emergency_pending = ["legitimacy"]
	run.actors["ACT-001"] = 10
	run.actors["ACT-010"] = 20
	var list := DrawRules.build_mandatory(data, run, f.rng)
	_eq(list.map(func(e): return e["kind"]), ["emergency", "actor", "actor"], "CA-07 kinds")
	_eq([list[1]["card"], list[2]["card"]], ["ATOR-001", "ATOR-004"], "CA-07 lowest satisfaction first")
	_check(CardRules.is_linked(data.cards[list[0]["card"]], "legitimacy"), "emergency card linked to its meter")
	_eq(run.emergency_pending, [], "pending emergencies moved to the turn")
	# CA-08: the 2nd actor back to Insatisfeito → its attack is no longer mandatory.
	run.actors["ACT-010"] = 30
	run.emergency_pending = []
	list = DrawRules.build_mandatory(data, run, f.rng)
	_eq(list.map(func(e): return e["card"]).has("ATOR-004"), false, "CA-08 excess dropped, checked again")
	_eq(list[0]["card"], "ATOR-001", "attack first")
	# Em ≥ 3 → no actor or meter card that turn (§4).
	run.emergency_pending = ["dignity", "treasury", "legitimacy"]
	list = DrawRules.build_mandatory(data, run, f.rng)
	_eq(list.map(func(e): return e["kind"]), ["emergency", "emergency", "emergency"], "emergencies fill the cap")
	# gdd 09 CA-08: Integridade 25 → a card linked to Integridade among the mandatory ones.
	f = _flow(1, {"integrity": 25})
	list = DrawRules.build_mandatory(data, f.run, f.rng)
	_check(list.any(func(e): return CardRules.is_linked(data.cards[e["card"]], "integrity")), "gdd 09 CA-08 linked card")


func _mandatory_edge_cases() -> void:
	# §5: no eligible linked card → the emergency is not spent.
	var f := _flow(3, {"integrity": 9})
	for id in data.cards:
		if CardRules.is_linked(data.cards[id], "integrity"):
			f.run.played.append(id)
	f.run.emergency_pending = ["integrity"]
	var list := DrawRules.build_mandatory(data, f.run, f.rng)
	_check(list.all(func(e): return e["kind"] != "emergency"), "no linked card → no emergency entry")
	_check(not f.run.emergency_used.has("integrity"), "emergency not spent")
	# §5: the same card serving two obligations counts once; every listed meter is served.
	f = _flow(1, {"dignity": 25, "integrity": 25})
	list = DrawRules.build_mandatory(data, f.run, f.rng)
	var cards: Array = list.map(func(e): return e["card"])
	for m in ["dignity", "integrity"]:
		_check(cards.any(func(id): return CardRules.is_linked(data.cards[id], m)), "%s served" % m)
	_eq(cards.size(), cards.reduce(func(acc, id): return acc if acc.has(id) else acc + [id], []).size(), "no duplicate cards")
	# §5: a mandatory card no longer eligible at display → the slot goes to the draw.
	f = _flow(2)
	f.run.turn_mandatory = [{"card": "ATOR-001", "kind": "actor", "target": "ACT-001"}]
	var e := DrawRules.next_entry(data, f.run, f.rng)
	_eq(e["kind"], "draw", "stale mandatory card → random slot")
	# §5: emergencies left over by a full turn come first next turn.
	f = _flow(2)
	f.run.turn_mandatory = [{"card": "INST-063", "kind": "emergency", "target": "dignity"}]
	f.run.meters["dignity"] = 30
	f._close_turn()
	_eq(f.run.emergency_pending, ["dignity"], "unshown emergency carried over")
	# CA-10: only cards of modes already seen → the mode rule is relaxed.
	f = _flow(1)
	for id in data.cards:
		if data.cards[id]["mode"] != "impeachment":
			f.run.played.append(id)
	f.run.turn_cards = ["INST-142"]
	f.run.played.append("INST-142")
	_check(DrawRules.draw_random(data, f.run, f.rng) in ["THEM-002", "THEM-004", "THEM-005"], "CA-10 relaxed mode rule")
	# CA-13: Ano 4 with a meter ≤ 10 at the end → no emergency, final screen.
	f = _flow(4, {"dignity": 8})
	f._close_turn()
	_eq([f.state(), f.run.emergency_pending], [&"final", []], "CA-13 no emergency after Ano 4")


func _turn_variety_and_size() -> void:
	# CA-09 + CA-02: a turn with no mandatory cards → 7 cards of 7 different modes.
	var f := _flow(1)
	f.continue_from_year()
	var modes: Array = []
	while f.state() == &"card":
		modes.append(data.cards[f.run.current_card["id"]]["mode"])
		f.choose(int(f.run.current_card["side_a"]))
		f.continue_from_consequence()
		f.continue_from_learning()
	_eq(modes.size(), 7, "CA-02 7 cards in the turn")
	_eq(modes.reduce(func(acc, m): return acc if acc.has(m) else acc + [m], []).size(), 7, "CA-09 7 different modes")
	_eq([f.state(), f.run.year], [&"year_intro", 2], "closing after 7 cards → next year")


func _emergency_and_attack_next_turn() -> void:
	# CA-06 / gdd 01 CA-8: Dignidade closes at 9 → 1st card of the next turn raises it; at 9
	# again later → no second emergency.
	var f := _flow(1, {"dignity": 9})
	f._close_turn()
	_eq(f.run.emergency_pending, ["dignity"], "emergency requested at the closing")
	f.continue_from_year()
	_eq(f.run.current_card["kind"], "emergency", "1st card is the emergency")
	_check(CardRules.is_linked(data.cards[f.run.current_card["id"]], "dignity"), "CA-06 option with Dignidade positive")
	_eq(f.run.emergency_used, ["dignity"], "emergency spent when shown")
	f.run.meters["dignity"] = 9
	f._close_turn()
	_eq(f.run.emergency_pending, [], "gdd 01 CA-8 no second emergency")
	# gdd 08 CA-10: events fire before the emergency card.
	f = _flow(1, {"treasury": 9})
	f._close_turn()
	f.run.event_queue = [{"text": "E", "effects": {"dignity": 5}, "target": 2, "origin_id": "INST-001", "origin_title": "T", "seq": 0}]
	f.continue_from_year()
	_eq(f.state(), &"events", "event first")
	f.continue_from_event()
	_eq(f.run.current_card["kind"], "emergency", "then the emergency card")
	# CA-05: a furious actor at the end of the turn → its attack among the first 3 cards.
	f = _flow(1)
	f.run.actors["ACT-001"] = 20
	f._close_turn()
	f.continue_from_year()
	var first: Array = []
	while first.size() < 3 and f.state() == &"card":
		first.append(f.run.current_card["id"])
		f.choose(int(f.run.current_card["side_a"]))
		f.continue_from_consequence()
		f.continue_from_learning()
	_check(first.has("ATOR-001"), "CA-05 attack among the first 3 (%s)" % str(first))


func _uniform_draw() -> void:
	# CA-12: 10,000 draws of a slot with 40 eligible cards → each between 2.0% and 3.0%.
	var pool: Array = []
	for i in 40:
		pool.append("C%02d" % i)
	var rng := RandomNumberGenerator.new()
	rng.seed = 12
	var count := {}
	for _i in 10000:
		var id := DrawRules.pick_uniform(pool, rng)
		count[id] = count.get(id, 0) + 1
	_check(pool.all(func(id): return count.get(id, 0) >= 200 and count.get(id, 0) <= 300), "CA-12 equal chance")


func _no_repetition() -> void:
	# CA-01 (and CA-11 short deck): many runs, no card twice, at most 7 per turn, no hang.
	for s in range(1, 81):
		var f := GameFlow.new(data)
		f.start(s)
		var per_turn := {}
		var steps := 0
		while f.state() != &"final" and steps < 800:
			steps += 1
			match f.state():
				&"calibration": f.answer_calibration(1)
				&"year_intro": f.continue_from_year()
				&"events": f.continue_from_event()
				&"card":
					per_turn[f.run.year] = per_turn.get(f.run.year, 0) + 1
					f.choose(_careful(f))
				&"consequence": f.continue_from_consequence()
				&"learning": f.continue_from_learning()
				&"impeachment":
					if f.run.impeachment["stage"] == "phase":
						f.choose_impeachment(1)
					else:
						f.continue_impeachment()
		_eq(f.state(), &"final", "seed %d ends" % s)
		var played := f.run.played
		_eq(played.size(), played.reduce(func(acc, id): return acc if acc.has(id) else acc + [id], []).size(), "CA-01 seed %d no repetition" % s)
		_check(per_turn.values().all(func(n): return n <= 7), "seed %d at most 7 cards per turn" % s)


## Side of the option that keeps the lowest meter highest (test policy).
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
