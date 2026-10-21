extends SceneTree
## Table tests of the 28 endings (P-014 etapa 6; V-009, RT-13). The expected values live here,
## copied from the design docs, never read back from endings.json:
##   conditions — docs/04_DESIGN_DO_JOGO.md §04.08.2-04.08.7; categories and triggers —
##   gdd/sistemas/02_finais.md §3.1; Captura at ≥ 95 (D-096; balance.json capture_at_or_above);
##   meter at 0 → ending — gdd/GDD.md §6.1.1 (Capital Político at 0 opens the scene, D-095).
## 1. endings.json and meters.json say exactly this.
## 2. Each end-of-term ending is met on a board at its boundary (other meters at 50) and stops
##    being met one unit past any of its conditions (EndingRules.meets).
## 3. On its own boundary board each ending wins the end of the term (EndingRules.end_of_term):
##    priority and D-174 (the more specific wins) included — e.g. #14 Populismo Autoritário
##    (END-015) also meets #11 (END-012) and must win.
## 4. D-180: two meters at 0 on one card → the one with the larger applied drop, not the larger
##    written effect.
## godot --headless --path jogo -s res://tests/test_table_endings.gd

const BASE := 50

## [id, name, category, trigger, conditions]
const TABLE := [
	["END-001", "Barbárie", "catastrophe", "instant", ["dignity == 0"]],
	["END-002", "Alienação Total", "catastrophe", "instant", ["awareness == 0"]],
	["END-003", "Colônia", "catastrophe", "instant", ["sovereignty == 0"]],
	["END-004", "Autogestão Popular", "catastrophe", "instant", ["security == 0"]],
	["END-005", "Desintegração", "catastrophe", "instant", ["integrity == 0"]],
	["END-006", "Paralisia Fiscal", "catastrophe", "instant", ["treasury == 0"]],
	["END-007", "Impeachment", "catastrophe", "impeachment", []],
	["END-008", "Revolta Popular", "catastrophe", "instant", ["legitimacy == 0"]],
	["END-009", "Estado Policial", "capture", "end_of_term", ["security >= 95"]],
	["END-010", "Hegemonia Autoritária", "capture", "end_of_term", ["political_capital >= 95"]],
	["END-011", "Ufanismo Vazio", "capture", "end_of_term", ["legitimacy >= 95"]],
	["END-012", "Autoritarismo Eleitoral", "democracy_loss", "end_of_term", ["awareness < 30", "integrity < 30", "legitimacy > 70"]],
	["END-013", "Golpe Militar", "democracy_loss", "end_of_term", ["security > 80", "dignity < 30", "awareness < 30"]],
	["END-014", "Golpe Institucional", "democracy_loss", "end_of_term", ["political_capital > 80", "awareness < 30", "sovereignty < 30"]],
	["END-015", "Populismo Autoritário", "democracy_loss", "end_of_term", ["legitimacy > 80", "awareness < 30", "integrity < 30"]],
	["END-016", "Colônia Digital", "democracy_loss", "end_of_term", ["sovereignty < 30", "integrity < 30", "dignity < 30"]],
	["END-017", "Genocídio Institucionalizado", "extermination", "end_of_term", ["dignity < 20", "integrity < 20", "awareness < 30", "security > 80"]],
	["END-018", "Exploração Necropolítica", "extermination", "end_of_term", ["sovereignty < 20", "dignity < 20", "treasury > 80", "integrity < 30"]],
	["END-019", "República Soberana e Popular", "strengthening", "end_of_term", ["dignity > 80", "awareness > 70", "sovereignty > 70", "integrity > 70"]],
	["END-020", "Democracia Participativa", "strengthening", "end_of_term", ["awareness > 70", "integrity > 70", "dignity > 60", "legitimacy > 60"]],
	["END-021", "Desenvolvimento Soberano", "strengthening", "end_of_term", ["sovereignty > 80", "treasury > 60", "dignity > 60"]],
	["END-022", "Cidadania Ativa e Mobilizada", "strengthening", "end_of_term", ["awareness > 80", "integrity > 80", "legitimacy > 70"]],
	["END-023", "Paz Social e Justiça", "strengthening", "end_of_term", ["security > 70", "dignity > 70", "awareness > 60"]],
	["END-024", "Cuidado como Política de Estado", "care_sovereignty", "end_of_term", ["dignity > 80", "integrity > 70", "awareness > 70", "security > 50"]],
	["END-025", "Soberania que Alimenta", "care_sovereignty", "end_of_term", ["sovereignty > 80", "dignity > 70", "integrity > 60", "treasury > 50"]],
	["END-026", "Fome como Escolha Política", "care_sovereignty", "end_of_term", ["dignity > 80", "awareness > 70", "sovereignty > 60"]],
	["END-027", "Mandato Comum", "neutral", "end_of_term", []],
	["END-028", "Renúncia", "exit", "exit", []],
]
## gdd/GDD.md §6.1.1: meter at 0 → ending; at ≥ 95 at the end of Year 4 → Captura ending.
const ZERO_ENDING := {
	"dignity": "END-001", "awareness": "END-002", "sovereignty": "END-003", "security": "END-004",
	"integrity": "END-005", "treasury": "END-006", "political_capital": "", "legitimacy": "END-008",
}
const CAPTURE_ENDING := {"security": "END-009", "political_capital": "END-010", "legitimacy": "END-011"}
const CAPTURE_AT := 95       # D-096
const NEUTRAL := "END-027"   # Mandato Comum: nothing else is met

var failures: PackedStringArray = []
var data: GameDatabase
var order: Array


func _initialize() -> void:
	data = GameDatabase.new()
	data.load_all()
	order = Array(data.meter_ids)
	_check(data.errors.is_empty(), "data loads without errors: %s" % ", ".join(data.errors))
	# "-- --behavior-only" skips the data == table checks (mutation report, behavior alone).
	if not OS.get_cmdline_user_args().has("--behavior-only"):
		_data_matches_table()
		_meter_endings()
	_boundaries()
	_neutral_board()
	_most_lost()
	data.free()
	_done("test_table_endings")


func _data_matches_table() -> void:
	_eq(data.endings.size(), TABLE.size(), "28 endings")
	for row: Array in TABLE:
		var id: String = row[0]
		_check(data.endings.has(id), "%s exists" % id)
		if not data.endings.has(id):
			continue
		var e: Dictionary = data.endings[id]
		_eq([String(e.get("name", "")), String(e.get("category", "")), String(e.get("trigger", ""))], [row[1], row[2], row[3]],
			"%s name, category and trigger" % id)
		_eq(_conditions_text(e), row[4], "%s conditions" % id)
	_eq(int(data.balance.get("capture_at_or_above", -1)), CAPTURE_AT, "balance.json capture_at_or_above (D-096)")
	# The loader replaces the Captura value with balance.json's (V-035); the file must agree.
	var raw: Variant = JSON.parse_string(FileAccess.get_file_as_string("res://data/endings.json"))
	for e in (raw if raw is Array else []):
		if String(e.get("category", "")) == "capture":
			for c in e.get("conditions", []):
				_eq(int(c["value"]), CAPTURE_AT, "endings.json %s Captura value" % String(e.get("id", "?")))


func _meter_endings() -> void:
	for m in ZERO_ENDING:
		var info: Dictionary = data.meter_info.get(m, {})
		_eq(_str(info.get("zero_ending")), ZERO_ENDING[m], "%s at 0 → '%s'" % [m, ZERO_ENDING[m]])
		_eq(_str(info.get("capture_ending")), String(CAPTURE_ENDING.get(m, "")), "%s capture ending" % m)


## Boundary board: every meter at BASE, each condition's meter at the last value that passes.
func _boundaries() -> void:
	for row: Array in TABLE:
		if row[3] != "end_of_term" or (row[4] as Array).is_empty():
			continue
		var id: String = row[0]
		var conds := _parse(row[4])
		var board := _board(conds)
		var e: Dictionary = data.endings.get(id, {})
		_check(EndingRules.meets(e, board), "%s is met at its boundary %s" % [id, _short(board)])
		for c: Array in conds:
			var past := board.duplicate()
			past[c[0]] = _failing(c)
			_check(not EndingRules.meets(e, past), "%s is not met with %s = %d" % [id, c[0], past[c[0]]])
		_eq(EndingRules.end_of_term(data.endings, board), id, "%s wins on its boundary board %s" % [id, _short(board)])


func _neutral_board() -> void:
	var flat := _board([])
	_eq(EndingRules.end_of_term(data.endings, flat), NEUTRAL, "all meters at %d → Mandato Comum" % BASE)
	# Captura one unit below the limit: nothing but the neutral ending.
	for m in CAPTURE_ENDING:
		var b := flat.duplicate()
		b[m] = CAPTURE_AT - 1
		_eq(EndingRules.end_of_term(data.endings, b), NEUTRAL, "%s at %d → no Captura" % [m, CAPTURE_AT - 1])


## D-180: Dignidade 5 with −30 written (−5 applied) and Soberania 20 with −20 → both at 0;
## Soberania dropped more → Colônia (END-003), although Dignidade had the larger effect.
func _most_lost() -> void:
	var m := _board([])
	m["dignity"] = 5
	m["sovereignty"] = 20
	var changes := MeterRules.apply_effects(m, {"dignity": -30, "sovereignty": -20}, 1.0, data.balance, order)
	var hit := MeterRules.catastrophe_meter(MeterRules.zeroed(m, order), changes, order)
	_eq(hit, "sovereignty", "D-180 the larger applied drop wins")
	_eq(String(data.meter_info[hit]["zero_ending"]), "END-003", "D-180 → Colônia")


# --- helpers ---------------------------------------------------------------------------------

## null (no ending in meters.json) → "".
func _str(v: Variant) -> String:
	return "" if v == null else str(v)


func _conditions_text(e: Dictionary) -> Array:
	var out: Array = []
	for c in e.get("conditions", []):
		out.append("%s %s %d" % [String(c["meter"]), String(c["op"]), int(c["value"])])
	return out


func _parse(conds: Array) -> Array:
	var out: Array = []
	for t: String in conds:
		var p := t.split(" ")
		out.append([p[0], p[1], int(p[2])])
	return out


func _board(conds: Array) -> Dictionary:
	var b := {}
	for m in order:
		b[m] = BASE
	for c: Array in conds:
		b[c[0]] = _passing(c)
	return b


func _passing(c: Array) -> int:
	match c[1]:
		">":
			return c[2] + 1
		"<":
			return c[2] - 1
	return c[2]   # >=, ==


func _failing(c: Array) -> int:
	match c[1]:
		">", "<":
			return c[2]
		">=":
			return c[2] - 1
	return c[2] + 1   # ==


func _short(board: Dictionary) -> String:
	var parts := PackedStringArray()
	for m in order:
		if board[m] != BASE:
			parts.append("%s %d" % [m, board[m]])
	return "{%s}" % ", ".join(parts)


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
