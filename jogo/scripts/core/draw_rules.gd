class_name DrawRules
extends RefCounted
## gdd/sistemas/06_sorteio.md — eligibility (§3.1), linked card (§3.2), mandatory cards at
## the start of the turn (§3.3, §4) and the random slots (§3.4), with the edge cases of §5.
## Randomness only through the run's RNG, over sorted ids (deterministic for a seed).


## §3.1: learning card exists (D-102), not played, `min_year` reached, actor card matching
## the actor's current level, not an impeachment card.
static func is_eligible(data: GameDatabase, run: RunState, id: String) -> bool:
	if not data.cards.has(id):
		return false
	var card: Dictionary = data.cards[id]
	if card.get("type") == "impeachment" or run.played.has(id):
		return false
	if not data.learning.has(String(card.get("learning_id", ""))):
		return false
	if int(card.get("prerequisites", {}).get("min_year", 1)) > run.year:
		return false
	if card.get("type") == "actor":
		var owner := data.owner_of(id)
		if owner.is_empty():
			return false
		var satisfaction := int(run.actors.get(owner["actor"], 50))
		if ActorRules.role_of(satisfaction, data.balance.get("actor_levels", [])) != owner["role"]:
			return false
	return true


## Mandatory list of the turn, in showing order: emergencies (outside the cap), then furious
## actors' attack cards and linked cards for meters below the limit, up to the cap
## (O = Em + min(C, max(0, T − Em)), §4). Clears `run.emergency_pending`.
static func build_mandatory(data: GameDatabase, run: RunState, rng: RandomNumberGenerator) -> Array:
	var balance := data.balance
	var order := Array(data.meter_ids)
	var cap := int(balance.get("max_mandatory_per_turn", 3))
	var below := int(balance.get("linked_card_below", 30))
	var levels: Array = balance.get("actor_levels", [])
	var taken := {}
	var list: Array = []
	# 1. Emergency (§3.3.1): one linked card per meter; no linked card → not spent (§5).
	for m in run.emergency_pending:
		var c := _pick_linked(data, run, rng, String(m), taken)
		if c != "":
			list.append({"card": c, "kind": "emergency", "target": String(m)})
			taken[c] = true
	run.emergency_pending = []
	var emergencies := list.size()
	var candidates: Array = []
	# 2. Actor (§3.3.2): furious actors whose attack card has not come out; lowest
	#    satisfaction first, tie by lowest id.
	var furious: Array = []
	for a in data.actors:
		if ActorRules.is_furious(int(run.actors.get(a, 50)), levels):
			furious.append(a)
	furious.sort_custom(func(x: Variant, y: Variant) -> bool: return int(run.actors[x]) < int(run.actors[y]) or (int(run.actors[x]) == int(run.actors[y]) and String(x) < String(y)))
	for a in furious:
		var attack := String(data.actors[a].get("cards", {}).get("attack", ""))
		if attack == "" or taken.has(attack) or not is_eligible(data, run, attack):
			continue
		candidates.append({"card": attack, "kind": "actor", "target": String(a)})
		taken[attack] = true
	# 3. Meter (§3.3.3): meters below the limit, lowest value first, tie by table order.
	#    A card already listed that is linked to the meter serves it once (§5).
	var low: Array = order.filter(func(m: Variant) -> bool: return int(run.meters[m]) < below)
	low.sort_custom(func(x: Variant, y: Variant) -> bool: return int(run.meters[x]) < int(run.meters[y]) or (int(run.meters[x]) == int(run.meters[y]) and order.find(x) < order.find(y)))
	for m in low:
		if _served(data, taken, String(m)):
			continue
		var c := _pick_linked(data, run, rng, String(m), taken)
		if c != "":
			candidates.append({"card": c, "kind": "meter", "target": String(m)})
			taken[c] = true
	# Cap: the excess is dropped and checked again next turn (§3.3).
	return list + candidates.slice(0, maxi(0, cap - emergencies))


## Next card to show: the first mandatory one if still eligible (checked again at display,
## §5), else a random slot. {} when no card is eligible (the turn closes early).
static func next_entry(data: GameDatabase, run: RunState, rng: RandomNumberGenerator) -> Dictionary:
	if not run.turn_mandatory.is_empty():
		var e: Dictionary = run.turn_mandatory.pop_front()
		if is_eligible(data, run, String(e["card"])):
			return e
	var pick := draw_random(data, run, rng)
	if pick == "":
		return {}
	return {"card": pick, "kind": "draw", "target": ""}


## Random slot (§3.4): equal weight among eligible cards whose mode has not appeared this
## turn (mandatory included); none → the mode rule is relaxed. "" when nothing is eligible.
static func draw_random(data: GameDatabase, run: RunState, rng: RandomNumberGenerator) -> String:
	var reserved := {}
	var seen := {}
	for e in run.turn_mandatory:
		reserved[e["card"]] = true
		seen[data.cards[e["card"]]["mode"]] = true
	for id in run.turn_cards:
		seen[data.cards[id]["mode"]] = true
	var eligible: Array = []
	for id in _sorted_ids(data):
		if not reserved.has(id) and is_eligible(data, run, id):
			eligible.append(id)
	var fresh: Array = eligible.filter(func(id: Variant) -> bool: return not seen.has(data.cards[id]["mode"]))
	return pick_uniform(fresh if not fresh.is_empty() else eligible, rng)


static func pick_uniform(pool: Array, rng: RandomNumberGenerator) -> String:
	if pool.is_empty():
		return ""
	return String(pool[rng.randi_range(0, pool.size() - 1)])


## Linked eligible card for a meter, not already taken. Which one: equal chance among them
## (a validar: gdd 06 §3.3 does not say how the linked card is chosen).
static func _pick_linked(data: GameDatabase, run: RunState, rng: RandomNumberGenerator, meter: String, taken: Dictionary) -> String:
	var pool: Array = []
	for id in _sorted_ids(data):
		if not taken.has(id) and CardRules.is_linked(data.cards[id], meter) and is_eligible(data, run, id):
			pool.append(id)
	return pick_uniform(pool, rng)


static func _served(data: GameDatabase, taken: Dictionary, meter: String) -> bool:
	for id in taken:
		if CardRules.is_linked(data.cards[id], meter):
			return true
	return false


static func _sorted_ids(data: GameDatabase) -> Array:
	var ids := data.cards.keys()
	ids.sort()
	return ids
