class_name EventNotice
extends Control
## C-17 — chained event notice (T-05.1 to T-05.3; gdd/sistemas/08_eventos.md §3.1, §3.3, §5;
## docs/14 §14.10.1; docs/15 §15.08; D-109, D-111).
## A white 4 px highlight on the edge of the screen + an icon in a ring + the event text
## (Title-M). Alert = white + shape, never green or red (D-172). The screen animates the HUD
## with the event changes meanwhile (A-07 to A-09) and tells when to wait for the tap.
##
## A-14: highlight and icon enter in 400 ms (SINE in/out) and the highlight stays;
## "Reduzir movimento": no flash, fade 150 ms.
## [a definir]: icon (provisional link glyph), advance by tap or time (here: tap / Enter after
## wait_for_tap()), the "n de N" indicator, effect dots on events, the origin label (P5, off).

signal continued

const ENTER_TIME := 0.4           # A-14
const RM_FADE := 0.15             # A-14 with "Reduzir movimento"
const EXIT_TIME := 0.15
const EDGE_WIDTH := 4             # esp-4 white
const RING_SIZE := 64             # circle esp-64, contour 2 white
const ICON_SIZE := 40
const ICON_POP := 0.85            # A-14: icon enters from 85% (a validar); RM: none
const P5 := false                 # PROPOSTA P5: show the card that caused the event — off
const COUNTER_FORMAT := "%d de %d"
const ORIGIN_LABEL := "Consequência de uma decisão sua"
const HINT_TEXT := "Toque na tela para continuar"

var _waiting := false
var _pressed := false
var _view: Dictionary = {}
var _tween: Tween

@onready var _edge: Panel = %Edge
@onready var _area: MarginContainer = %Area
@onready var _ring: PanelContainer = %Ring
@onready var _icon: TextureRect = %Icon
@onready var _text: Label = %Text
@onready var _counter: Label = %Counter
@onready var _origin: VBoxContainer = %Origin
@onready var _origin_label: Label = %OriginLabel
@onready var _origin_title: Label = %OriginTitle
@onready var _hint: PanelContainer = %Hint
@onready var _hint_text: Label = %HintText


func _ready() -> void:
	visible = false
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	focus_mode = Control.FOCUS_ALL
	_text.accessibility_live = AccessibilityServer.LIVE_POLITE
	_ring.offset_transform_enabled = true
	_ring.offset_transform_pivot_ratio = Vector2(0.5, 0.5)
	_origin_label.text = ORIGIN_LABEL
	_hint_text.text = HINT_TEXT
	resized.connect(_on_resized)
	_restyle()


func _notification(what: int) -> void:
	if what == NOTIFICATION_THEME_CHANGED and is_node_ready():
		_restyle()
		_fit_hint.call_deferred()


## Shows Game.event_view(): {index, total, text, origin_title, ...}. A-14.
func show_event(view: Dictionary, reduce_motion: bool = false) -> void:
	_kill()
	_view = view.duplicate(true)
	_waiting = false
	_pressed = false
	var text := String(view.get("text", ""))
	_text.text = text
	accessibility_name = text
	var total := int(view.get("total", 1))
	_counter.visible = total > 1
	_counter.text = COUNTER_FORMAT % [int(view.get("index", 1)), total]
	var origin := String(view.get("origin_title", ""))
	_origin.visible = P5 and origin != ""
	_origin_title.text = origin
	_hint.visible = false
	visible = true
	modulate.a = 1.0
	_layout_edge()
	_fit_hint()
	_edge.modulate.a = 0.0
	_ring.modulate.a = 0.0
	_text.modulate.a = 0.0
	_tween = create_tween().set_parallel(true)
	if reduce_motion:
		_ring.offset_transform_scale = Vector2.ONE
		for item in [_edge, _ring, _text]:
			_tween.tween_property(item, "modulate:a", 1.0, RM_FADE)
		_fade_extras(1.0, RM_FADE)
		return
	_ring.offset_transform_scale = Vector2.ONE * ICON_POP
	for item in [_edge, _ring, _text]:
		_tween.tween_property(item, "modulate:a", 1.0, ENTER_TIME) \
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	_tween.tween_property(_ring, "offset_transform_scale", Vector2.ONE, ENTER_TIME) \
		.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	_fade_extras(1.0, ENTER_TIME)


## Starts waiting for a tap anywhere (or Enter / Space) and shows the hint.
func wait_for_tap() -> void:
	_waiting = true
	_pressed = false
	_hint.visible = true
	_fit_hint()


## Fades out (150 ms) and hides.
func hide_notice() -> void:
	_waiting = false
	_pressed = false
	_kill()
	if not visible:
		return
	_tween = create_tween()
	_tween.tween_property(self, "modulate:a", 0.0, EXIT_TIME)
	_tween.tween_callback(hide)


func hide_now() -> void:
	_waiting = false
	_kill()
	visible = false


## Area of the content (between the HUD and the footer, as the card slot), in this
## control's coordinates: `top` from the top edge, `bottom` from the bottom edge.
func set_area(top: float, bottom: float) -> void:
	_area.add_theme_constant_override(&"margin_top", int(round(top)))
	_area.add_theme_constant_override(&"margin_bottom", int(round(bottom)))


func is_waiting() -> bool:
	return _waiting


func view() -> Dictionary:
	return _view


func display_texts() -> PackedStringArray:
	var out := PackedStringArray([_text.text])
	for l: Label in [_counter, _origin_label, _origin_title, _hint_text]:
		if l.is_visible_in_tree():
			out.append(l.text)
	return out


## Same as a tap (tests).
func continue_now() -> void:
	_continue()


# --- Internals -------------------------------------------------------------------------------

func _fade_extras(to: float, time: float) -> void:
	for item: CanvasItem in [_counter, _origin]:
		item.modulate.a = 0.0
		_tween.tween_property(item, "modulate:a", to, time)


func _on_resized() -> void:
	_layout_edge()
	_fit_hint()


## The highlight runs along the edge of the window (beyond the column on PC).
func _layout_edge() -> void:
	var r := LearningSheet.viewport_rect_in(self)
	_edge.offset_left = r.position.x
	_edge.offset_top = r.position.y
	_edge.offset_right = r.end.x - size.x
	_edge.offset_bottom = r.end.y - size.y


func _fit_hint() -> void:
	if size.x > 2.0 * Tokens.ESP_24:
		ConsequenceLine.fit_pill_label(_hint_text, size.x - 2.0 * Tokens.ESP_24)


func _restyle() -> void:
	var edge := StyleBoxFlat.new()
	edge.draw_center = false
	edge.set_border_width_all(EDGE_WIDTH)
	edge.border_color = Tokens.TEXT
	_edge.add_theme_stylebox_override(&"panel", edge)
	var ring := StyleBoxFlat.new()
	ring.draw_center = false
	ring.set_border_width_all(2)
	ring.border_color = Tokens.TEXT
	ring.set_corner_radius_all(Tokens.RADIUS_PILL)
	ring.anti_aliasing = true
	var pad := (RING_SIZE - ICON_SIZE) * 0.5
	ring.content_margin_left = pad
	ring.content_margin_right = pad
	ring.content_margin_top = pad
	ring.content_margin_bottom = pad
	_ring.add_theme_stylebox_override(&"panel", ring)


func _unhandled_input(event: InputEvent) -> void:
	if not _waiting or not is_visible_in_tree():
		return
	var mb := event as InputEventMouseButton
	if mb and mb.button_index == MOUSE_BUTTON_LEFT:
		if mb.pressed:
			_pressed = true
		elif _pressed:
			_continue()
		get_viewport().set_input_as_handled()
	elif event.is_action_pressed(&"ui_accept") and not event.is_echo():
		get_viewport().set_input_as_handled()
		_continue()


func _gui_input(event: InputEvent) -> void:
	if _waiting and event.is_action_pressed(&"ui_accept") and not event.is_echo():
		accept_event()
		_continue()


func _continue() -> void:
	if not _waiting:
		return
	_waiting = false
	_pressed = false
	continued.emit()


func _kill() -> void:
	if _tween and _tween.is_valid():
		_tween.kill()
