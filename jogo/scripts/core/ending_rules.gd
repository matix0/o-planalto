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


## First ending that applies: category priority → more conditions → table order (§4);
## none → the neutral ending (Mandato Comum).
static func end_of_term(endings: Dictionary, meters: Dictionary) -> String:
	var ids := endings.keys()
	ids.sort()
	for group in PRIORITY:
		var best := ""
		var best_weight := -1
		for id in ids:
			var e: Dictionary = endings[id]
			if e.get("trigger") != "end_of_term" or not group.has(e.get("category")):
				continue
			var weight: int = e.get("conditions", []).size()
			if weight > best_weight and meets(e, meters):
				best = id
				best_weight = weight
		if best != "":
			return best
	for id in ids:
		if endings[id].get("category") == "neutral":
			return id
	return ""


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
