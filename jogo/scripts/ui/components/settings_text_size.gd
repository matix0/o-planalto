class_name SettingsTextSize
extends VBoxContainer
## C-20 — seletor do tamanho do texto 16 / 18 / 20 / 24 px (D-165; T-12.1).
## Um contorno 2 px #90A4AE (raio 12, padding 2) envolve 4 opções iguais
## (Button com toggle_mode no mesmo ButtonGroup, mín. 48); a marcada fica
## branca com texto #263238. Foco: anel branco interno (escuro na marcada).
## Teclado: setas trocam a opção (grupo de opções).
## Nota: a variação "Segment" do ThemeBuilder contorna cada botão; aqui o
## contorno é do grupo, como no C-20 — styleboxes locais (a validar).

signal step_selected(step: int)

const TITLE := "Tamanho do texto"
const INNER_RADIUS := 10

@onready var _title: Label = %Title
@onready var _frame: PanelContainer = %Frame
@onready var _options: HBoxContainer = %Options

var _group := ButtonGroup.new()
var _buttons: Array[Button] = []
var _step: int = Tokens.DEFAULT_STEP


func _ready() -> void:
	_title.text = TITLE
	for step in Settings.TEXT_STEPS:
		var b := Button.new()
		b.text = "%d px" % step
		b.toggle_mode = true
		b.button_group = _group
		b.theme_type_variation = &"Segment"
		b.custom_minimum_size = Vector2(0, Tokens.TOUCH_MIN)
		b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		b.accessibility_name = "%s: %d px" % [TITLE, step]
		b.set_meta(&"step", step)
		b.toggled.connect(_on_button_toggled.bind(b))
		b.gui_input.connect(_on_button_input.bind(b))
		_options.add_child(b)
		_buttons.append(b)
	_apply_styles()
	set_step(Settings.text_step if Settings.TEXT_STEPS.has(Settings.text_step) else Tokens.DEFAULT_STEP)


func _notification(what: int) -> void:
	if what == NOTIFICATION_THEME_CHANGED and is_node_ready():
		_apply_styles()


## Marks a step without emitting step_selected.
func set_step(step: int) -> void:
	_step = step
	for b in _buttons:
		b.set_pressed_no_signal(int(b.get_meta(&"step")) == step)
	_refresh_focus_rings()
	_frame.accessibility_name = "%s: %d px" % [TITLE, step]


func selected_step() -> int:
	return _step


func buttons() -> Array[Button]:
	return _buttons.duplicate()


func _on_button_toggled(on: bool, b: Button) -> void:
	if not on:
		return
	var step := int(b.get_meta(&"step"))
	if step == _step:
		return
	set_step(step)
	step_selected.emit(step)


## Radio-group keys: the arrow actions move the selection, not only the focus.
func _on_button_input(event: InputEvent, b: Button) -> void:
	var delta := 0
	if event.is_action_pressed(&"ui_left", true):
		delta = -1
	elif event.is_action_pressed(&"ui_right", true):
		delta = 1
	if delta == 0:
		return
	var i := clampi(_buttons.find(b) + delta, 0, _buttons.size() - 1)
	_buttons[i].grab_focus()
	if not _buttons[i].button_pressed:
		_buttons[i].button_pressed = true   # emits toggled → step_selected
	b.accept_event()


func _apply_styles() -> void:
	var hc: bool = Settings.high_contrast
	var outline := Tokens.TEXT if hc else Tokens.OUTLINE
	var frame := StyleBoxFlat.new()
	frame.draw_center = false
	frame.set_border_width_all(2)
	frame.border_color = outline
	frame.set_corner_radius_all(Tokens.RADIUS_12)
	frame.set_content_margin_all(Tokens.ESP_2 + 2)   # padding esp-2 inside the 2 px border
	frame.anti_aliasing = true
	_frame.add_theme_stylebox_override(&"panel", frame)
	var empty := _box(Color(0, 0, 0, 0))
	var marked := _box(Tokens.TEXT)
	for b in _buttons:
		b.add_theme_stylebox_override(&"normal", empty)
		b.add_theme_stylebox_override(&"hover", empty)
		b.add_theme_stylebox_override(&"pressed", marked)
		b.add_theme_stylebox_override(&"hover_pressed", marked)
		b.add_theme_stylebox_override(&"disabled", empty)
	_refresh_focus_rings()


func _refresh_focus_rings() -> void:
	for b in _buttons:
		var ring := StyleBoxFlat.new()
		ring.draw_center = false
		ring.set_border_width_all(Tokens.FOCUS_RING)
		# Internal ring: white on the empty options, dark on the marked (white) one.
		ring.border_color = (Tokens.HC_BG if Settings.high_contrast else Tokens.BG) if b.button_pressed else Tokens.TEXT
		ring.set_corner_radius_all(INNER_RADIUS)
		ring.anti_aliasing = true
		b.add_theme_stylebox_override(&"focus", ring)


func _box(color: Color) -> StyleBoxFlat:
	var sb := StyleBoxFlat.new()
	sb.bg_color = color
	sb.draw_center = color.a > 0.0
	sb.set_corner_radius_all(INNER_RADIUS)
	sb.content_margin_left = Tokens.ESP_4
	sb.content_margin_right = Tokens.ESP_4
	sb.content_margin_top = Tokens.ESP_8
	sb.content_margin_bottom = Tokens.ESP_8
	sb.anti_aliasing = true
	return sb
