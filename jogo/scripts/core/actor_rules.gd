class_name ActorRules
extends RefCounted
## gdd/sistemas/07_atores.md — satisfaction 0-100 starting at 50 (§3.2), ±10 per citation
## with no year multiplier (§3.3, §4), level and the card role it allows (§3.2).


## Applies an option's `actors` field {ACT-xxx: ±1}; returns [{id, old, new}].
static func apply(actors: Dictionary, cited: Variant, step: int) -> Array:
	var out: Array = []
	if not cited is Dictionary:
		return out
	var c: Dictionary = cited
	var ids := c.keys()
	ids.sort()
	for id in ids:
		if not actors.has(id):
			continue
		var before := int(actors[id])
		var after := clampi(before + step * signi(int(c[id])), 0, 100)
		actors[id] = after
		if after != before:
			out.append({"id": id, "old": before, "new": after})
	return out


## Level entry of balance.actor_levels: {id, max, role}. Furioso ≤ 20, Insatisfeito ≤ 40,
## Neutro ≤ 60, Satisfeito ≤ 80, Aliado (§4).
static func level_of(value: int, levels: Array) -> Dictionary:
	for l in levels:
		if value <= int(l["max"]):
			return l
	return levels.back() if not levels.is_empty() else {}


static func role_of(value: int, levels: Array) -> String:
	return String(level_of(value, levels).get("role", ""))


static func is_furious(value: int, levels: Array) -> bool:
	return String(level_of(value, levels).get("id", "")) == "furious"
