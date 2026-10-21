extends SceneTree
## Table tests of balance.json (P-014 etapa 6; V-009, RT-13). The expected values live here,
## copied from the design docs, never read back from the data:
##   relations — gdd/GDD.md §6.1.3; thresholds and balance bonus — gdd/sistemas/01_medidores.md
##   §3.4 and §4.2; year multiplier and doubling of Consciência losses — §4.1; emergency ≤ 10 —
##   §3.4 step 5; calibration ±5 — §3.2; linked card < 30 and 3 mandatory of 7 cards — gdd/GDD.md
##   §6.2; actors start at 50, ±10 per citation, levels — gdd/sistemas/07_atores.md §3.2-3.3 and
##   gdd/GDD.md §6.3; Captura ≥ 95 (D-096) and its warning ≥ 81 — gdd/sistemas/02_finais.md §3.4;
##   reveal > 60 / < 40 — gdd/sistemas/04_eixo.md:45 (D-175).
## 1. balance.json says exactly this.
## 2. Each relation and threshold fires one unit past its limit and not at it, with exactly its
##    effect (MeterRules.close_turn; all other meters at 45, where no rule fires and no bonus).
## 3. Bonus, doubling, year multiplier, emergency, actor levels and the reveal limits behave at
##    their boundaries.
## godot --headless --path jogo -s res://tests/test_table_balance.gd

const QUIET := 45   # no relation, threshold nor bonus fires with every meter at 45

const YEAR_MULTIPLIERS := [0.25, 0.75, 1.0, 1.5]
## "source op value → meter ±n, …"
const RELATIONS := [
	"dignity < 30 → awareness -5",
	"dignity > 70 → awareness +3",
	"awareness > 60 → legitimacy -5",
	"awareness < 30 → legitimacy +5",
	"sovereignty < 30 → treasury +10, dignity -5",
	"security < 30 → dignity -10",
	"treasury > 70 → legitimacy -3",
	"treasury < 30 → legitimacy -5",
	"political_capital < 30 → treasury -10",
	"legitimacy < 30 → political_capital -10",
]
const THRESHOLDS := [
	"integrity < 20 → all others -1",
	"legitimacy > 90 → awareness -10",
]
const SCALARS := {
	"awareness_loss_doubling": {"integrity_below": 30, "factor": 2},
	"balance_bonus": {"all_above": 45, "amount": 3},
	"emergency_at_or_below": 10,
	"linked_card_below": 30,
	"calibration_step": 5,
	"actor_initial": 50,
	"actor_step": 10,
	"cards_per_turn": 7,
	"max_mandatory_per_turn": 3,
	"capture_at_or_above": 95,
	"capture_warning_at_or_above": 81,
	"reveal_high_above": 60,
	"reveal_low_below": 40,
}
## [id, last value of the level, card role]
const ACTOR_LEVELS := [
	["furious", 20, "attack"], ["dissatisfied", 40, "demand"], ["neutral", 60, "demand"],
	["satisfied", 80, "offer"], ["ally", 100, "offer"],
]

var failures: PackedStringArray = []
var data: GameDatabase
var balance: Dictionary
var order: Array


func _initialize() -> void:
	data = GameDatabase.new()
	data.load_all()
	balance = data.balance
	order = Array(data.meter_ids)
	# "-- --behavior-only" skips the data == table checks (mutation report, behavior alone).
	if not OS.get_cmdline_user_args().has("--behavior-only"):
		_data_matches_table()
	_relations()
	_thresholds()
	_bonus()
	_doubling_and_multipliers()
	_emergency()
	_linked_limit()
	_capture_warning()
	_actor_levels()
	_reveal()
	data.free()
	_done("test_table_balance")


func _data_matches_table() -> void:
	_eq(balance.get("year_multipliers"), YEAR_MULTIPLIERS, "year multipliers")
	var rel := PackedStringArray()
	for r in balance.get("relations", []):
		rel.append(_rule_text(r))
	rel.sort()
	var want := PackedStringArray(RELATIONS)
	want.sort()
	_eq(rel, want, "the 10 relations")
	var thr := PackedStringArray()
	for t in balance.get("thresholds", []):
		thr.append(_rule_text(t))
	_eq(thr, PackedStringArray(THRESHOLDS), "the 2 thresholds")
	for key in SCALARS:
		_eq(_ints(balance.get(key)), SCALARS[key], key)
	var levels: Array = []
	for l in balance.get("actor_levels", []):
		levels.append([String(l["id"]), int(l["max"]), String(l["role"])])
	_eq(levels, ACTOR_LEVELS, "actor levels")


## Each relation: at the limit nothing happens; one unit past it, exactly its effect.
func _relations() -> void:
	for text: String in RELATIONS:
		var r := _parse_rule(text)
		var at := _closing({r.source: r.value})
		_eq(at, {}, "%s: nothing at %s = %d" % [text, r.source, r.value])
		var past_value: int = r.value + (1 if r.op == ">" else -1)
		var past := _closing({r.source: past_value})
		_eq(past, r.effects, "%s: fires at %s = %d" % [text, r.source, past_value])


func _thresholds() -> void:
	# Integridade < 20 → −1 on the other 7 (Integridade < 30 adds nothing at the closing).
	_eq(_closing({"integrity": 20}), {}, "integrity 20: no threshold")
	var all_others := {}
	for m in order:
		if m != "integrity":
			all_others[m] = -1
	_eq(_closing({"integrity": 19}), all_others, "integrity 19: −1 on the other 7")
	# Legitimidade > 90 → Consciência −10.
	_eq(_closing({"legitimacy": 90}), {}, "legitimacy 90: no threshold")
	_eq(_closing({"legitimacy": 91}), {"awareness": -10}, "legitimacy 91: awareness −10")


func _bonus() -> void:
	var all := {}
	for m in order:
		all[m] = 46
	var plus := {}
	for m in order:
		plus[m] = 3
	_eq(_closing(all), plus, "every meter at 46: +3 on each")
	for m in order:
		var one := all.duplicate()
		one[m] = 45
		_eq(_closing(one), {}, "%s at 45: no bonus" % m)


func _doubling_and_multipliers() -> void:
	# Year multiplier: base +10 → +3, +8, +10, +15 (round half away from zero, gdd 01 §4.1).
	var want := [3, 8, 10, 15]
	for i in YEAR_MULTIPLIERS.size():
		var m := _quiet()
		var ch := MeterRules.apply_effects(m, {"dignity": 10}, float(balance["year_multipliers"][i]), balance, order)
		_eq(int(ch[0]["delta"]), want[i], "year %d: +10 → %+d" % [i + 1, want[i]])
	# Doubling: Integridade 29 before the card → a Consciência loss counts twice; at 30 it does not.
	var m := _quiet()
	m["integrity"] = 29
	MeterRules.apply_effects(m, {"awareness": -10}, 1.0, balance, order)
	_eq(m["awareness"], QUIET - 20, "integrity 29: awareness −10 counts −20")
	m = _quiet()
	m["integrity"] = 30
	MeterRules.apply_effects(m, {"awareness": -10}, 1.0, balance, order)
	_eq(m["awareness"], QUIET - 10, "integrity 30: awareness −10 stays −10")
	m = _quiet()
	m["integrity"] = 29
	MeterRules.apply_effects(m, {"awareness": 10}, 1.0, balance, order)
	_eq(m["awareness"], QUIET + 10, "integrity 29: a gain is not doubled")


func _emergency() -> void:
	var limit := int(balance["emergency_at_or_below"])
	var m := _quiet()
	m["dignity"] = 10
	m["treasury"] = 11
	_eq(MeterRules.emergency_order(m, [], limit, order), ["dignity"], "≤ 10 asks for an emergency, 11 does not")


## A meter below 30 asks for a card linked to it among the mandatory ones; at 30 it does not
## (gdd/GDD.md §6.2, rule 2).
func _linked_limit() -> void:
	var f := GameFlow.new(data)
	f.start(3)
	for v in [29, 30]:
		var rng := RandomNumberGenerator.new()
		rng.seed = 3
		var m := _quiet()
		m["dignity"] = v
		f.run.meters = m
		f.run.emergency_pending = []
		var targets: Array = []
		for e in DrawRules.build_mandatory(data, f.run, rng):
			if String(e["kind"]) == "meter":
				targets.append(String(e["target"]))
		_eq(targets.has("dignity"), v < 30, "dignity %d: linked card %s" % [v, "asked" if v < 30 else "not asked"])


## Year 4 card: a Captura meter at 81 is named in the warning, at 80 it is not (gdd 02 §3.4).
func _capture_warning() -> void:
	var limit := int(balance["capture_warning_at_or_above"])
	for v in [81, 80]:
		var m := _quiet()
		m["security"] = v
		var named: Array = EndingRules.capture_warning(data.meters, m, limit)
		_eq(named.size(), 1 if v >= 81 else 0, "security %d: Captura warning %s" % [v, "shown" if v >= 81 else "not shown"])


func _actor_levels() -> void:
	var levels: Array = balance["actor_levels"]
	for row: Array in ACTOR_LEVELS:
		_eq([ActorRules.level_of(row[1], levels).get("id"), ActorRules.role_of(row[1], levels)], [row[0], row[2]],
			"actor at %d → %s (%s)" % [row[1], row[0], row[2]])
	for v in [21, 41, 61, 81]:
		var i := ACTOR_LEVELS.map(func(r: Array) -> int: return r[1]).find(v - 1) + 1
		_eq(ActorRules.level_of(v, levels).get("id"), ACTOR_LEVELS[i][0], "actor at %d → %s" % [v, ACTOR_LEVELS[i][0]])
	_check(ActorRules.is_furious(20, levels) and not ActorRules.is_furious(21, levels), "furious up to 20")
	var actors := {"ACT-001": int(balance["actor_initial"])}
	ActorRules.apply(actors, {"ACT-001": 1}, int(balance["actor_step"]))
	_eq(actors["ACT-001"], 60, "50 + one citation = 60")


## D-175: "high" > 60 and "low" < 40 — pattern 1 needs Dignidade, Consciência and Soberania high.
func _reveal() -> void:
	var m := _quiet()
	for id in ["dignity", "awareness", "sovereignty"]:
		m[id] = 61
	var p1 := AxisRules.meter_reveal(m, balance)
	m["sovereignty"] = 60
	_check(AxisRules.meter_reveal(m, balance) != p1, "reveal: 61 is high, 60 is not")
	m = _quiet()
	for id in ["integrity", "awareness"]:
		m[id] = 39
	var p4 := AxisRules.meter_reveal(m, balance)
	m["integrity"] = 40
	_check(AxisRules.meter_reveal(m, balance) != p4, "reveal: 39 is low, 40 is not")
	# The 6th text replaces the old "[a definir]" marker: no state shows a marker (D-175).
	var rng := RandomNumberGenerator.new()
	rng.seed = 175
	for i in 3000:
		var r := {}
		for id in order:
			r[id] = rng.randi_range(0, 100)
		var text := AxisRules.meter_reveal(r, balance)
		_check(text != "" and not text.contains("["), "reveal text without marker for %s" % str(r))
		if text.contains("["):
			break


# --- helpers ---------------------------------------------------------------------------------

func _quiet() -> Dictionary:
	var m := {}
	for id in order:
		m[id] = QUIET
	return m


## Closing deltas {meter: delta} (only meters that changed) with `values` over a quiet board.
func _closing(values: Dictionary) -> Dictionary:
	var m := _quiet()
	m.merge(values, true)
	var out := {}
	for c in MeterRules.close_turn(m, balance, order):
		if int(c["delta"]) != 0:
			out[String(c["id"])] = int(c["delta"])
	return out


func _rule_text(r: Dictionary) -> String:
	var parts := PackedStringArray()
	if r.has("effects_all_others"):
		parts.append("all others %+d" % int(r["effects_all_others"]))
	for m in r.get("effects", {}):
		parts.append("%s %+d" % [String(m), int(r["effects"][m])])
	return "%s %s %d → %s" % [String(r["source"]), String(r["op"]), int(r["value"]), ", ".join(parts)]


func _parse_rule(text: String) -> Dictionary:
	var halves := text.split(" → ")
	var head := halves[0].split(" ")
	var effects := {}
	for e in halves[1].split(", "):
		var p := e.split(" ")
		effects[p[0]] = int(p[1])
	return {"source": head[0], "op": head[1], "value": int(head[2]), "effects": effects}


## JSON numbers come as floats: compare scalars and flat dictionaries as ints.
func _ints(v: Variant) -> Variant:
	if v is Dictionary:
		var d := {}
		for k in v:
			d[k] = int(v[k])
		return d
	if v is float or v is int:
		return int(v)
	return v


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
