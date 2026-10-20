extends Node
## Placeholder with the minimal Game API from the P-005 contract.
## The core-logic work replaces this file keeping these signatures.

signal state_changed(state: StringName)
signal toast_requested(kind: StringName)

var _state: StringName = &"start"


func has_save() -> bool:
	return false


func new_run(_seed: int = -1) -> void:
	_state = &"calibration"
	state_changed.emit(_state)


func resume() -> bool:
	return false


func abandon() -> void:
	_state = &"start"
	state_changed.emit(_state)


func current_state() -> StringName:
	return _state
