class_name GameDatabase
extends Node
## Loads and validates the static game data in res://data (P-005, D-138).
## Invalid cards are left out of the deck and reported in `errors`
## (gdd/sistemas/07_atores.md §5). Autoload name: GameData.

const DATA_DIR := "res://data/"
const SPEAKER_TBD := "[quem fala — a definir]"   # D-164; a validar (temáticas e cena)
const CALIBRATION_QUESTIONS := 6                 # docs/15 §15.04
const SCENE_PHASES := 5                          # gdd/sistemas/03_impeachment.md §3.2
const TEST_OPS := ["<", ">", "<=", ">="]
const OPTION_TEXT_MAX := 25                      # D-177: "frase curta, até 25 caracteres"

const CARD_TYPES := ["institutional", "thematic", "actor", "impeachment"]
const CARD_PREFIX := {"institutional": "INST-", "thematic": "THEM-", "actor": "ATOR-"}
const COLORS := ["red", "blue", "green", "yellow", "purple", "orange", "black"]
const TECHNIQUES := ["demoralization", "moral_panic", "deepfake", "ai_farm", "doom_cache", "accusatory_didacticism"]
const REACTIONS := ["accept", "refuse", "investigate"]
const ACTOR_CATEGORIES := ["capital", "state", "civil_society", "media_tech"]
const ACTOR_ROLES := ["attack", "demand", "offer"]
const ENDING_CATEGORIES := ["catastrophe", "extermination", "democracy_loss", "capture", "strengthening", "care_sovereignty", "neutral", "exit"]
const ENDING_TRIGGERS := ["instant", "impeachment", "end_of_term", "exit"]
const CONDITION_OPS := ["==", "<", ">", ">="]

var meters: Array = []          # ordered as gdd/GDD.md §6.1.1 (tie-break order)
var meter_ids: PackedStringArray = []
var modes: Dictionary = {}      # id -> mode
var actors: Dictionary = {}     # id -> actor
var endings: Dictionary = {}    # id -> ending
var cards: Dictionary = {}      # id -> card (valid only)
var balance: Dictionary = {}
var calibration: Array = []     # 6 questions, card-shaped (docs/15 §15.04)
var learning: Dictionary = {}   # id -> Learning Card (doc 18 blocks; fictitious, D-139)
var impeachment_cards: Array = []  # the 5 scene cards, ordered by phase (gdd 03 §4.1)
var meter_info: Dictionary = {} # id -> meter entry of meters.json
var errors: PackedStringArray = []
var data_dir := DATA_DIR       # tests point it at res://tests/fixtures/data/ (fictitious deck, D-139)


func _ready() -> void:
	load_all()


func load_all() -> bool:
	errors.clear()
	meters = _read("meters.json", [])
	balance = _read("balance.json", {})
	modes = _index(_read("modes.json", []), "modes")
	actors = _index(_read("actors.json", []), "actors")
	endings = _index(_read("endings.json", []), "endings")
	meter_ids = PackedStringArray(meters.map(func(m): return m.get("id", "")))
	meter_info = {}
	for m in meters:
		meter_info[m.get("id", "")] = m
	_validate_meters()
	_validate_actors()
	_validate_endings()
	cards = {}
	var all_cards: Dictionary = _index(_read("cards.json", []), "cards")
	for id in all_cards:
		var card_errors := validate_card(all_cards[id])
		if card_errors.is_empty():
			cards[id] = all_cards[id]
		else:
			for e in card_errors:
				errors.append("%s: %s" % [id, e])
	_validate_actor_card_refs(all_cards)
	calibration = _read("calibration.json", [])
	_validate_calibration()
	learning = _index(_read("learning.json", []), "learning")
	_validate_learning()
	_load_impeachment_cards()
	for e in errors:
		push_warning("GameData: " + e)
	return errors.is_empty()


## Who presents the problem (D-164, gdd/sistemas/05_cartas.md §3.2): `quem_fala` (or
## `speaker`) when filled — an actor id or an institution name; otherwise the actor of an
## actor card, the mode's institution for an institutional card, else "[quem fala — a definir]".
## Returns {name, actor} — `actor` is the ACT-xxx id for the portrait, or "".
func speaker_for(card: Dictionary) -> Dictionary:
	var who := String(card.get("speaker", card.get("quem_fala", "")))
	if actors.has(who):
		return {"name": String(actors[who].get("name", who)), "actor": who}
	if who != "":
		return {"name": who, "actor": ""}
	match String(card.get("type", "")):
		"actor":
			var owner := owner_of(String(card.get("id", "")))
			if not owner.is_empty():
				return {"name": String(actors[owner["actor"]].get("name", "")), "actor": owner["actor"]}
		"institutional":
			if modes.has(card.get("mode", "")):
				return {"name": String(modes[card["mode"]].get("name", "")), "actor": ""}
	return {"name": SPEAKER_TBD, "actor": ""}


## {actor, role} of an ATOR-xxx card, or {} (gdd/sistemas/07_atores.md §3.4).
func owner_of(card_id: String) -> Dictionary:
	return _actor_owning(card_id)


func validate_card(card: Dictionary) -> PackedStringArray:
	var out: PackedStringArray = []
	var id: String = card.get("id", "")
	var type: String = card.get("type", "")
	if type not in CARD_TYPES:
		out.append("invalid type '%s'" % type)
	elif CARD_PREFIX.has(type) and not id.begins_with(CARD_PREFIX[type]):
		out.append("id does not match type")
	if not modes.has(card.get("mode", "")):
		out.append("unknown mode '%s'" % card.get("mode", ""))
	if String(card.get("title", "")).split(" ", false).size() > 5:
		out.append("title over 5 words")
	# D-164: who presents the problem — an actor (ACT-xxx) or the mode's institution.
	var who := String(card.get("speaker", card.get("quem_fala", ""))).strip_edges()
	if who.is_empty():
		out.append("missing speaker (quem_fala, D-164)")
	elif who.begins_with("ACT-") and not actors.has(who):
		out.append("unknown speaker actor '%s'" % who)
	var number := id.get_slice("-", 1)
	if type != "impeachment" and not String(card.get("learning_id", "")).begins_with("APR-"):
		out.append("missing learning_id")
	elif type == "institutional" and card.get("learning_id") != "APR-" + number:
		out.append("learning_id must be APR-" + number)
	var min_year = card.get("prerequisites", {}).get("min_year", 1)
	if not (min_year is float or min_year is int) or min_year < 1 or min_year > 4:
		out.append("min_year out of 1-4")

	var influencer: bool = card.get("mode") == "influencer"
	if influencer and card.get("technique", "") not in TECHNIQUES:
		out.append("influencer card needs a valid technique")
	if not influencer and card.has("technique"):
		out.append("technique only in influencer mode")

	var owner := _actor_owning(id)
	var role: String = owner.get("role", "")
	var options := [card.get("option_a", {}), card.get("option_b", {})]
	if options[0].get("color") == options[1].get("color"):
		out.append("options share a color")
	if influencer and options[0].get("reaction") == options[1].get("reaction"):
		out.append("options share a reaction")
	var any_goodwill := false
	for i in 2:
		var o: Dictionary = options[i]
		var tag := "option_%s: " % ["a", "b"][i]
		var goodwill := _validate_option(o, influencer, type == "impeachment", tag, out)
		if goodwill:
			if role != "offer" or any_goodwill:
				out.append(tag + "needs at least one negative effect")
			any_goodwill = true
		if type == "actor" and o.get("actors", {}).get(owner.get("actor", ""), 0) == 0:
			out.append(tag + "actor card must cite its actor")
	if type == "actor" and owner.is_empty():
		out.append("actor card not listed in any actor")
	return out


## Returns true when the option has no negative effect (Boa Vontade, D-108).
func _validate_option(o: Dictionary, influencer: bool, impeachment: bool, tag: String, out: PackedStringArray) -> bool:
	var text := String(o.get("text", ""))
	if text.is_empty():
		out.append(tag + "missing text")
	elif text.length() > OPTION_TEXT_MAX:
		out.append(tag + "text over %d characters (D-177): %d" % [OPTION_TEXT_MAX, text.length()])
	if String(o.get("consequence", "")).is_empty():
		out.append(tag + "missing consequence")
	if o.get("color") not in COLORS:
		out.append(tag + "invalid color")
	var axis = o.get("axis", [])
	if typeof(axis) != TYPE_ARRAY or axis.size() != 4 or axis.any(func(v): return typeof(v) != TYPE_FLOAT or v != int(v) or absf(v) > 2):
		out.append(tag + "axis must be 4 integers in -2..2")
	var effects: Dictionary = o.get("effects", {})
	if effects.size() < 2 or effects.size() > 4:
		out.append(tag + "effects must touch 2-4 meters")
	var has_negative := false
	for m in effects:
		var v = effects[m]
		if m not in meter_ids:
			out.append(tag + "unknown meter '%s'" % m)
		elif typeof(v) != TYPE_FLOAT or v != int(v) or int(v) % 5 != 0 or absf(v) < 5 or absf(v) > 30:
			out.append(tag + "effect on %s must be ±5..±30, multiple of 5" % m)
		has_negative = has_negative or v < 0
	var cited: Dictionary = o.get("actors", {})
	if cited.size() > 3:
		out.append(tag + "more than 3 actors")
	for a in cited:
		if not actors.has(a):
			out.append(tag + "unknown actor '%s'" % a)
		elif absf(cited[a]) != 1:
			out.append(tag + "actor value must be ±1")
	var events: Array = o.get("events", [])
	if events.size() > 1:
		out.append(tag + "at most 1 event")
	for ev in events:
		var delay = ev.get("delay", 0)
		if typeof(delay) != TYPE_FLOAT or delay < 1 or delay > 2:
			out.append(tag + "event delay must be 1-2")
		var ev_effects: Dictionary = ev.get("effects", {})
		if ev_effects.size() < 1 or ev_effects.size() > 3:
			out.append(tag + "event effects must touch 1-3 meters")
		for m in ev_effects:
			if m not in meter_ids or absf(ev_effects[m]) < 5 or absf(ev_effects[m]) > 20:
				out.append(tag + "event effect on %s must be ±5..±20" % m)
	if influencer:
		var reaction = o.get("reaction", "")
		if reaction not in REACTIONS:
			out.append(tag + "invalid reaction")
		elif reaction == "accept" and effects.get("integrity", 0) >= 0 and effects.get("awareness", 0) >= 0:
			out.append(tag + "'accept' must lose integrity or awareness")
	elif o.has("reaction"):
		out.append(tag + "reaction only in influencer mode")
	if impeachment != o.has("test"):
		out.append(tag + "'test' only and always in impeachment cards")
	return not has_negative and effects.size() > 0


func _actor_owning(card_id: String) -> Dictionary:
	for a in actors.values():
		for role in a.get("cards", {}):
			if a["cards"][role] == card_id:
				return {"actor": a["id"], "role": role}
	return {}


func _validate_meters() -> void:
	if meters.size() != 8:
		errors.append("meters: expected 8, got %d" % meters.size())
	for m in meters:
		var initial = m.get("initial", -1)
		if initial < 0 or initial > 100:
			errors.append("meter %s: initial out of 0-100" % m.get("id"))
		for key in ["zero_ending", "capture_ending"]:
			if m.get(key) != null and not endings.has(m[key]):
				errors.append("meter %s: unknown %s" % [m.get("id"), key])


func _validate_actors() -> void:
	if actors.size() != 24:
		errors.append("actors: expected 24, got %d" % actors.size())
	for a in actors.values():
		if a.get("category") not in ACTOR_CATEGORIES:
			errors.append("actor %s: invalid category" % a.get("id"))
		for key in ["offers", "costs"]:
			for m in a.get(key, []):
				if m not in meter_ids:
					errors.append("actor %s: unknown meter in %s" % [a.get("id"), key])
		for role in a.get("cards", {}):
			if role not in ACTOR_ROLES:
				errors.append("actor %s: invalid card role '%s'" % [a.get("id"), role])


func _validate_actor_card_refs(all_cards: Dictionary) -> void:
	for a in actors.values():
		for role in a.get("cards", {}):
			if not all_cards.has(a["cards"][role]):
				errors.append("actor %s: card %s not found" % [a["id"], a["cards"][role]])


func _validate_endings() -> void:
	if endings.size() != 28:
		errors.append("endings: expected 28, got %d" % endings.size())
	for e in endings.values():
		if e.get("category") not in ENDING_CATEGORIES:
			errors.append("ending %s: invalid category" % e.get("id"))
		if e.get("trigger") not in ENDING_TRIGGERS:
			errors.append("ending %s: invalid trigger" % e.get("id"))
		for c in e.get("conditions", []):
			if c.get("meter") not in meter_ids or c.get("op") not in CONDITION_OPS:
				errors.append("ending %s: invalid condition" % e.get("id"))
	_apply_capture_limit()


## V-035: the Capture limit lives in balance.json (`capture_at_or_above`, gdd/sistemas/02_finais.md
## §7); the "≥" condition of every Capture ending reads it, whatever endings.json says.
func _apply_capture_limit() -> void:
	if not balance.has("capture_at_or_above"):
		return
	var limit := int(balance["capture_at_or_above"])
	for e in endings.values():
		if e.get("category") != "capture":
			continue
		for c in e.get("conditions", []):
			if c.get("op") == ">=":
				c["value"] = limit


## docs/15 §15.04: 6 questions, each answer ±5 on 1-2 meters (gdd 01 §3.2) and an axis vector.
func _validate_calibration() -> void:
	if calibration.size() != CALIBRATION_QUESTIONS:
		errors.append("calibration: expected %d questions, got %d" % [CALIBRATION_QUESTIONS, calibration.size()])
	var step := int(balance.get("calibration_step", 5))
	for q in calibration:
		var tag := "calibration %s: " % (q.get("id", "?") if q is Dictionary else "?")
		if not q is Dictionary or String(q.get("question", "")).is_empty():
			errors.append(tag + "missing question")
			continue
		for key in ["option_a", "option_b"]:
			var o: Dictionary = q.get(key, {})
			if String(o.get("text", "")).is_empty():
				errors.append(tag + key + " missing text")
			var effects: Dictionary = o.get("effects", {})
			if effects.is_empty():
				errors.append(tag + key + " without effects")
			for m in effects:
				if m not in meter_ids or absf(effects[m]) != step:
					errors.append(tag + key + " effect on %s must be ±%d" % [m, step])
			var axis = o.get("axis", [])
			if typeof(axis) != TYPE_ARRAY or axis.size() != 4 or axis.any(func(v): return typeof(v) != TYPE_FLOAT or v != int(v) or absf(v) > 2):
				errors.append(tag + key + " axis must be 4 integers in -2..2")


## Every learning card has the 5 blocks of doc 18 §18.01.2; a source has a label (url may be
## empty for fictitious data, D-091). A card whose learning card is missing stays out of the
## draw (gdd/sistemas/06_sorteio.md §3.1) — reported here.
## Doc 18 blocks + a verified source (D-091): label and an http(s) link. A Learning Card that
## fails leaves the data, so its card leaves the draw (D-102, V-015). Placeholders of the
## prototype (`"fictitious": true`, D-139) need only the label.
func _validate_learning() -> void:
	for id in learning.keys():
		var l: Dictionary = learning[id]
		var problems: PackedStringArray = []
		for key in ["lived", "concept", "data", "impact"]:
			if String(l.get(key, "")).is_empty():
				problems.append("missing " + key)
		var source = l.get("source", {})
		if typeof(source) != TYPE_DICTIONARY or String(source.get("label", "")).is_empty():
			problems.append("source needs a label")
		elif not bool(l.get("fictitious", false)):
			var url := String(source.get("url", ""))
			if not (url.begins_with("https://") or url.begins_with("http://")):
				problems.append("source needs a verified link (D-091)")
		for p in problems:
			errors.append("learning %s: %s" % [id, p])
		if not problems.is_empty():
			learning.erase(id)
	for id in cards:
		if not learning.has(String(cards[id].get("learning_id", ""))):
			errors.append("%s: learning card %s not found (card out of the draw)" % [id, cards[id].get("learning_id", "")])


## The 5 scene cards (gdd/sistemas/03_impeachment.md §3.2, §4.1): type `impeachment`, one per
## phase, a test {meter, op, value} on each option, no events (gdd/sistemas/08_eventos.md §3.1).
func _load_impeachment_cards() -> void:
	impeachment_cards = []
	var by_phase := {}
	for c in _read("impeachment.json", []):
		var id: String = c.get("id", "?") if c is Dictionary else "?"
		var e: PackedStringArray = validate_card(c) if c is Dictionary else PackedStringArray(["not an object"])
		if c is Dictionary:
			if c.get("type") != "impeachment":
				e.append("scene card must have type 'impeachment'")
			var phase = c.get("phase", 0)
			if typeof(phase) != TYPE_FLOAT or phase < 1 or phase > SCENE_PHASES or by_phase.has(int(phase)):
				e.append("phase must be a unique 1-%d" % SCENE_PHASES)
			for key in ["option_a", "option_b"]:
				var o: Dictionary = c.get(key, {})
				if not o.get("events", []).is_empty():
					e.append(key + ": scene cards have no events")
				var t = o.get("test", {})
				if typeof(t) != TYPE_DICTIONARY or String(t.get("meter", "")) not in meter_ids or String(t.get("op", "")) not in TEST_OPS or typeof(t.get("value")) != TYPE_FLOAT:
					e.append(key + ": test must be {meter, op, value}")
			if not String(c.get("learning_id", "")).is_empty() and not learning.has(c["learning_id"]):
				e.append("learning card %s not found" % c["learning_id"])
		if e.is_empty():
			by_phase[int(c["phase"])] = c
		else:
			for x in e:
				errors.append("%s: %s" % [id, x])
	for p in range(1, SCENE_PHASES + 1):
		if by_phase.has(p):
			impeachment_cards.append(by_phase[p])
		else:
			errors.append("impeachment: no valid card for phase %d" % p)


func _read(file: String, fallback: Variant) -> Variant:
	var path := data_dir + file
	var text := FileAccess.get_file_as_string(path)
	if text.is_empty():
		errors.append("%s: cannot read (%s)" % [path, error_string(FileAccess.get_open_error())])
		return fallback
	var json := JSON.new()
	if json.parse(text) != OK:
		errors.append("%s:%d: %s" % [path, json.get_error_line(), json.get_error_message()])
		return fallback
	if typeof(json.data) != typeof(fallback):
		errors.append("%s: unexpected top-level type" % path)
		return fallback
	return json.data


func _index(items: Array, what: String) -> Dictionary:
	var out := {}
	for item in items:
		var id = item.get("id", "") if item is Dictionary else ""
		if id == "":
			errors.append("%s: entry without id" % what)
		elif out.has(id):
			errors.append("%s: duplicate id %s" % [what, id])
		else:
			out[id] = item
	return out
