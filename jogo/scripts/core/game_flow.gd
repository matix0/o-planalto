class_name GameFlow
extends RefCounted
## gdd/sistemas/10_estado_partida.md — the run's state machine (§3.1-3.3, §5). Runs systems
## 01-09 through the rule modules and keeps everything in a RunState. Pure logic: no Nodes,
## no files. The Game autoload saves `to_dict()` after every call that changes the run.
##
## States (contract): start, calibration, year_intro, events, card, consequence, learning,
## impeachment, final. gdd 10's OBRIGATORIAS and FECHAMENTO are instant steps inside the
## transitions (no screen of their own).

const STATES: Array[StringName] = [&"start", &"calibration", &"year_intro", &"events", &"card",
	&"consequence", &"learning", &"impeachment", &"final"]
const RESUMABLE: Array[StringName] = [&"calibration", &"year_intro", &"events", &"card",
	&"consequence", &"learning", &"impeachment"]
const LAST_YEAR := 4
const PHASE_NAMES: Array[String] = ["Lua de Mel", "Realidade Bate", "Crise", "Desfecho"]  # docs/15 §15.05.1
const CAPITAL := "political_capital"
const EXIT_ENDING := "END-028"          # Renúncia (gdd 02 §3.1, gdd 10 §3.3)
const IMPEACHMENT_ENDING := "END-007"   # gdd 02 §3.1
const TBD := ""
# Texts the repo leaves open (contract: visible "[a definir]" + named constant) — a validar.
const CAPTURE_WARNING_TEXT := "Cuidado: poder demais num só medidor também derruba um governo no fim do mandato."   # gdd 02 §3.4, T-04.5
const SCENE_INTRO_TEXT := "A oposição abriu um processo de impeachment. São 5 fases: em cada uma, sua escolha pode salvar ou afundar o mandato."           # T-09.1
const SCENE_FOOTER := "Processo de Impeachment · Fase %d/%d"
const SCENE_RESULT_FOOTER := "Processo de Impeachment · Resultado"                  # T-09 (D2)
const ACQUITTAL_TITLE := "Absolvido"         # T-09.7
const CONVICTION_TITLE := "Afastado"        # T-09.8
const RESULT_TEXT := "O processo foi arquivado. Seu governo continua, mas a crise deixou marcas."
const CONVICTION_TEXT := "O Senado aprovou seu afastamento. O mandato termina aqui."
const ENDING_DESCRIPTION := ""   # fallback; each ending has its own "description" (P-017)  # docs/14 §14.09

var data: GameDatabase
var run: RunState = null
var rng := RandomNumberGenerator.new()
var order: Array = []        # meter ids, table order (gdd/GDD.md §6.1.1)
var balance: Dictionary = {}


func _init(game_data: GameDatabase) -> void:
	data = game_data
	order = Array(data.meter_ids)
	balance = data.balance


# --- Run life cycle ---------------------------------------------------------------------

## New run in CALIBRACAO (gdd 10 §3.2.1): initial meters (gdd 01 §3.2), actors at 50 (gdd 07).
func start(seed_value: int) -> void:
	run = RunState.new()
	run.seed = seed_value
	rng.seed = seed_value
	run.year = 1
	for m in data.meters:
		run.meters[String(m["id"])] = int(m["initial"])
	for a in data.actors:
		run.actors[String(a)] = int(balance.get("actor_initial", 50))
	run.calibration_index = 0
	if data.calibration.is_empty():
		_begin_year(1)
		return
	run.state = &"calibration"
	run.calibration_side_a = CardRules.draw_side(rng)


## Saved form of the run (gdd 10 §3.4), RNG state included so a resumed run continues the
## same random sequence.
func to_dict() -> Dictionary:
	run.rng_state = rng.state
	return run.to_dict()


## Rebuilds a flow from a save; null when the save does not fit this format or this data
## (gdd 10 §5: treated as corrupted). Consequence, learning and event screens come back
## read-only (gdd 10 §5, CA-07).
static func restore(game_data: GameDatabase, d: Dictionary) -> GameFlow:
	var r := RunState.from_dict(d)
	if r == null:
		return null
	var f := GameFlow.new(game_data)
	if not f._fits(r):
		return null
	f.run = r
	f.rng.seed = r.seed
	f.rng.state = r.rng_state
	var stage := String(r.impeachment.get("stage", ""))
	if r.state in [&"consequence", &"learning", &"events"] or (r.state == &"impeachment" and stage in ["consequence", "learning", "result"]):
		r.readonly = true
	return f


func state() -> StringName:
	return &"start" if run == null else run.state


## "Abandonar mandato" (gdd 10 §3.3): calibration → back to the start screen, no ending;
## any other state but start/final → Renúncia, complete final screen.
func abandon() -> void:
	if run == null or run.state == &"start" or run.state == &"final":
		return
	if run.state == &"calibration":
		run.state = &"start"
		return
	_finish(EXIT_ENDING, "exit", "")


# --- Calibration (docs/15 §15.04) ---------------------------------------------------------

func calibration_view() -> Dictionary:
	if state() != &"calibration":
		return {}
	var q: Dictionary = data.calibration[run.calibration_index]
	return {
		"id": String(q.get("id", "")),
		"index": run.calibration_index + 1,
		"total": data.calibration.size(),
		"question": String(q.get("question", TBD)),
		"sides": CardRules.sides(q, run.calibration_side_a, false),
	}


## ±5 flat on the meters (gdd 01 §3.2) and the "o que você disse" track (gdd 04 §3.2).
func answer_calibration(side: int) -> Dictionary:
	if not _expect(&"calibration") or not _side_ok(side):
		return {}
	var q: Dictionary = data.calibration[run.calibration_index]
	var opt: Dictionary = q[CardRules.option_key(side, run.calibration_side_a)]
	var changes := _named(MeterRules.apply_flat(run.meters, _ints(opt.get("effects", {})), order))
	AxisRules.add(run.said_sum, run.said_count, opt.get("axis", []))
	run.calibration_index += 1
	if run.calibration_index >= data.calibration.size():
		_begin_year(1)    # gdd 10 §3.2.2 (no events in Year 1)
	else:
		run.calibration_side_a = CardRules.draw_side(rng)
	return {"changes": changes, "next": run.state}


# --- Year card (T-04) and events (gdd 08) --------------------------------------------------

func year_view() -> Dictionary:
	if state() != &"year_intro":
		return {}
	var warning: Array = []
	if run.year == LAST_YEAR:
		for id in EndingRules.capture_warning(data.meters, run.meters, int(balance.get("capture_warning_at_or_above", 81))):
			warning.append({"id": id, "name": _meter_name(id)})
	return {
		"year": run.year,
		"phase": PHASE_NAMES[run.year - 1],
		"title": "Ano %d" % run.year,
		"capture_warning": warning,
		"capture_warning_text": CAPTURE_WARNING_TEXT if not warning.is_empty() else "",
		"closing_changes": run.closing_changes.duplicate(true),
	}


## Leaves the year card: events due this turn fire first (gdd 08 §3.3), then the cards.
func continue_from_year() -> bool:
	if not _expect(&"year_intro"):
		return false
	run.closing_changes = []
	run.turn_events = EventRules.take_due(run, run.year)
	run.event_cursor = 0
	if run.turn_events.is_empty():
		_start_cards()
	else:
		_fire_event()
	return true


## The event on screen. Its effects are already applied; `outcome` says what follows:
## "" (next event or the cards), "final" (catastrophe or Impeachment) or "impeachment".
func event_view() -> Dictionary:
	if state() != &"events":
		return {}
	var v := run.current_event.duplicate(true)
	v["readonly"] = run.readonly
	v["footer"] = _turn_footer()
	return v


func continue_from_event() -> bool:
	if not _expect(&"events"):
		return false
	run.readonly = false
	var ev := run.current_event
	match String(ev.get("outcome", "")):
		"final":
			_finish(String(ev["ending_id"]), String(ev["reason"]), String(ev["meter"]))
		"impeachment":
			_start_impeachment(["capital_zero"], "events")
		_:
			_next_event()
	return true


# --- Cards (gdd 05, gdd 06) ----------------------------------------------------------------

func card_view() -> Dictionary:
	if state() != &"card":
		return {}
	var card: Dictionary = data.cards[run.current_card["id"]]
	var footer := _turn_footer(run.turn_cards.size() + 1)
	return _card_dict(card, int(run.current_card["side_a"]), footer, String(run.current_card["kind"]))


## Footer of the turn (C-07): "Ano N · Fase", or "Ano N · Fase · n/7" with a card number.
## Views that follow a card (consequence, learning) and the events carry it too, so a
## resumed run shows the same footer (lote D).
func _turn_footer(card_number: int = 0) -> String:
	var base := "Ano %d · %s" % [run.year, PHASE_NAMES[run.year - 1]]
	if card_number <= 0:
		return base
	return "%s · %d/%d" % [base, card_number, int(balance.get("cards_per_turn", 7))]


## Resolves the shown card on `side` (-1/+1), in the order of gdd 05 §3.5: effects → governed
## axis → actors (2b) → event → consequence → learning. Returns {changes, consequence, next,
## ending_id}; `next` is the state after the choice (consequence, impeachment or final).
func choose(side: int) -> Dictionary:
	if not _expect(&"card") or not _side_ok(side):
		return {}
	var id := String(run.current_card["id"])
	var card: Dictionary = data.cards[id]
	var key := CardRules.option_key(side, int(run.current_card["side_a"]))
	var opt: Dictionary = card[key]
	var effects := _ints(opt.get("effects", {}))
	var raw := MeterRules.apply_effects(run.meters, effects, _multiplier(), balance, order)
	AxisRules.add(run.governed_sum, run.governed_count, opt.get("axis", []))
	ActorRules.apply(run.actors, opt.get("actors", {}), int(balance.get("actor_step", 10)))
	run.played.append(id)
	run.turn_cards.append(id)
	run.current_card = {}
	# gdd 03 §3.1 alternative trigger: consecutive chosen options that lower capital.
	run.capital_streak = run.capital_streak + 1 if int(effects.get(CAPITAL, 0)) < 0 else 0
	var changes := _named(raw)
	run.last_result = {
		"card_id": id,
		"title": String(card.get("title", "")),
		"option": key,
		"consequence": String(opt.get("consequence", TBD)),
		"changes": changes,
		"learning_id": String(card.get("learning_id", "")),
		"technique": String(card.get("technique", "")),
		"year": run.year,
		"pending_events": RunState.normalize(opt.get("events", [])),
	}
	var zero := MeterRules.zeroed(run.meters, order)
	if not zero.is_empty():
		# gdd 05 §5: catastrophe after step 2b; no event, consequence nor learning.
		var m := MeterRules.catastrophe_meter(zero, raw, order)
		run.last_result = {}
		_finish(_zero_ending(m), "catastrophe", m)
	elif int(run.meters[CAPITAL]) == 0:
		if _impeachment_used():
			run.last_result = {}
			_finish(IMPEACHMENT_ENDING, "impeachment", CAPITAL)   # gdd 03 §3.2.6
		else:
			var triggers: Array = ["capital_zero"]
			if ImpeachmentRules.alternative_fires(run.capital_streak, run.year):
				triggers.append("alternative")
			# gdd 05 §5: the scene opens after step 2; steps 3-4 resume on acquittal.
			_start_impeachment(triggers, "consequence")
	else:
		_schedule_pending()
		run.state = &"consequence"
	return {
		"changes": changes,
		# Shown only when the consequence screen follows (gdd 05 §5: none on a catastrophe;
		# after the scene on capital 0).
		"consequence": String(opt.get("consequence", TBD)) if run.state == &"consequence" else "",
		"next": run.state,
		"ending_id": String(run.ending.get("id", "")),
	}


func consequence_view() -> Dictionary:
	if state() != &"consequence":
		return {}
	var r := run.last_result
	return {
		"card_id": r["card_id"],
		"title": r["title"],
		"text": r["consequence"],
		"changes": r["changes"].duplicate(true),
		"readonly": run.readonly,
		"footer": _turn_footer(run.turn_cards.size()),
	}


func continue_from_consequence() -> bool:
	if not _expect(&"consequence"):
		return false
	run.state = &"learning"
	return true


func learning_view() -> Dictionary:
	if state() != &"learning":
		return {}
	var r := run.last_result
	var v := _learning_dict(String(r["learning_id"]), String(r["title"]), String(r["technique"]))
	v["footer"] = _turn_footer(run.turn_cards.size())
	return v


## After the learning card: the alternative trigger (checked right after the card, gdd 03
## §3.1 — a validar: after its learning card), else the next card or the turn closing.
func continue_from_learning() -> bool:
	if not _expect(&"learning"):
		return false
	run.readonly = false
	run.last_result = {}
	if not _impeachment_used() and ImpeachmentRules.alternative_fires(run.capital_streak, run.year):
		_start_impeachment(["alternative"], "next_card")
	else:
		_next_card()
	return true


# --- Impeachment scene (gdd 03) ------------------------------------------------------------

## Scene stages: intro → phase → consequence → learning → (next phase…) → result.
func impeachment_view() -> Dictionary:
	if state() != &"impeachment":
		return {}
	var imp := run.impeachment
	var stage := String(imp["stage"])
	var phase := int(imp["phase"])
	var v := {
		"stage": stage,
		"phase": phase,
		"total": ImpeachmentRules.PHASES,
		"support": int(imp["support"]),
		"min_support": int(imp["min_support"]),
		"triggers": imp["triggers"].duplicate(),
		"readonly": run.readonly,
	}
	match stage:
		"intro":
			v["intro_text"] = SCENE_INTRO_TEXT
		"phase":
			v["card"] = _card_dict(_scene_card(phase), int(imp["side_a"]), scene_footer(phase), "impeachment")
			v["scoreboard"] = ImpeachmentRules.scoreboard(phase, null)
		"consequence":
			var last: Dictionary = imp["last"]
			v["consequence"] = {"title": last["title"], "text": last["consequence"],
				"changes": last["changes"].duplicate(true), "test_passed": last["test_passed"]}
			v["scoreboard"] = last["scoreboard"].duplicate()
		"learning":
			var last: Dictionary = imp["last"]
			v["learning"] = _learning_dict(String(last["learning_id"]), String(last["title"]), "")
		"result":
			var convicted: bool = imp["outcome"] == "convicted"
			v["result"] = {
				"outcome": imp["outcome"],
				"automatic": imp["automatic"],
				"title": CONVICTION_TITLE if convicted else ACQUITTAL_TITLE,
				"text": CONVICTION_TEXT if convicted else RESULT_TEXT,
				"changes": imp["result_changes"].duplicate(true),
			}
			v["scoreboard"] = ImpeachmentRules.result_scoreboard(convicted)
	return v


## Chooses a side on the phase card. The test uses the value before the effect; effects ×1
## (gdd 03 §3.2.3); the options score the governed axis (gdd 04 §3.2). Capital at 0 does
## nothing during the scene; another meter at 0 is a catastrophe (§3.2.7).
func choose_impeachment(side: int) -> Dictionary:
	if not _expect(&"impeachment") or not _side_ok(side) or run.impeachment["stage"] != "phase":
		return {}
	var imp := run.impeachment
	var phase := int(imp["phase"])
	var card := _scene_card(phase)
	var key := CardRules.option_key(side, int(imp["side_a"]))
	var opt: Dictionary = card[key]
	var passed := ImpeachmentRules.test_passes(opt["test"], run.meters)
	var raw := MeterRules.apply_effects(run.meters, _ints(opt.get("effects", {})), 1.0, balance, order)
	AxisRules.add(run.governed_sum, run.governed_count, opt.get("axis", []))
	if passed and phase < ImpeachmentRules.PHASES:
		imp["support"] = int(imp["support"]) + 1
	imp["last"] = {
		"phase": phase,
		"title": String(card.get("title", "")),
		"option": key,
		"test_passed": passed,
		"consequence": String(opt.get("consequence", TBD)),
		"changes": _named(raw),
		"scoreboard": ImpeachmentRules.scoreboard(phase, not passed),
		"learning_id": String(card.get("learning_id", "")),
	}
	imp["stage"] = "consequence"
	var zero := MeterRules.zeroed(run.meters, order)
	if not zero.is_empty():
		var m := MeterRules.catastrophe_meter(zero, raw, order)
		_finish(_zero_ending(m), "catastrophe", m)
	return {
		"changes": imp["last"]["changes"].duplicate(true),
		"test_passed": passed,
		"support": int(imp["support"]),
		"consequence": imp["last"]["consequence"],
		"next": run.state,
		"stage": String(imp["stage"]),
		"ending_id": String(run.ending.get("id", "")),
	}


## Advances the scene outside the phase card: intro → phase 1 (or the result, on automatic
## conviction), consequence → learning → next phase or result, result → back to the point
## where the run stopped (acquittal) or the Impeachment ending (conviction).
func continue_impeachment() -> bool:
	if not _expect(&"impeachment"):
		return false
	var imp := run.impeachment
	match String(imp["stage"]):
		"intro":
			if imp["automatic"]:
				_impeachment_outcome()   # straight to the result (a validar, T-09.9)
			else:
				_enter_phase(1)
		"consequence":
			if data.learning.has(String(imp["last"].get("learning_id", ""))):
				imp["stage"] = "learning"
			else:
				_after_phase()
		"learning":
			run.readonly = false
			_after_phase()
		"result":
			run.readonly = false
			if imp["outcome"] == "convicted":
				_finish(IMPEACHMENT_ENDING, "impeachment", "")
			else:
				imp["stage"] = "done"
				_return_from_impeachment()
		_:
			return false
	return true


# --- Final screen (gdd 02, gdd 04, docs/14 §14.09) -----------------------------------------

## Footer of the impeachment scene (P-017): "Fase n/5" on every stage, "Resultado" at the end.
static func scene_footer(phase: int, result: bool = false) -> String:
	return SCENE_RESULT_FOOTER if result else SCENE_FOOTER % [phase, ImpeachmentRules.PHASES]


func final_view() -> Dictionary:
	if state() != &"final":
		return {}
	var id := String(run.ending.get("id", ""))
	var e: Dictionary = data.endings.get(id, {})
	var said := AxisRules.positions(run.said_sum, run.said_count)
	var governed := AxisRules.positions(run.governed_sum, run.governed_count)
	var dom := AxisRules.dominant(governed)
	var meter := String(run.ending.get("meter", ""))
	return {
		"ending": {
			"id": id,
			"name": String(e.get("name", TBD)),
			"category": String(e.get("category", "")),
			"category_label": EndingRules.category_label(String(e.get("category", ""))),
			"quote": _text_or_empty(e.get("quote")),
			"author": _text_or_empty(e.get("author")),
			"source": _text_or_empty(e.get("source")),
		},
		"description": String(e.get("description", ENDING_DESCRIPTION)),
		"reason": String(run.ending.get("reason", "")),
		"meter": meter,
		"meter_name": _meter_name(meter) if meter != "" else "",
		"year": run.year,
		"epilogue": run.epilogue.duplicate(),
		"axis": {
			"said": said,
			"governed": governed,
			"names": AxisRules.NAMES.duplicate(),
			"poles": AxisRules.POLES.duplicate(true),
			"dominant": dom,
			"dominant_name": AxisRules.NAMES[dom],
			"dominant_pole": AxisRules.pole_for(dom, float(governed[dom])),
			"text": AxisRules.text_for(dom, float(governed[dom])),
		},
		"meters": hud(),
		"reveal_text": AxisRules.meter_reveal(run.meters, balance),
		"closing_phrase": AxisRules.CLOSING_PHRASE,
	}


## Meters for the HUD: no number is shown before the final screen; the UI uses value/band
## only for the icon fill (docs/14 §14.03, §14.11.3).
func hud() -> Array:
	var out: Array = []
	if run == null:
		return out
	for m in order:
		var v := int(run.meters[m])
		out.append({"id": m, "name": _meter_name(m), "value": v, "band": MeterRules.band_of(v)})
	return out


# --- Internal transitions ------------------------------------------------------------------

func _begin_year(y: int) -> void:
	run.year = y
	run.state = &"year_intro"
	if y == 2:
		run.capital_streak = 0   # D-179: options of Year 1 do not count for the alternative trigger
	run.turn_cards = []
	run.turn_mandatory = []
	run.turn_events = []
	run.event_cursor = 0
	run.current_event = {}
	run.current_card = {}


func _fire_event() -> void:
	var ev: Dictionary = run.turn_events[run.event_cursor]
	var raw := MeterRules.apply_effects(run.meters, _ints(ev.get("effects", {})), _multiplier(), balance, order)
	var view := {
		"index": run.event_cursor + 1,
		"total": run.turn_events.size(),
		"text": String(ev.get("text", TBD)),
		"origin_id": String(ev.get("origin_id", "")),
		"origin_title": String(ev.get("origin_title", "")),
		"changes": _named(raw),
		"outcome": "",
		"ending_id": "",
		"reason": "",
		"meter": "",
	}
	var zero := MeterRules.zeroed(run.meters, order)
	if not zero.is_empty():
		var m := MeterRules.catastrophe_meter(zero, raw, order)
		view.merge({"outcome": "final", "ending_id": _zero_ending(m), "reason": "catastrophe", "meter": m}, true)
	elif int(run.meters[CAPITAL]) == 0:
		if _impeachment_used():
			view.merge({"outcome": "final", "ending_id": IMPEACHMENT_ENDING, "reason": "impeachment", "meter": CAPITAL}, true)
		else:
			view["outcome"] = "impeachment"   # gdd 08 §5: the remaining events fire after the scene
	run.current_event = view
	run.state = &"events"


func _next_event() -> void:
	run.event_cursor += 1
	if run.event_cursor < run.turn_events.size():
		_fire_event()
		return
	run.turn_events = []
	run.event_cursor = 0
	run.current_event = {}
	_start_cards()


func _start_cards() -> void:
	run.turn_mandatory = DrawRules.build_mandatory(data, run, rng)
	_next_card()


## Next card of the turn, or the turn closing after 7 cards or when nothing is eligible
## (gdd 06 §5). An emergency is spent when its card is shown.
func _next_card() -> void:
	if run.turn_cards.size() >= int(balance.get("cards_per_turn", 7)):
		_close_turn()
		return
	var entry := DrawRules.next_entry(data, run, rng)
	if entry.is_empty():
		_close_turn()
		return
	run.current_card = {
		"id": String(entry["card"]),
		"kind": String(entry["kind"]),
		"target": String(entry["target"]),
		"side_a": CardRules.draw_side(rng),
	}
	if entry["kind"] == "emergency" and not run.emergency_used.has(entry["target"]):
		run.emergency_used.append(String(entry["target"]))
	run.state = &"card"


## gdd 01 §3.4. Years 1-3: steps 1-6; Year 4: only step 6, then the finals (gdd 02 §3.3).
func _close_turn() -> void:
	# Emergencies left over by a full turn come first next turn (gdd 06 §5).
	var carry: Array = []
	for e in run.turn_mandatory:
		if e["kind"] == "emergency" and not run.emergency_used.has(e["target"]):
			carry.append(String(e["target"]))
	run.turn_mandatory = []
	run.current_card = {}
	if run.year < LAST_YEAR:
		var raw := MeterRules.close_turn(run.meters, balance, order)
		run.closing_changes = _named(raw)
		var zero := MeterRules.zeroed(run.meters, order)
		if not zero.is_empty():
			var m := MeterRules.catastrophe_meter(zero, raw, order)
			_finish(_zero_ending(m), "catastrophe", m)
			return
		var limit := int(balance.get("emergency_at_or_below", 10))
		run.emergency_pending = carry + MeterRules.emergency_order(run.meters, run.emergency_used + carry, limit, order)
	var triggers := ImpeachmentRules.closing_triggers(run.meters, run.year)
	var next := "next_year" if run.year < LAST_YEAR else "finals"
	if not triggers.is_empty():
		if not _impeachment_used():
			_start_impeachment(triggers, next)
			return
		if triggers.has("capital_zero"):
			_finish(IMPEACHMENT_ENDING, "impeachment", CAPITAL)
			return
	if next == "finals":
		_finals()
	else:
		_begin_year(run.year + 1)


func _finals() -> void:
	_finish(EndingRules.end_of_term(data.endings, run.meters), "end_of_term", "")


func _start_impeachment(triggers: Array, return_to: String) -> void:
	run.impeachment = {
		"triggers": triggers.duplicate(),
		"min_support": ImpeachmentRules.min_support(triggers),
		"automatic": ImpeachmentRules.automatic_conviction(run.meters),
		"return_to": return_to,
		"stage": "intro",
		"phase": 0,
		"side_a": 1,
		"support": 0,
		"last": {},
		"outcome": "",
		"result_changes": [],
	}
	run.state = &"impeachment"


func _enter_phase(n: int) -> void:
	var imp := run.impeachment
	imp["phase"] = n
	imp["stage"] = "phase"
	imp["side_a"] = CardRules.draw_side(rng)
	imp["last"] = {}


func _after_phase() -> void:
	if int(run.impeachment["phase"]) < ImpeachmentRules.PHASES:
		_enter_phase(int(run.impeachment["phase"]) + 1)
	else:
		_impeachment_outcome()


## gdd 03 §3.2.2, §3.2.4-5.
func _impeachment_outcome() -> void:
	var imp := run.impeachment
	var acquitted := false
	if not imp["automatic"]:
		acquitted = ImpeachmentRules.acquitted(int(imp["support"]), int(imp["min_support"]), bool(imp["last"].get("test_passed", false)))
	imp["outcome"] = "acquitted" if acquitted else "convicted"
	if acquitted:
		imp["result_changes"] = _named(MeterRules.apply_flat(run.meters, ImpeachmentRules.acquittal_effects(run.meters), order))
	imp["stage"] = "result"


## Acquittal: back to the point where the run stopped (gdd 10 §3.2.6).
func _return_from_impeachment() -> void:
	match String(run.impeachment["return_to"]):
		"consequence":
			_schedule_pending()
			run.state = &"consequence"
		"next_card":
			_next_card()
		"events":
			_next_event()
		"next_year":
			_begin_year(run.year + 1)
		"finals":
			_finals()


## gdd 05 §3.5 step 3 / gdd 08 §3.2.
func _schedule_pending() -> void:
	var r := run.last_result
	EventRules.schedule(run, r.get("pending_events", []), int(r.get("year", run.year)), String(r.get("card_id", "")), String(r.get("title", "")))
	r["pending_events"] = []


## Any ending: events still queued go to the epilogue (gdd 08 §3.4); the save is deleted by
## Game when it sees FINAL (gdd 10 §3.5).
func _finish(ending_id: String, reason: String, meter: String) -> void:
	EventRules.flush_to_epilogue(run)
	if reason == "impeachment":
		# D-182: a conviction opened by Capital at 0 on a card — that option's events were held
		# for the acquittal (gdd 05 §5); they go to the epilogue, without effect.
		for ev in run.last_result.get("pending_events", []):
			run.epilogue.append(String(ev.get("text", "")))
		if run.last_result.has("pending_events"):
			run.last_result["pending_events"] = []
	run.ending = {"id": ending_id, "reason": reason, "meter": meter}
	run.state = &"final"
	run.readonly = false
	run.turn_mandatory = []
	run.current_card = {}


# --- Helpers ---------------------------------------------------------------------------------

func _impeachment_used() -> bool:
	return not run.impeachment.is_empty()   # once per run (gdd 03 §1, §3.2.6)


func _scene_card(phase: int) -> Dictionary:
	return data.impeachment_cards[phase - 1]


func _card_dict(card: Dictionary, side_a: int, footer: String, kind: String) -> Dictionary:
	var speaker := data.speaker_for(card)
	var mode: Dictionary = data.modes.get(card.get("mode", ""), {})
	return {
		"id": String(card.get("id", "")),
		"title": String(card.get("title", TBD)),
		"type": String(card.get("type", "")),
		"mode": String(card.get("mode", "")),
		"mode_name": String(mode.get("name", "")),
		"speaker": speaker["name"],
		"speaker_actor": speaker["actor"],
		"problem": String(card.get("problem", TBD)),
		"footer": footer,
		"kind": kind,
		"crisis": card.get("type") == "impeachment",
		"sides": CardRules.sides(card, side_a, true),
	}


func _learning_dict(learning_id: String, title: String, technique: String) -> Dictionary:
	var l: Dictionary = data.learning.get(learning_id, {})
	var source: Dictionary = l.get("source", {})
	return {
		"id": learning_id,
		"title": title,
		"lived": String(l.get("lived", TBD)),
		"concept": String(l.get("concept", TBD)),
		"data": String(l.get("data", TBD)),
		"source": {"label": String(source.get("label", TBD)), "url": String(source.get("url", ""))},
		"impact": String(l.get("impact", TBD)),
		"technique": DisinfoRules.technique_name(technique),
		"readonly": run.readonly,
	}


func _multiplier() -> float:
	return float(balance.get("year_multipliers", [0.25, 0.75, 1.0, 1.5])[run.year - 1])


func _zero_ending(meter: String) -> String:
	return String(data.meter_info.get(meter, {}).get("zero_ending", ""))


func _meter_name(id: String) -> String:
	return String(data.meter_info.get(id, {}).get("name", id))


## Adds the meter name to each change (UI labels; numbers stay hidden until the final).
func _named(changes: Array) -> Array:
	for c in changes:
		c["name"] = _meter_name(String(c["id"]))
	return changes


func _ints(effects: Variant) -> Dictionary:
	var out := {}
	if effects is Dictionary:
		for m in effects:
			out[String(m)] = int(effects[m])
	return out


func _text_or_empty(v: Variant) -> String:
	return "" if v == null else String(v)


func _expect(s: StringName) -> bool:
	if state() != s:
		push_warning("GameFlow: call needs state %s, current is %s" % [s, state()])
		return false
	return true


func _side_ok(side: int) -> bool:
	if not CardRules.is_valid_side(side):
		push_warning("GameFlow: side must be -1 or 1, got %d" % side)
		return false
	return true


## Save sanity against this data (gdd 10 §5: a save that does not fit is corrupted).
func _fits(r: RunState) -> bool:
	if not RESUMABLE.has(r.state):
		return false
	for m in order:
		if not r.meters.has(m):
			return false
	var ids: Array = r.played + r.turn_cards
	for e in r.turn_mandatory:
		ids.append(e.get("card", ""))
	if r.state == &"card":
		ids.append(r.current_card.get("id", ""))
	if r.state in [&"consequence", &"learning"]:
		ids.append(r.last_result.get("card_id", ""))
	for id in ids:
		if not data.cards.has(id):
			return false
	if r.state == &"calibration" and r.calibration_index >= data.calibration.size():
		return false
	if r.state == &"events" and r.current_event.is_empty():
		return false
	if r.state == &"impeachment":
		var phase := int(r.impeachment.get("phase", -1))
		if phase < 0 or phase > ImpeachmentRules.PHASES or data.impeachment_cards.size() < ImpeachmentRules.PHASES:
			return false
	return true
