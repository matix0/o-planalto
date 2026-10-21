extends Node
## The only game API the screens use (P-005 contract; the public methods below are the
## reference). Wraps GameFlow (pure rules) and saves the run after every
## transition and every resolved card (gdd/sistemas/10_estado_partida.md §3.5).
##
## Sides are -1 / +1 (never "esquerda/direita", D-084). Views are plain dictionaries;
## no meter number is meant for display before the final screen.

signal state_changed(state: StringName)
signal toast_requested(kind: StringName)   # &"save_failed" (C-21), once per run

const SAVE_FAILED := &"save_failed"
const RESUME_FAILED_TEXT := "Não foi possível continuar o mandato"   # gdd 10 §5

var flow: GameFlow = null
## Why the last resume() failed ("" when it did not), for logs and tests.
var last_resume_error: String = ""


# --- Contract API ----------------------------------------------------------------------------

func has_save() -> bool:
	return SaveManager.has_save()


## "Novo mandato": deletes any saved run without a Renúncia (gdd 10 §5) and starts the
## calibration. `run_seed` < 0 → random seed.
func new_run(run_seed: int = -1) -> void:
	SaveManager.delete()
	flow = GameFlow.new(GameData)
	flow.start(run_seed if run_seed >= 0 else _random_seed())
	_after_action()


## "Continuar": false when there is no save or it is unreadable / of another format — then it
## is deleted and the UI shows RESUME_FAILED_TEXT (gdd 10 §5, CA-12).
func resume() -> bool:
	last_resume_error = ""
	if not SaveManager.has_save():
		last_resume_error = "no save"
		return false
	var d := SaveManager.load_run()
	var restored: GameFlow = null
	if not d.is_empty():
		restored = GameFlow.restore(GameData, d)
	if restored == null:
		last_resume_error = SaveManager.last_error if SaveManager.last_error != "" else "save does not fit this game version"
		push_warning("Game: saved run discarded — " + last_resume_error)
		SaveManager.delete()
		flow = null
		return false
	flow = restored
	state_changed.emit(flow.state())
	return true


## "Abandonar mandato" (gdd 10 §3.3): calibration → &"start" with no ending; elsewhere →
## final "Renúncia" (END-028). No effect on the start or final screens.
func abandon() -> void:
	if flow == null or flow.state() == &"start" or flow.state() == &"final":
		return
	flow.abandon()
	_after_action()


func current_state() -> StringName:
	return &"start" if flow == null else flow.state()


# --- Views and actions (see api.md) -----------------------------------------------------------

func hud() -> Array:
	return [] if flow == null else flow.hud()


func calibration_view() -> Dictionary:
	return {} if flow == null else flow.calibration_view()


func answer_calibration(side: int) -> Dictionary:
	return _act(func() -> Variant: return flow.answer_calibration(side))


func year_view() -> Dictionary:
	return {} if flow == null else flow.year_view()


func continue_from_year() -> bool:
	return _act_bool(func() -> Variant: return flow.continue_from_year())


func event_view() -> Dictionary:
	return {} if flow == null else flow.event_view()


func continue_from_event() -> bool:
	return _act_bool(func() -> Variant: return flow.continue_from_event())


func card_view() -> Dictionary:
	return {} if flow == null else flow.card_view()


func choose(side: int) -> Dictionary:
	return _act(func() -> Variant: return flow.choose(side))


func consequence_view() -> Dictionary:
	return {} if flow == null else flow.consequence_view()


func continue_from_consequence() -> bool:
	return _act_bool(func() -> Variant: return flow.continue_from_consequence())


func learning_view() -> Dictionary:
	return {} if flow == null else flow.learning_view()


func continue_from_learning() -> bool:
	return _act_bool(func() -> Variant: return flow.continue_from_learning())


func impeachment_view() -> Dictionary:
	return {} if flow == null else flow.impeachment_view()


func choose_impeachment(side: int) -> Dictionary:
	return _act(func() -> Variant: return flow.choose_impeachment(side))


func continue_impeachment() -> bool:
	return _act_bool(func() -> Variant: return flow.continue_impeachment())


func final_view() -> Dictionary:
	return {} if flow == null else flow.final_view()


# --- Internals -------------------------------------------------------------------------------

func _act(call: Callable) -> Dictionary:
	if flow == null:
		return {}
	var result: Dictionary = call.call()
	if not result.is_empty():
		_after_action()
	return result


func _act_bool(call: Callable) -> bool:
	if flow == null:
		return false
	var ok: bool = call.call()
	if ok:
		_after_action()
	return ok


## Saves (or deletes, on start/final) and tells the screens.
func _after_action() -> void:
	_persist()
	var s := current_state()
	if s == &"start":
		flow = null
	state_changed.emit(s)


func _persist() -> void:
	if flow == null:
		return
	var s := flow.state()
	if s == &"start" or s == &"final":
		SaveManager.delete()   # gdd 10 §3.5: one saved run, deleted on FINAL or abandon
		return
	if not SaveManager.save_run(flow.to_dict()) and not flow.run.save_failed_notified:
		flow.run.save_failed_notified = true   # gdd 10 §5: discreet warning, once per run
		push_warning("Game: could not save the run — " + SaveManager.last_error)
		toast_requested.emit(SAVE_FAILED)


func _random_seed() -> int:
	var r := RandomNumberGenerator.new()
	r.randomize()
	return r.randi() & 0x7fffffff
