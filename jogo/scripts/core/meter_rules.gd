class_name MeterRules
extends RefCounted
## gdd/sistemas/01_medidores.md — effect of a card or event (§3.3, §4.1), turn closing
## (§3.4, §4.2), meters at 0 and emergency order (§5). Pure functions on a meters
## dictionary {meter id: int 0..100}; `order` is the table order (tie-breaks).

const CAPITAL := "political_capital"
const AWARENESS := "awareness"
const INTEGRITY := "integrity"
const MIN_VALUE := 0
const MAX_VALUE := 100


## Nearest integer; a tie (,5) goes away from zero (§3.3 step 3).
static func round_away(x: float) -> int:
	return int(signf(x) * floorf(absf(x) + 0.5))


## Δ = arred(E × M × D); a non-zero base never rounds to 0 (§4.1).
static func scaled_delta(base: int, multiplier: float, factor: float = 1.0) -> int:
	if base == 0:
		return 0
	var r := round_away(float(base) * multiplier * factor)
	if r == 0:
		r = 1 if base > 0 else -1
	return r


## Applies an option or event effect with the year multiplier (§3.3). A loss of
## `awareness` is multiplied by the doubling factor while `integrity` is below the limit
## **before** the card (§4.1, D). Returns the changes in table order (see `_commit`).
static func apply_effects(meters: Dictionary, effects: Dictionary, multiplier: float, balance: Dictionary, order: Array) -> Array:
	var doubling: Dictionary = balance.get("awareness_loss_doubling", {})
	var doubled: bool = int(meters.get(INTEGRITY, MAX_VALUE)) < int(doubling.get("integrity_below", 30))
	var factor := float(doubling.get("factor", 2))
	var deltas := {}
	for m in order:
		if not effects.has(m):
			continue
		var base := int(effects[m])
		var f := factor if (m == AWARENESS and base < 0 and doubled) else 1.0
		deltas[m] = scaled_delta(base, multiplier, f)
	return _commit(meters, deltas, order)


## Adds raw values, clamped: calibration answers (§3.2, ±5) and impeachment acquittal.
static func apply_flat(meters: Dictionary, effects: Dictionary, order: Array) -> Array:
	var deltas := {}
	for m in order:
		if effects.has(m):
			deltas[m] = int(effects[m])
	return _commit(meters, deltas, order)


## Turn closing, steps 1-3: one snapshot, relations + thresholds + balance bonus summed at
## once, no year multiplier, clamped (§3.4, §4.2).
static func close_turn(meters: Dictionary, balance: Dictionary, order: Array) -> Array:
	var snap: Dictionary = meters.duplicate()
	var deltas := {}
	for m in order:
		deltas[m] = 0
	for r in balance.get("relations", []):
		if compare(int(snap[r["source"]]), String(r["op"]), int(r["value"])):
			for m in r.get("effects", {}):
				deltas[m] += int(r["effects"][m])
	for t in balance.get("thresholds", []):
		if compare(int(snap[t["source"]]), String(t["op"]), int(t["value"])):
			if t.has("effects_all_others"):
				for m in order:
					if m != t["source"]:
						deltas[m] += int(t["effects_all_others"])
			for m in t.get("effects", {}):
				deltas[m] += int(t["effects"][m])
	var bonus: Dictionary = balance.get("balance_bonus", {})
	if not bonus.is_empty():
		var limit := int(bonus.get("all_above", 45))
		if order.all(func(m: Variant) -> bool: return int(snap[m]) > limit):
			for m in order:
				deltas[m] += int(bonus.get("amount", 0))
	return _commit(meters, deltas, order)


static func compare(value: int, op: String, limit: int) -> bool:
	match op:
		"<":
			return value < limit
		">":
			return value > limit
		"<=":
			return value <= limit
		">=":
			return value >= limit
		"==":
			return value == limit
	push_error("MeterRules: unknown operator '%s'" % op)
	return false


## Meters at 0 that end the run: all except political capital (D-095).
static func zeroed(meters: Dictionary, order: Array) -> Array:
	var out: Array = []
	for m in order:
		if m != CAPITAL and int(meters[m]) <= MIN_VALUE:
			out.append(m)
	return out


## Two or more meters at 0 in the same card, event or closing: the one that lost most in
## it; tie by table order (gdd/sistemas/02_finais.md §3.2).
static func catastrophe_meter(zero_ids: Array, changes: Array, order: Array) -> String:
	var best := ""
	var best_loss := -1
	for m in order:
		if not zero_ids.has(m):
			continue
		var loss := 0
		for c in changes:
			if c["id"] == m:
				loss = -int(c["delta"])
		if loss > best_loss:
			best = m
			best_loss = loss
	return best


## Emergency requests after a closing (§3.4 step 5): meters ≤ limit that never had one;
## lowest value first, tie by table order (§5).
static func emergency_order(meters: Dictionary, exclude: Array, limit: int, order: Array) -> Array:
	var out: Array = []
	for m in order:
		if int(meters[m]) <= limit and not exclude.has(m):
			out.append(m)
	out.sort_custom(func(a: Variant, b: Variant) -> bool: return int(meters[a]) < int(meters[b]) or (int(meters[a]) == int(meters[b]) and order.find(a) < order.find(b)))
	return out


## Value band 1-5 (0-20 … 81-100), the HUD fill steps (docs/14 §14.11.3).
static func band_of(value: int) -> int:
	return clampi(ceili(float(value) / 20.0), 1, 5)


## Writes the deltas (clamped 0-100) and returns what actually changed, in table order:
## [{id, old, new, delta, band_old, band_new, dot}]. `dot` = "small" for |Δ| ≤ 10 and "big"
## above, on the applied change (docs/14 §14.05; a validar: Δ aplicado, não o efeito base).
static func _commit(meters: Dictionary, deltas: Dictionary, order: Array) -> Array:
	var out: Array = []
	for m in order:
		if not deltas.has(m):
			continue
		var before := int(meters[m])
		var after := clampi(before + int(deltas[m]), MIN_VALUE, MAX_VALUE)
		meters[m] = after
		if after == before:
			continue
		out.append({
			"id": m,
			"old": before,
			"new": after,
			"delta": after - before,
			"band_old": band_of(before),
			"band_new": band_of(after),
			"dot": "big" if absi(after - before) > 10 else "small",
		})
	return out
