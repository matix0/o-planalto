class_name AxisRules
extends RefCounted
## gdd/sistemas/04_eixo.md — two tracks ("o que você disse" from the calibration, "como
## você governou" from the chosen options, impeachment scene included), positions (§4),
## dominant axis and its text (§3.3); meter reveal of gdd/GDD.md §9.2.

const AXES: Array[String] = ["economy", "diplomacy", "society", "state"]
const NAMES: Array[String] = ["Economia", "Diplomacia", "Sociedade", "Estado"]
## [pole −, pole +] (§3.1).
const POLES := [
	["Coletivismo", "Mercado"],
	["Nacionalismo", "Globalismo"],
	["Conservadorismo", "Progressismo"],
	["Autoritarismo", "Liberdade"],
]
## [pole −, pole +, no position] (§3.3).
const TEXTS := [
	["Seu governo apostou no Estado e no que é de todos para dividir a riqueza.",
		"Seu governo confiou no mercado e na iniciativa privada para gerar riqueza.",
		"A economia não foi o centro das suas escolhas."],
	["Seu governo pôs o interesse nacional acima dos acordos com o mundo.",
		"Seu governo apostou na cooperação e na abertura ao mundo.",
		"Você quase não decidiu o lugar do Brasil no mundo."],
	["Seu governo preservou costumes e instituições tradicionais.",
		"Seu governo ampliou direitos e mudou costumes.",
		"Os costumes não foram o centro das suas escolhas."],
	["Seu governo concentrou poder para impor ordem.",
		"Seu governo limitou o poder do Estado sobre as pessoas.",
		"Você quase não mexeu no tamanho do poder do Estado."],
]
const SCALE := 5.0

## gdd/GDD.md §9.2 — meter patterns, checked in table order, first match wins.
## The repo does not define "altos", "baixos" nor "equilíbrio" (docs/15 §15.10; wireframe
## T-10.1) — a validar (§9.2): high > 60, low < 40, balance = all 8 between 40 and 60.
const REVEAL_HIGH_ABOVE := 60
const REVEAL_LOW_BELOW := 40
const REVEAL_PATTERNS := [
	{"high": ["dignity", "awareness", "sovereignty"],
		"text": "Seu governo priorizou a dignidade, a educação e a soberania..."},
	{"high": ["security", "political_capital", "treasury"],
		"text": "Seu governo priorizou a ordem, a estabilidade e a economia..."},
	{"balance": true, "text": "Seu governo buscou equilíbrio entre diferentes valores..."},
	{"low": ["integrity", "awareness"], "text": "Seu governo negligenciou a verdade e a educação..."},
	{"low": ["dignity", "sovereignty"], "text": "Seu governo negligenciou o povo e a soberania..."},
]
const REVEAL_NONE := "[a definir — nenhum padrão do GDD §9.2 se aplica]"
const CLOSING_PHRASE := "O país que você construiu reflete os valores que você priorizou."


## Adds one answer or option vector [Eco, Dip, Soc, Est]; a 0 is "axis not in play" and
## does not count in the denominator (§4, §5).
static func add(sums: Array, counts: Array, vector: Variant) -> void:
	if not vector is Array:
		return
	var v: Array = vector
	for i in mini(v.size(), AXES.size()):
		var x := int(v[i])
		if x != 0:
			sums[i] = int(sums[i]) + x
			counts[i] = int(counts[i]) + 1


## pos = (Σ values ≠ 0 / n options with a value ≠ 0) × 5; untouched axis → 0. Range −10..+10.
static func positions(sums: Array, counts: Array) -> Array:
	var out: Array = []
	for i in AXES.size():
		var n := int(counts[i])
		out.append(0.0 if n == 0 else float(sums[i]) / float(n) * SCALE)
	return out


## Index of the largest |position|; tie by Economia → Diplomacia → Sociedade → Estado (§3.3).
static func dominant(pos: Array) -> int:
	var best := 0
	for i in range(1, AXES.size()):
		if absf(float(pos[i])) > absf(float(pos[best])):
			best = i
	return best


static func text_for(index: int, pos: float) -> String:
	if is_zero_approx(pos):
		return TEXTS[index][2]
	return TEXTS[index][0] if pos < 0.0 else TEXTS[index][1]


static func pole_for(index: int, pos: float) -> String:
	if is_zero_approx(pos):
		return ""
	return POLES[index][0] if pos < 0.0 else POLES[index][1]


## Text of the meter reveal on the final screen (gdd/GDD.md §9.2).
static func meter_reveal(meters: Dictionary) -> String:
	for p in REVEAL_PATTERNS:
		if p.get("balance", false):
			if _balanced(meters):
				return p["text"]
			continue
		var ok := true
		for m in p.get("high", []):
			ok = ok and int(meters[m]) > REVEAL_HIGH_ABOVE
		for m in p.get("low", []):
			ok = ok and int(meters[m]) < REVEAL_LOW_BELOW
		if ok:
			return p["text"]
	return REVEAL_NONE


static func _balanced(meters: Dictionary) -> bool:
	for v in meters.values():
		if int(v) < REVEAL_LOW_BELOW or int(v) > REVEAL_HIGH_ABOVE:
			return false
	return true
