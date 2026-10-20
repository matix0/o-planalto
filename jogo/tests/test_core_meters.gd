extends SceneTree
## gdd/sistemas/01_medidores.md — §4 examples and §8 acceptance criteria (+ gdd 09 CA-07).
## godot --headless --path jogo -s res://tests/test_core_meters.gd

var failures: PackedStringArray = []
var data: GameDatabase
var order: Array
var balance: Dictionary


func _initialize() -> void:
	data = GameDatabase.new()
	data.load_all()
	order = Array(data.meter_ids)
	balance = data.balance
	_rounding()
	_card_effects()
	_awareness_doubling()
	_clamp_and_zero()
	_closing()
	_emergency_order()
	_calibration_combinations()
	data.free()
	_done("test_core_meters")


func _initial() -> Dictionary:
	var m := {}
	for x in data.meters:
		m[x["id"]] = int(x["initial"])
	return m


func _meters(values: Dictionary, base: int = 50) -> Dictionary:
	var m := {}
	for id in order:
		m[id] = values.get(id, base)
	return m


func _rounding() -> void:
	_eq(MeterRules.round_away(2.5), 3, "2.5 → 3")
	_eq(MeterRules.round_away(-2.5), -3, "-2.5 → -3")
	_eq(MeterRules.round_away(-3.75), -4, "-3.75 → -4")
	_eq(MeterRules.round_away(1.25), 1, "1.25 → 1")
	# CA-1: Ano 1, −15 → −4; Ano 4, −15 → −23.
	_eq(MeterRules.scaled_delta(-15, 0.25), -4, "CA-1 Ano 1 −15")
	_eq(MeterRules.scaled_delta(-15, 1.5), -23, "CA-1 Ano 4 −15")
	# CA-2: Ano 1, −1 → −1, never 0.
	_eq(MeterRules.scaled_delta(-1, 0.25), -1, "CA-2 −1 never 0")
	_eq(MeterRules.scaled_delta(1, 0.25), 1, "+1 never 0")
	_eq(MeterRules.scaled_delta(0, 1.5), 0, "0 stays 0")


func _card_effects() -> void:
	# §4.1 example (Ano 1, INST-001 option B of doc 17, no calibration).
	var m := _initial()
	var ch := MeterRules.apply_effects(m, {"political_capital": 10, "sovereignty": -15, "treasury": 10, "integrity": -5}, 0.25, balance, order)
	_eq(m["political_capital"], 53, "§4.1 capital 50 → 53")
	_eq(m["sovereignty"], 36, "§4.1 sovereignty 40 → 36")
	_eq(m["treasury"], 58, "§4.1 treasury 55 → 58")
	_eq(m["integrity"], 39, "§4.1 integrity 40 → 39")
	_eq(ch.size(), 4, "§4.1 four changes")
	_eq(ch.map(func(c): return c["id"]), ["sovereignty", "integrity", "treasury", "political_capital"], "changes in table order")
	_check(ch.all(func(c): return c["dot"] == "small"), "small dots up to 10 (docs/14 §14.05)")
	# gdd 05 §4 example: −10 and +10 at ×0.25 → −3 and +3.
	m = _initial()
	MeterRules.apply_effects(m, {"political_capital": -10, "sovereignty": 10}, 0.25, balance, order)
	_eq([m["political_capital"], m["sovereignty"]], [47, 43], "gdd 05 §4 example")
	# Big dot above 10.
	m = _meters({})
	ch = MeterRules.apply_effects(m, {"dignity": -15}, 1.0, balance, order)
	_eq(ch[0]["dot"], "big", "big dot above 10")
	_eq([ch[0]["band_old"], ch[0]["band_new"]], [3, 2], "bands 50 → 35")


func _awareness_doubling() -> void:
	# CA-5: Integridade 29 before the card, −10 on Consciência in Ano 3 → −20.
	var m := _meters({"integrity": 29})
	MeterRules.apply_effects(m, {"awareness": -10}, 1.0, balance, order)
	_eq(m["awareness"], 30, "CA-5 doubled loss")
	# gdd 09 CA-07 / §4 example: Ano 3, Integridade 25, aceitar (Consciência −15, Integridade −10).
	m = _meters({"integrity": 25})
	MeterRules.apply_effects(m, {"awareness": -15, "integrity": -10}, 1.0, balance, order)
	_eq([m["awareness"], m["integrity"]], [20, 15], "gdd 09 CA-07")
	# Integridade ≥ 30 → no doubling; gains are never doubled.
	m = _meters({"integrity": 30})
	MeterRules.apply_effects(m, {"awareness": -15}, 1.0, balance, order)
	_eq(m["awareness"], 35, "no doubling at 30")
	m = _meters({"integrity": 10})
	MeterRules.apply_effects(m, {"awareness": 10}, 1.0, balance, order)
	_eq(m["awareness"], 60, "gain not doubled")
	# Integrity *before* the card: the same card lowering integrity below 30 does not double.
	m = _meters({"integrity": 32})
	MeterRules.apply_effects(m, {"integrity": -10, "awareness": -10}, 1.0, balance, order)
	_eq(m["awareness"], 40, "integrity checked before the card")


func _clamp_and_zero() -> void:
	# CA-3: never outside 0-100.
	var m := _meters({"dignity": 95, "treasury": 3, "political_capital": 2})
	var ch := MeterRules.apply_effects(m, {"dignity": 20, "treasury": -10, "political_capital": -10}, 1.0, balance, order)
	_eq([m["dignity"], m["treasury"], m["political_capital"]], [100, 0, 0], "clamped 0-100")
	_eq(ch[0]["delta"], 5, "delta is the applied change")
	# Capital Político at 0 is not a catastrophe (D-095).
	_eq(MeterRules.zeroed(m, order), ["treasury"], "zeroed ignores capital")
	# gdd 02 CA-3: Dignidade and Soberania at 0, Soberania lost more → Colônia.
	m = _meters({"dignity": 5, "sovereignty": 20})
	ch = MeterRules.apply_effects(m, {"dignity": -10, "sovereignty": -25}, 1.0, balance, order)
	var zero := MeterRules.zeroed(m, order)
	var hit := MeterRules.catastrophe_meter(zero, ch, order)
	_eq(hit, "sovereignty", "most lost wins")
	_eq(data.meter_info[hit]["zero_ending"], "END-003", "gdd 02 CA-3 → Colônia")
	# Same loss → table order.
	m = _meters({"dignity": 10, "sovereignty": 10})
	ch = MeterRules.apply_effects(m, {"dignity": -10, "sovereignty": -10}, 1.0, balance, order)
	_eq(MeterRules.catastrophe_meter(MeterRules.zeroed(m, order), ch, order), "dignity", "tie → table order")


func _closing() -> void:
	# §4.2 example / CA-6: Dignidade 28, others 35-58 → Consciência −5 (35 → 30), no bonus.
	var m := _meters({"dignity": 28, "awareness": 35, "sovereignty": 40, "security": 50, "integrity": 40,
		"treasury": 55, "political_capital": 50, "legitimacy": 55})
	var ch := MeterRules.close_turn(m, balance, order)
	_eq(ch.size(), 1, "§4.2 one change")
	_eq(m["awareness"], 30, "§4.2 awareness 35 → 30")
	# CA-7: all > 45 → +3 on all.
	m = _meters({}, 50)
	MeterRules.close_turn(m, balance, order)
	_check(order.all(func(id): return m[id] == 53), "CA-7 balance bonus")
	# Thresholds: Integridade < 20 → −1 on the other 7.
	m = _meters({"integrity": 15}, 50)
	MeterRules.close_turn(m, balance, order)
	_check(order.all(func(id): return m[id] == (15 if id == "integrity" else 49)), "integrity < 20 → −1 on the others")
	# Legitimidade > 90 → Consciência −10; relation and bonus add up (§5).
	m = _meters({"legitimacy": 95}, 50)
	MeterRules.close_turn(m, balance, order)
	_eq([m["awareness"], m["legitimacy"], m["dignity"]], [43, 98, 53], "legitimacy > 90 + bonus")
	# One snapshot: every relation reads the values before the closing.
	m = _meters({"dignity": 25, "awareness": 28})
	MeterRules.close_turn(m, balance, order)
	_eq([m["awareness"], m["legitimacy"]], [23, 55], "snapshot: both relations from the photo")


func _emergency_order() -> void:
	var m := _meters({"dignity": 8, "sovereignty": 5, "treasury": 8})
	_eq(MeterRules.emergency_order(m, [], 10, order), ["sovereignty", "dignity", "treasury"], "lowest first, tie by table order")
	# CA-8: second time at ≤ 10 → no emergency.
	_eq(MeterRules.emergency_order(m, ["sovereignty", "dignity"], 10, order), ["treasury"], "emergency once per meter")


func _calibration_combinations() -> void:
	# §3.2: calibration is ±5 flat. CA-9: the 64 answer combinations, with no cards, never
	# zero a meter in 4 closings (gdd 01 §5: lowest value is 30).
	var lowest := 100
	for combo in 64:
		var m := _initial()
		for q in data.calibration.size():
			var key := "option_a" if (combo >> q) & 1 == 0 else "option_b"
			var eff := {}
			for id in data.calibration[q][key]["effects"]:
				eff[id] = int(data.calibration[q][key]["effects"][id])
			MeterRules.apply_flat(m, eff, order)
		for _turn in 4:
			MeterRules.close_turn(m, balance, order)
			_check(MeterRules.zeroed(m, order).is_empty() and m["political_capital"] > 0, "CA-9 combination %d never zeroes" % combo)
		for id in order:
			lowest = mini(lowest, m[id])
	_eq(lowest, 30, "CA-9 lowest value after 4 closings")
	var m := _initial()
	MeterRules.apply_flat(m, {"awareness": 5}, order)
	_eq(m["awareness"], 45, "calibration +5 flat (no multiplier)")


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
