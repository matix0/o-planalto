extends SceneTree
## gdd/sistemas/02_finais.md — §4 example and §8 acceptance criteria, through EndingRules and
## the flow. godot --headless --path jogo -s res://tests/test_core_endings.gd

var failures: PackedStringArray = []
var data: GameDatabase
var order: Array


func _initialize() -> void:
	data = GameDatabase.new()
	data.load_all()
	order = Array(data.meter_ids)
	_end_of_term()
	_capture_warning()
	_instant_endings()
	_final_view()
	data.free()
	_done("test_core_endings")


func _meters(values: Dictionary, base: int = 50) -> Dictionary:
	var m := {}
	for id in order:
		m[id] = values.get(id, base)
	return m


func _end_of_term() -> void:
	var e := data.endings
	# CA-4: §4 example → #18 República Soberana e Popular (END-019), 4 conditions beat #25's 3.
	_eq(EndingRules.end_of_term(e, _meters({"dignity": 85, "awareness": 75, "sovereignty": 72, "integrity": 74})), "END-019", "CA-4 §4 example")
	# CA-5: #24 (END-025, 4 conditions) and #20 (END-021, 3) both met → #24.
	var both := _meters({"dignity": 85, "sovereignty": 85, "treasury": 75, "integrity": 65})
	_check(EndingRules.meets(e["END-025"], both) and EndingRules.meets(e["END-021"], both), "CA-5 setup meets both")
	_eq(EndingRules.end_of_term(e, both), "END-025", "CA-5 more conditions win")
	# D-174 / CA-9: Legitimidade 85, Consciência 20, Integridade 20 meet #11 (END-012) and #14
	# (END-015), same weight; #14 implies #11 → #14 Populismo Autoritário.
	var populism := _meters({"legitimacy": 85, "awareness": 20, "integrity": 20})
	_check(EndingRules.meets(e["END-012"], populism) and EndingRules.meets(e["END-015"], populism), "CA-9 setup meets #11 and #14")
	_eq(EndingRules.end_of_term(e, populism), "END-015", "D-174 the more specific ending wins")
	_check(EndingRules.implies(e["END-015"], e["END-012"]) and not EndingRules.implies(e["END-012"], e["END-015"]), "implies is one-way")
	_check(not EndingRules.implies(e["END-012"], e["END-012"]), "identical lists imply nothing")
	# Legitimidade 75 meets only #11.
	_eq(EndingRules.end_of_term(e, _meters({"legitimacy": 75, "awareness": 20, "integrity": 20})), "END-012", "#11 when #14 does not apply")
	# CA-6: Segurança 96, no extermination / democracy loss → Estado Policial (END-009).
	_eq(EndingRules.end_of_term(e, _meters({"security": 96})), "END-009", "CA-6 capture")
	# §5: capture beats a good ending.
	var good_and_capture := _meters({"dignity": 85, "awareness": 75, "sovereignty": 72, "integrity": 74, "legitimacy": 97})
	_eq(EndingRules.end_of_term(e, good_and_capture), "END-011", "capture beats the good band")
	# CA-7: all at 50 → Mandato Comum (END-027).
	_eq(EndingRules.end_of_term(e, _meters({})), "END-027", "CA-7 Mandato Comum")
	# CA-8: Consciência 85, Integridade 85, Legitimidade 72 → #21 (END-022).
	_eq(EndingRules.end_of_term(e, _meters({"awareness": 85, "integrity": 85, "legitimacy": 72})), "END-022", "CA-8")
	# §5: exactly at the limit does not meet (strict); capture uses ≥ 95.
	_eq(EndingRules.end_of_term(e, _meters({"awareness": 80, "integrity": 85, "legitimacy": 72})), "END-027", "strict: 80 is not > 80")
	_eq(EndingRules.end_of_term(e, _meters({"security": 95})), "END-009", "capture at exactly 95")
	_eq(EndingRules.end_of_term(e, _meters({"security": 94})), "END-027", "94 is not capture")
	# Priority: extermination first.
	var ext := _meters({"dignity": 10, "integrity": 10, "awareness": 20, "security": 85})
	_eq(EndingRules.end_of_term(e, ext), "END-017", "extermination has priority")


func _capture_warning() -> void:
	_eq(EndingRules.capture_warning(data.meters, _meters({"security": 81, "legitimacy": 80}), 81), ["security"], "warning at ≥ 81 (gdd 02 §3.4)")
	_eq(EndingRules.capture_warning(data.meters, _meters({"political_capital": 90, "dignity": 99}), 81), ["political_capital"], "only capture meters")
	# CA-6 second half, through the flow: the Ano 4 card names the meter, no number.
	var f := GameFlow.new(data)
	f.start(1)
	f.run.meters = _meters({"security": 85})
	f._begin_year(4)
	var v := f.year_view()
	_eq(v["capture_warning"].map(func(w): return w["name"]), ["Segurança"], "CA-6 Ano 4 warning")
	_check(v["capture_warning_text"] != "", "warning text placeholder")
	f._begin_year(3)
	_eq(f.year_view()["capture_warning"], [], "no warning before Ano 4")


func _instant_endings() -> void:
	# CA-1: Caixa at 0 after a card → Paralisia Fiscal (END-006) at once.
	var f := _flow_with_card({"treasury": -30, "dignity": 5}, {"dignity": -5, "legitimacy": 5}, 3, {"treasury": 10})
	var r := f.choose(int(f.run.current_card["side_a"]))
	_eq(r["next"], &"final", "CA-1 final at once")
	_eq(r["ending_id"], "END-006", "CA-1 Paralisia Fiscal")
	# CA-2: Capital Político at 0 → the impeachment scene, not an ending.
	f = _flow_with_card({"political_capital": -30, "dignity": 5}, {"dignity": -5, "legitimacy": 5}, 3, {"political_capital": 10})
	r = f.choose(int(f.run.current_card["side_a"]))
	_eq(r["next"], &"impeachment", "CA-2 capital 0 opens the scene")
	# Renúncia (abandon) → END-028 at once.
	f = _flow_with_card({"dignity": -5, "legitimacy": 5}, {"dignity": 5, "legitimacy": -5}, 2, {})
	f.abandon()
	_eq(f.final_view()["ending"]["id"], "END-028", "abandon → Renúncia")


func _final_view() -> void:
	var f := _flow_with_card({"treasury": -30, "dignity": 5}, {"dignity": -5, "legitimacy": 5}, 3, {"treasury": 10})
	f.choose(int(f.run.current_card["side_a"]))
	var v := f.final_view()
	_eq(v["ending"]["name"], "Paralisia Fiscal", "final name")
	_eq(v["ending"]["category_label"], "Catástrofe", "category label")
	_check(v["ending"]["quote"] != "" and v["ending"]["author"] != "", "quote and author")
	_eq(v["meter"], "treasury", "catastrophe meter")
	_eq(v["meters"].size(), 8, "8 meters with numbers on the final screen")
	_check(v["closing_phrase"].begins_with("O país que você construiu"), "closing phrase (GDD §9.2)")
	_check(v["description"] != "" and not v["description"].contains("a definir"), "short description from endings.json (P-017)")
	# Ending without a verified quote (gdd 02 §3.5): empty quote → the block is hidden.
	f.run.ending = {"id": "END-005", "reason": "catastrophe", "meter": "integrity"}
	_eq(f.final_view()["ending"]["quote"], "", "END-005 has no quote")
	# Meter reveal (GDD §9.2; D-175: high > 60, low < 40, 6th text when no pattern applies).
	_eq(AxisRules.meter_reveal(_meters({})), AxisRules.REVEAL_PATTERNS[2]["text"], "all 50 → equilíbrio")
	_eq(AxisRules.meter_reveal(_meters({"dignity": 70, "awareness": 70, "sovereignty": 70})), AxisRules.REVEAL_PATTERNS[0]["text"], "high dignity/awareness/sovereignty")
	_eq(AxisRules.meter_reveal(_meters({"integrity": 30, "awareness": 30})), AxisRules.REVEAL_PATTERNS[3]["text"], "low integrity/awareness")
	_eq(AxisRules.meter_reveal(_meters({"dignity": 20, "security": 90})), AxisRules.REVEAL_NONE, "D-175 no pattern → 6th text")
	_check(not AxisRules.REVEAL_NONE.contains("[a definir"), "D-175 the marker never shows")
	_eq(AxisRules.meter_reveal(_meters({"integrity": 39, "awareness": 39})), AxisRules.REVEAL_PATTERNS[3]["text"], "39 is low")
	_check(AxisRules.meter_reveal(_meters({"integrity": 40, "awareness": 40})) != AxisRules.REVEAL_PATTERNS[3]["text"], "40 is not low (strict)")
	_eq(AxisRules.meter_reveal(_meters({"integrity": 40, "awareness": 40}), {"reveal_low_below": 41}), AxisRules.REVEAL_PATTERNS[3]["text"], "limit read from balance.json")
	for p in AxisRules.REVEAL_PATTERNS:
		_check(not String(p["text"]).contains("...") and not String(p["text"]).contains("negligenc"), "P-07: no ellipsis, no blame (%s)" % p["text"])


## Flow in CARTA at `year` with a synthetic card whose option A has `eff_a` (shown on the
## drawn side) and option B `eff_b`; `meters` overrides the 50s.
func _flow_with_card(eff_a: Dictionary, eff_b: Dictionary, year: int, meters: Dictionary) -> GameFlow:
	var card := {
		"id": "INST-990", "title": "Teste", "mode": "congress", "type": "institutional", "problem": "Teste",
		"option_a": {"text": "A", "color": "red", "axis": [1, 0, 0, 0], "effects": eff_a, "actors": {}, "events": [], "consequence": "cA"},
		"option_b": {"text": "B", "color": "blue", "axis": [-1, 0, 0, 0], "effects": eff_b, "actors": {}, "events": [], "consequence": "cB"},
		"learning_id": "APR-001", "prerequisites": {"min_year": 1},
	}
	data.cards["INST-990"] = card
	var f := GameFlow.new(data)
	f.start(7)
	f.run.meters = _meters(meters)
	f._begin_year(year)
	f.run.state = &"card"
	f.run.current_card = {"id": "INST-990", "kind": "draw", "target": "", "side_a": 1}
	return f


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
