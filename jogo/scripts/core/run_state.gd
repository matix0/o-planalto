class_name RunState
extends RefCounted
## Everything a run keeps, saved automatically (gdd/sistemas/10_estado_partida.md §3.4-3.5)
## plus the bookkeeping the flow needs to resume at the exact point (§5).
## JSON-safe: only ints, floats, strings, bools, arrays and string-keyed dictionaries.

const FORMAT_VERSION := 1

# --- Identity and flow ---
var seed: int = 0
var rng_state: int = 0
var state: StringName = &"start"
var year: int = 1                      # 1-4

# --- 01 Meters ---
var meters: Dictionary = {}            # meter id -> int 0..100
var emergency_used: Array = []         # meters that already had their emergency (§3.4 step 5)
var emergency_pending: Array = []      # meters waiting for an emergency card, priority order
var closing_changes: Array = []        # changes of the last turn closing (for the year card)

# --- 07 Actors ---
var actors: Dictionary = {}            # actor id -> satisfaction 0..100

# --- 04 Axis: running sums and counts per axis [Eco, Dip, Soc, Est] ---
var said_sum: Array = [0, 0, 0, 0]
var said_count: Array = [0, 0, 0, 0]
var governed_sum: Array = [0, 0, 0, 0]
var governed_count: Array = [0, 0, 0, 0]

# --- 06 Draw ---
var played: Array = []                 # deck cards already resolved in this run
var turn_cards: Array = []             # deck cards resolved in the current turn
var turn_mandatory: Array = []         # [{card, kind, target}] still to show this turn
var current_card: Dictionary = {}      # {id, side_a, kind, target}

# --- 05 Card result (consequence + learning, read-only after resume) ---
var last_result: Dictionary = {}
var readonly: bool = false

# --- 08 Events ---
var event_queue: Array = []            # [{text, effects, target, origin_id, origin_title, seq}]
var event_seq: int = 0
var epilogue: Array = []               # event texts
var turn_events: Array = []            # events firing at the start of this turn
var event_cursor: int = 0
var current_event: Dictionary = {}     # applied event shown on screen (resume)

# --- 03 Impeachment ---
var capital_streak: int = 0            # consecutive chosen options that lower political capital
var impeachment: Dictionary = {}       # see ImpeachmentRules.start()

# --- Calibration (docs/15 §15.04) ---
var calibration_index: int = 0
var calibration_side_a: int = 1

# --- 02 Ending ---
var ending: Dictionary = {}            # {id, reason, meter}

# --- Misc ---
var save_failed_notified: bool = false


func to_dict() -> Dictionary:
	return {
		"format_version": FORMAT_VERSION,
		"seed": str(seed),
		"rng_state": str(rng_state),
		"state": String(state),
		"year": year,
		"meters": meters.duplicate(true),
		"emergency_used": emergency_used.duplicate(),
		"emergency_pending": emergency_pending.duplicate(),
		"closing_changes": closing_changes.duplicate(true),
		"actors": actors.duplicate(true),
		"said_sum": said_sum.duplicate(),
		"said_count": said_count.duplicate(),
		"governed_sum": governed_sum.duplicate(),
		"governed_count": governed_count.duplicate(),
		"played": played.duplicate(),
		"turn_cards": turn_cards.duplicate(),
		"turn_mandatory": turn_mandatory.duplicate(true),
		"current_card": current_card.duplicate(true),
		"last_result": last_result.duplicate(true),
		"readonly": readonly,
		"event_queue": event_queue.duplicate(true),
		"event_seq": event_seq,
		"epilogue": epilogue.duplicate(),
		"turn_events": turn_events.duplicate(true),
		"event_cursor": event_cursor,
		"current_event": current_event.duplicate(true),
		"capital_streak": capital_streak,
		"impeachment": impeachment.duplicate(true),
		"calibration_index": calibration_index,
		"calibration_side_a": calibration_side_a,
		"ending": ending.duplicate(true),
		"save_failed_notified": save_failed_notified,
	}


## Returns null when the dictionary is not a save of this format (gdd 10 §5). Type-safe: a
## field of the wrong type gives null (corrupted save), never a script error.
static func from_dict(d: Dictionary) -> RunState:
	if _num(d.get("format_version"), -1) != FORMAT_VERSION:
		return null
	for key in ["seed", "rng_state", "state", "year", "meters", "actors"]:
		if not d.has(key):
			return null
	if not (d["meters"] is Dictionary and d["actors"] is Dictionary and d["state"] is String):
		return null
	var r := RunState.new()
	r.seed = _num(d["seed"], 0)
	r.rng_state = _num(d["rng_state"], 0)
	r.state = StringName(String(d["state"]))
	r.year = _num(d["year"], -1)
	r.meters = _int_values(d["meters"])
	r.emergency_used = _strings(d.get("emergency_used"))
	r.emergency_pending = _strings(d.get("emergency_pending"))
	r.closing_changes = _array(d.get("closing_changes"))
	r.actors = _int_values(d["actors"])
	r.said_sum = _ints(d.get("said_sum"), 4)
	r.said_count = _ints(d.get("said_count"), 4)
	r.governed_sum = _ints(d.get("governed_sum"), 4)
	r.governed_count = _ints(d.get("governed_count"), 4)
	r.played = _strings(d.get("played"))
	r.turn_cards = _strings(d.get("turn_cards"))
	r.turn_mandatory = _array(d.get("turn_mandatory"))
	r.current_card = _dict(d.get("current_card"))
	r.last_result = _dict(d.get("last_result"))
	r.readonly = d.get("readonly") == true
	r.event_queue = _array(d.get("event_queue"))
	r.event_seq = _num(d.get("event_seq"), 0)
	r.epilogue = _strings(d.get("epilogue"))
	r.turn_events = _array(d.get("turn_events"))
	r.event_cursor = _num(d.get("event_cursor"), 0)
	r.current_event = _dict(d.get("current_event"))
	r.capital_streak = _num(d.get("capital_streak"), 0)
	r.impeachment = _dict(d.get("impeachment"))
	r.calibration_index = _num(d.get("calibration_index"), 0)
	r.calibration_side_a = _num(d.get("calibration_side_a"), 1)
	r.ending = _dict(d.get("ending"))
	r.save_failed_notified = d.get("save_failed_notified") == true
	if r.meters.size() != 8 or r.year < 1 or r.year > 4 or r.said_sum.size() != 4 \
			or r.said_count.size() != 4 or r.governed_sum.size() != 4 or r.governed_count.size() != 4:
		return null
	for list in [r.turn_mandatory, r.event_queue, r.turn_events]:
		for e in list:
			if not e is Dictionary:
				return null
	return r


## Integer from a JSON number, or from a string (64-bit values travel as strings, since JSON
## numbers are doubles); `fallback` for any other type.
static func _num(v: Variant, fallback: int) -> int:
	if v is int or v is float:
		return int(v)
	if v is String and (v as String).is_valid_int():
		return (v as String).to_int()
	return fallback


static func _int_values(src: Variant) -> Dictionary:
	var out := {}
	if src is Dictionary:
		for k in src:
			out[String(k)] = _num(src[k], 0)
	return out


static func _ints(src: Variant, size: int) -> Array:
	var out: Array = []
	if src is Array:
		for v in src:
			out.append(_num(v, 0))
	elif src == null:
		out.resize(size)
		out.fill(0)
	return out


static func _strings(src: Variant) -> Array:
	var out: Array = []
	if src is Array:
		for v in src:
			out.append(String(v) if v is String else str(v))
	return out


static func _array(src: Variant) -> Array:
	return normalize(src) if src is Array else []


static func _dict(src: Variant) -> Dictionary:
	return normalize(src) if src is Dictionary else {}


## JSON turns every number into a float; whole floats become ints again so a restored run
## compares equal to the original (save/resume round-trip).
static func normalize(v: Variant) -> Variant:
	if v is float and is_equal_approx(v, round(v)) and absf(v) < 1e15:
		return int(v)
	if v is Array:
		var a: Array = []
		for x in v:
			a.append(normalize(x))
		return a
	if v is Dictionary:
		var o := {}
		for k in v:
			o[String(k)] = normalize(v[k])
		return o
	return v
