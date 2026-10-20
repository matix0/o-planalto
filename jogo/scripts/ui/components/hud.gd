class_name Hud
extends HBoxContainer
## C-02 — HUD with the 8 meters (docs/14 §14.03; gdd/GDD.md §6.1.1):
## Sociais (Dignidade, Consciência, Soberania, Segurança, Integridade) |
## Poder (Caixa, Capital Político, Legitimidade). 336×52, no numbers.
## apply_changes() plays the Animações timeline (A-07 fill, A-08 trail,
## A-09 band change, A-10 dots) and emits changes_finished.

signal changes_finished

const ORDER: Array[String] = [
	"dignity", "awareness", "sovereignty", "security", "integrity",
	"treasury", "political_capital", "legitimacy",
]
## Divergence D16: docs/14 §14.10.1 starts the dots 100 ms after release
## (repo timing, used); the prompt starts them at the end of the card exit
## and keeps them until the fill ends. Flip to test the prompt's version.
const DOTS_FOLLOW_PROMPT := false
const DOT_DELAY_REPO := 0.1          # A-10: 100 ms after release
const DOT_LIFETIME_REPO := 0.5       # A-10: 400-600 ms
const CARD_EXIT_TIME := 0.3          # A-06: 250-350 ms
const SMALL_DOT_MAX := 10            # docs/14 §14.05: up to 10 = small

var high_contrast: bool = false:
	set(v):
		high_contrast = v
		if is_node_ready():
			for m in meters():
				m.high_contrast = v
			_divider_line.color = Tokens.TEXT if v else Tokens.INACTIVE

var _pending := 0

@onready var _divider_line: ColorRect = $MeterDivider/Line


func _ready() -> void:
	_divider_line.color = Tokens.INACTIVE
	for m in meters():
		m.animation_finished.connect(_on_meter_done)


func meters() -> Array[MeterIcon]:
	var out: Array[MeterIcon] = []
	for child in get_children():
		if child is MeterIcon:
			out.append(child)
	return out


func meter(id: String) -> MeterIcon:
	for m in meters():
		if m.meter_id == id:
			return m
	return null


## values: {meter_id: int}. No animation.
func set_values(values: Dictionary) -> void:
	for id in values:
		var m := meter(String(id))
		if m:
			m.set_value(int(values[id]))


## Frozen frame: previous levels (trail), dots and one pulsing meter.
func show_state(values: Dictionary, previous: Dictionary = {}, dots: Dictionary = {}, pulse_id: String = "") -> void:
	for m in meters():
		var v := int(values.get(m.meter_id, m.value))
		m.show_state(v, int(previous.get(m.meter_id, -1)), StringName(dots.get(m.meter_id, "")), m.meter_id == pulse_id)


## changes: [{id, old, new, (delta), (dot: &"small"|&"big")}] for the meters
## that changed. Starts right after the card is released.
func apply_changes(changes: Array, reduce_motion: bool = false) -> void:
	var dot_delay := CARD_EXIT_TIME if DOTS_FOLLOW_PROMPT else DOT_DELAY_REPO
	var lifetime := MeterIcon.FILL_TIME if DOTS_FOLLOW_PROMPT else DOT_LIFETIME_REPO
	var fill_delay := dot_delay
	_pending = 0
	for c: Dictionary in changes:
		var m := meter(String(c.get("id", "")))
		if m == null:
			continue
		var old_v := int(c.get("old", m.value))
		var new_v := int(c.get("new", old_v + int(c.get("delta", 0))))
		var dot := StringName(c.get("dot", ""))
		if dot == &"" and new_v != old_v:
			dot = &"small" if absi(new_v - old_v) <= SMALL_DOT_MAX else &"big"
		_pending += 1
		m.animate_change(old_v, new_v, dot, reduce_motion, dot_delay, lifetime, fill_delay)
	if _pending == 0:
		changes_finished.emit.call_deferred()


func values() -> Dictionary:
	var out := {}
	for m in meters():
		out[m.meter_id] = m.value
	return out


func _on_meter_done(_id: String) -> void:
	_pending -= 1
	if _pending == 0:
		changes_finished.emit()
