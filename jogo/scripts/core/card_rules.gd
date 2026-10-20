class_name CardRules
extends RefCounted
## gdd/sistemas/05_cartas.md — side of each option drawn at display (§3.4), option behind a
## side, the two sides as shown (text + party colour, never "esquerda/direita", D-084).

const SIDES: Array[int] = [-1, 1]


## Side where `option_a` shows: 50%, independent of other cards (§3.4).
static func draw_side(rng: RandomNumberGenerator) -> int:
	return -1 if rng.randi_range(0, 1) == 0 else 1


static func option_key(side: int, side_a: int) -> String:
	return "option_a" if side == side_a else "option_b"


## {-1: {text, color}, 1: {text, color}}. Calibration cards have no party colour (only the
## white rule, D-166): `colored` = false gives "".
static func sides(card: Dictionary, side_a: int, colored: bool) -> Dictionary:
	var a: Dictionary = card.get("option_a", {})
	var b: Dictionary = card.get("option_b", {})
	return {
		side_a: {"text": String(a.get("text", "")), "color": String(a.get("color", "")) if colored else ""},
		-side_a: {"text": String(b.get("text", "")), "color": String(b.get("color", "")) if colored else ""},
	}


## A card is linked to meter M when one of its options raises M (gdd/sistemas/06_sorteio.md §3.2).
static func is_linked(card: Dictionary, meter: String) -> bool:
	for key in ["option_a", "option_b"]:
		if int(card.get(key, {}).get("effects", {}).get(meter, 0)) > 0:
			return true
	return false


static func is_valid_side(side: int) -> bool:
	return SIDES.has(side)
