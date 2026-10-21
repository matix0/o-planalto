class_name YearCard
extends Control
## C-16 — year card, in the place of the decision card (T-04.1 to T-04.5; docs/14 §14.10.2;
## docs/15 §15.05, §15.05.1; gdd/sistemas/02_finais.md §3.4).
## "Ano N" (Display) + phase (Title-M). In Year 4, the Capture warning names each meter at
## 81 or more — glyph + name, never a number nor a band (gdd 02 §3.4). Neither the year
## multiplier nor the phase focus appear.
##
## Fills the card slot and fits a 5:6 card of at most 280×336 in its center, like SwipeCard.
## A-24: enters (fade + small rise), stays, leaves — YEAR_TIME in all (600-800 ms, a validar);
## "Reduzir movimento": fades only. show_year() → `held` when the time is up (P4: on a tap,
## when there is a warning) → the screen calls leave() → `left`.
## Several meters ≥ 81 at once: [a definir] — one glyph + name per meter, the warning once.

signal held
signal left

const YEAR_TIME := 0.7            # A-24: 600-800 ms in all (a validar)
const ENTER_TIME := 0.2
const EXIT_TIME := 0.2
const RISE := 8.0                 # A-24 offset_transform_position.y (a validar)
const RM_FADE := 0.15
const CAPTURE_WAITS_TAP := true   # D-184: the Capture warning waits for a tap (P4 adopted)
const TAP_HINT_TEXT := "[toque para continuar — a definir]"
const METER_SCENE := preload("res://scenes/components/meter_icon.tscn")

var _waiting_tap := false
var _pressed := false
var _tween: Tween

@onready var _fit: Control = %Fit
@onready var _card: PanelContainer = %Card
@onready var _year: Label = %Year
@onready var _phase: Label = %Phase
@onready var _capture: VBoxContainer = %Capture
@onready var _divider: ColorRect = %Divider
@onready var _rows: VBoxContainer = %Rows
@onready var _warning: Label = %Warning
@onready var _tap_hint: Label = %TapHint


func _ready() -> void:
	visible = false
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	_card.offset_transform_enabled = true
	_card.accessibility_live = AccessibilityServer.LIVE_POLITE
	_tap_hint.text = TAP_HINT_TEXT
	resized.connect(_layout_fit)
	_layout_fit()
	_restyle()


func _notification(what: int) -> void:
	if what == NOTIFICATION_THEME_CHANGED and is_node_ready():
		_restyle()


## Shows Game.year_view(): {year, phase, title, capture_warning: [{id, name}],
## capture_warning_text}. `values` = meter values {id: int} for the glyph fill.
func show_year(view: Dictionary, values: Dictionary = {}, reduce_motion: bool = false) -> void:
	_kill()
	_fill(view, values)
	visible = true
	_waiting_tap = false
	_pressed = false
	var waits := CAPTURE_WAITS_TAP and _capture.visible
	_tap_hint.visible = waits
	_card.modulate.a = 0.0
	_card.offset_transform_position = Vector2(0.0, 0.0 if reduce_motion else RISE)
	_tween = create_tween().set_parallel(true)
	var t_in := RM_FADE if reduce_motion else ENTER_TIME
	_tween.tween_property(_card, "modulate:a", 1.0, t_in) \
		.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	if not reduce_motion:
		_tween.tween_property(_card, "offset_transform_position", Vector2.ZERO, t_in) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	if waits:
		_tween.chain().tween_callback(func() -> void: _waiting_tap = true)
	else:
		var t_out := RM_FADE if reduce_motion else EXIT_TIME
		_tween.chain().tween_interval(maxf(0.0, YEAR_TIME - t_in - t_out))
		_tween.chain().tween_callback(held.emit)


## Exit part of A-24; emits `left` and hides.
func leave(reduce_motion: bool = false) -> void:
	_kill()
	_waiting_tap = false
	if not visible:
		left.emit.call_deferred()
		return
	var t := RM_FADE if reduce_motion else EXIT_TIME
	_tween = create_tween().set_parallel(true)
	_tween.tween_property(_card, "modulate:a", 0.0, t).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	if not reduce_motion:
		_tween.tween_property(_card, "offset_transform_position", Vector2(0.0, -RISE), t) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	_tween.chain().tween_callback(_after_leave)


func hide_now() -> void:
	_kill()
	_waiting_tap = false
	visible = false


func is_waiting_tap() -> bool:
	return _waiting_tap


## Text shown on the card (tests): year, phase, meter names and warning.
func display_texts() -> PackedStringArray:
	var out := PackedStringArray([_year.text, _phase.text])
	if _capture.visible:
		for row in _rows.get_children():
			for l in row.find_children("*", "Label", true, false):
				if (l as Label).visible:
					out.append((l as Label).text)
		if _warning.visible:
			out.append(_warning.text)
	return out


func card_rect() -> Rect2:
	return Rect2(_fit.position, _fit.size)


# --- Content ---------------------------------------------------------------------------------

func _fill(view: Dictionary, values: Dictionary) -> void:
	var title := String(view.get("title", ""))
	if title == "":
		title = "Ano %d" % int(view.get("year", 1))
	var phase := String(view.get("phase", ""))
	_year.text = title
	_phase.text = phase
	for c in _rows.get_children():
		_rows.remove_child(c)
		c.queue_free()
	var meters: Array = view.get("capture_warning", [])
	var text := String(view.get("capture_warning_text", ""))
	_capture.visible = not meters.is_empty()
	var names := PackedStringArray()
	for m in meters:
		var id := String((m as Dictionary).get("id", ""))
		var meter_name := String((m as Dictionary).get("name", id))
		names.append(meter_name)
		_add_meter_row(id, meter_name, int(values.get(id, 90)), text if meters.size() == 1 else "")
	_warning.text = text
	_warning.visible = meters.size() > 1 and text != ""
	var a11y := "%s, %s" % [title, phase]
	if not meters.is_empty():
		a11y += ". %s: %s" % [", ".join(names), text]
	_card.accessibility_name = a11y


## Glyph (C-01, no number, no dot) + Title-S name (+ Body warning when it is the only meter).
func _add_meter_row(id: String, meter_name: String, value: int, text: String) -> void:
	var row := HBoxContainer.new()
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_theme_constant_override(&"separation", Tokens.ESP_12)
	_rows.add_child(row)   # in the tree first: MeterIcon needs _ready() before set_value()
	var icon: MeterIcon = METER_SCENE.instantiate()
	icon.meter_id = id
	icon.size_flags_vertical = Control.SIZE_SHRINK_BEGIN
	row.add_child(icon)
	icon.custom_minimum_size = Vector2(Tokens.METER_ICON, Tokens.METER_ICON)
	var dot_slot := icon.get_node_or_null(^"DotSlot") as Control
	if dot_slot:
		dot_slot.visible = false   # C-16: glyph only (no effect dot)
	icon.high_contrast = _high_contrast()
	icon.set_value(value)
	icon.accessibility_name = meter_name   # never the band nor the number here
	var texts := VBoxContainer.new()
	texts.mouse_filter = Control.MOUSE_FILTER_IGNORE
	texts.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	texts.add_theme_constant_override(&"separation", Tokens.ESP_4)
	row.add_child(texts)
	var name_label := Label.new()
	name_label.theme_type_variation = &"TitleS"
	name_label.text = meter_name
	name_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	texts.add_child(name_label)
	if text != "":
		var body := Label.new()
		body.theme_type_variation = &"Body"
		body.text = text
		body.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		texts.add_child(body)


# --- Layout and style ------------------------------------------------------------------------

func _layout_fit() -> void:
	if _fit == null:
		return
	var h := minf(Tokens.CARD_MAX.y, size.y)
	var w := h * Tokens.CARD_RATIO
	if w > size.x:
		w = size.x
		h = w / Tokens.CARD_RATIO
	_fit.size = Vector2(w, h)
	_fit.position = ((size - _fit.size) * 0.5).round()


func _restyle() -> void:
	var hc := _high_contrast()
	_divider.color = Tokens.TEXT if hc else Tokens.OUTLINE
	for row in _rows.get_children():
		for icon in row.find_children("*", "MeterIcon", true, false):
			(icon as MeterIcon).high_contrast = hc


func _high_contrast() -> bool:
	var s := get_node_or_null(^"/root/Settings")
	return s != null and bool(s.get("high_contrast"))


# --- Input (P4 only) -------------------------------------------------------------------------

func _unhandled_input(event: InputEvent) -> void:
	if not _waiting_tap or not is_visible_in_tree():
		return
	var mb := event as InputEventMouseButton
	if mb and mb.button_index == MOUSE_BUTTON_LEFT:
		if mb.pressed:
			_pressed = true
		elif _pressed:
			_tap()
		get_viewport().set_input_as_handled()
	elif event.is_action_pressed(&"ui_accept") and not event.is_echo():
		get_viewport().set_input_as_handled()
		_tap()


func _tap() -> void:
	if not _waiting_tap:
		return
	_waiting_tap = false
	_pressed = false
	held.emit()


func _after_leave() -> void:
	visible = false
	left.emit()


func _kill() -> void:
	if _tween and _tween.is_valid():
		_tween.kill()
