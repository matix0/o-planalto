class_name EndingRules
extends RefCounted
## gdd/sistemas/02_finais.md — end-of-term choice (§3.3, §4), capture warning (§3.4) and
## the category labels of the final screen (§3.1).

## §3.3 step 4: Extermínio → Perda da Democracia → Captura → faixa "boa" → Mandato Comum.
const PRIORITY := [["extermination"], ["democracy_loss"], ["capture"], ["strengthening", "care_sovereignty"]]
const CATEGORY_LABELS := {
	"catastrophe": "Catástrofe",
	"extermination": "Extermínio e Exploração",
	"democracy_loss": "Perda da Democracia",
	"capture": "Captura",
	"strengthening": "Fortalecimento",
	"care_sovereignty": "Cuidado e Soberania",
	"neutral": "Neutro",
	"exit": "Saída",
}


## All conditions true with these values (strict comparisons; capture uses ≥ 95, §4).
static func meets(ending: Dictionary, meters: Dictionary) -> bool:
	var conditions: Array = ending.get("conditions", [])
	if conditions.is_empty():
		return false
	for c in conditions:
		if not MeterRules.compare(int(meters.get(c["meter"], 0)), String(c["op"]), int(c["value"])):
			return false
	return true


## First ending that applies (§3.3, §4): the highest-priority category with a match; inside
## it, every match implied by a stricter match drops out (D-174), then more conditions →
## table order; none → the neutral ending (Mandato Comum).
static func end_of_term(endings: Dictionary, meters: Dictionary) -> String:
	var ids := endings.keys()
	ids.sort()
	for group in PRIORITY:
		var matches: Array = []
		for id in ids:
			var e: Dictionary = endings[id]
			if e.get("trigger") == "end_of_term" and group.has(e.get("category")) and meets(e, meters):
				matches.append(id)
		if matches.is_empty():
			continue
		var best := ""
		var best_weight := -1
		for id in matches:   # table order
			if matches.any(func(other: String) -> bool: return other != id and implies(endings[other], endings[id])):
				continue
			var weight: int = endings[id].get("conditions", []).size()
			if weight > best_weight:
				best = id
				best_weight = weight
		return best
	for id in ids:
		if endings[id].get("category") == "neutral":
			return id
	return ""


## D-174: `a` implies `b` when every condition of `b` is guaranteed by a condition of `a`
## (same meter, every value that passes `a`'s condition passes `b`'s) and not the other way
## round — identical lists imply nothing, so the table order decides.
static func implies(a: Dictionary, b: Dictionary) -> bool:
	return _covers(a, b) and not _covers(b, a)


static func _covers(a: Dictionary, b: Dictionary) -> bool:
	var ca: Array = a.get("conditions", [])
	var cb: Array = b.get("conditions", [])
	if ca.is_empty() or cb.is_empty():
		return false
	for c in cb:
		if not ca.any(func(x: Dictionary) -> bool: return _guarantees(x, c)):
			return false
	return true


## Meter values are integers 0..100: each condition is an inclusive interval.
static func _guarantees(x: Dictionary, c: Dictionary) -> bool:
	if String(x["meter"]) != String(c["meter"]):
		return false
	var ix := _interval(String(x["op"]), int(x["value"]))
	var ic := _interval(String(c["op"]), int(c["value"]))
	return ix.x >= ic.x and ix.y <= ic.y


static func _interval(op: String, v: int) -> Vector2i:
	match op:
		">":
			return Vector2i(v + 1, 100)
		">=":
			return Vector2i(v, 100)
		"<":
			return Vector2i(0, v - 1)
		"<=":
			return Vector2i(0, v)
		"==":
			return Vector2i(v, v)
	return Vector2i(1, 0)   # unknown op: empty interval, guarantees nothing


## Capture meters (with `capture_ending`) at or above the warning limit at the start of
## Year 4, in table order (§3.4).
static func capture_warning(meter_data: Array, meters: Dictionary, at_or_above: int) -> Array:
	var out: Array = []
	for m in meter_data:
		if m.get("capture_ending") != null and int(meters.get(m["id"], 0)) >= at_or_above:
			out.append(String(m["id"]))
	return out


static func category_label(category: String) -> String:
	return String(CATEGORY_LABELS.get(category, "[a definir]"))
