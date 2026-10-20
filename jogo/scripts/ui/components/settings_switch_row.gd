class_name SettingsSwitchRow
extends HBoxContainer
## C-20 — linha com chave (Reduzir movimento, Alto contraste; T-12.1).
## Rótulo num Label separado com autowrap (+30% de tradução) e a chave ao lado.
## A chave é um CheckButton (o leitor de tela recebe o estado ligado/desligado),
## desenhado aqui: trilho 52×32 e botão 24. Ligada: trilho #FFFFFF e botão
## #263238; desligada: trilho #78909C e botão branco. O estado também se lê
## pela posição do botão, não só pela cor. O botão desliza 150 ms (a validar);
## com Reduzir movimento, troca sem deslize.

signal toggled(on: bool)

const TRACK := Vector2(52, 32)
const KNOB_RADIUS := 12.0          # botão esp-24
const KNOB_INSET := 4.0            # (32 − 24) / 2
const SLIDE_TIME := 0.15           # a validar

@export var text: String = "":
	set(v):
		text = v
		if is_node_ready():
			_apply_text()

@onready var _label: Label = %Label
@onready var _switch: CheckButton = %Switch

var _knob_t := 0.0                  # 0 = off, 1 = on (drawn position)
var _tween: Tween


func _ready() -> void:
	_apply_text()
	_setup_switch()
	_switch.toggled.connect(_on_switch_toggled)
	_switch.draw.connect(_draw_switch)
	_switch.focus_entered.connect(_switch.queue_redraw)
	_switch.focus_exited.connect(_switch.queue_redraw)
	_label.gui_input.connect(_on_label_input)


func _notification(what: int) -> void:
	if what == NOTIFICATION_THEME_CHANGED and is_node_ready():
		_switch.queue_redraw()


## Sets the state without emitting `toggled` (no-op when it is already there,
## so a running slide is not cut short).
func set_on(on: bool, animate: bool = false) -> void:
	if _switch.button_pressed == on:
		return
	_switch.set_pressed_no_signal(on)
	_move_knob(on, animate)


func is_on() -> bool:
	return _switch.button_pressed


func switch() -> CheckButton:
	return _switch


func _apply_text() -> void:
	_label.text = text
	_switch.accessibility_name = text


func _setup_switch() -> void:
	_switch.text = ""
	_switch.focus_mode = Control.FOCUS_ALL
	_switch.custom_minimum_size = Vector2(TRACK.x, Tokens.TOUCH_MIN)
	_switch.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	# Transparent icons only reserve the track's space; the track is drawn in _draw_switch.
	var blank := Image.create_empty(int(TRACK.x), int(TRACK.y), false, Image.FORMAT_RGBA8)
	var tex := ImageTexture.create_from_image(blank)
	for icon in [&"checked", &"unchecked", &"checked_disabled", &"unchecked_disabled", &"checked_mirrored", &"unchecked_mirrored", &"checked_disabled_mirrored", &"unchecked_disabled_mirrored"]:
		_switch.add_theme_icon_override(icon, tex)
	var empty := StyleBoxEmpty.new()
	for style in [&"normal", &"hover", &"pressed", &"hover_pressed", &"disabled", &"focus"]:
		_switch.add_theme_stylebox_override(style, empty)
	_knob_t = 1.0 if _switch.button_pressed else 0.0


func _on_switch_toggled(on: bool) -> void:
	toggled.emit(on)
	_move_knob(on, not Settings.reduce_motion)


## The row label is part of the target too (tap anywhere on the row).
func _on_label_input(event: InputEvent) -> void:
	var mb := event as InputEventMouseButton
	if mb and mb.button_index == MOUSE_BUTTON_LEFT and not mb.pressed:
		_switch.button_pressed = not _switch.button_pressed
		_label.accept_event()


func _move_knob(on: bool, animate: bool) -> void:
	if _tween and _tween.is_valid():
		_tween.kill()
	var target := 1.0 if on else 0.0
	if not animate or not is_inside_tree():
		_knob_t = target
		_switch.queue_redraw()
		return
	_tween = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	_tween.tween_method(_set_knob, _knob_t, target, SLIDE_TIME)


func _set_knob(t: float) -> void:
	_knob_t = t
	_switch.queue_redraw()


func _track_rect() -> Rect2:
	var s := _switch.size
	return Rect2(Vector2(s.x - TRACK.x, (s.y - TRACK.y) * 0.5), TRACK)


func _draw_switch() -> void:
	var hc: bool = Settings.high_contrast
	var r := _track_rect()
	var track := StyleBoxFlat.new()
	track.set_corner_radius_all(int(TRACK.y * 0.5))
	track.anti_aliasing = true
	track.bg_color = Tokens.INACTIVE.lerp(Tokens.TEXT, _knob_t)
	if hc and _knob_t < 0.5:
		track.set_border_width_all(2)
		track.border_color = Tokens.TEXT
	_switch.draw_style_box(track, r)
	var x0 := r.position.x + KNOB_INSET + KNOB_RADIUS
	var x1 := r.end.x - KNOB_INSET - KNOB_RADIUS
	var center := Vector2(lerpf(x0, x1, _knob_t), r.get_center().y)
	var dark := Tokens.HC_BG if hc else Tokens.BG
	_switch.draw_circle(center, KNOB_RADIUS, Tokens.TEXT.lerp(dark, _knob_t), true, -1.0, true)
	if _switch.has_focus():
		var ring := StyleBoxFlat.new()
		ring.draw_center = false
		ring.set_border_width_all(Tokens.FOCUS_RING)
		ring.border_color = Tokens.TEXT
		var grow := float(Tokens.FOCUS_OFFSET + Tokens.FOCUS_RING)
		ring.set_corner_radius_all(int(TRACK.y * 0.5 + grow))
		ring.anti_aliasing = true
		_switch.draw_style_box(ring, r.grow(grow))
