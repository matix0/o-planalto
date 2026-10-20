class_name ImpeachmentPanel
extends MarginContainer
## Text block of the impeachment scene (wireframes T09a T-09.1, T09b T-09.7 to T-09.9; Tela
## "resultado"): the opening text over the darkened screen (Title-L, white) and the result
## (Title-L + Body in the secondary color). Centered, sides esp-24, gap esp-16, autowrap
## (+30% for translation). Texts come from Game; the repo has none yet ("[a definir]").
##
## INTRO: not focusable ("sem foco até a 1ª carta"); the screen reader reads it as it appears.
## RESULT: focusable — Enter continues (the screen also takes a tap anywhere); title + text in
## accessibility_name, announced politely (T-09.7 "Result com accessibility_live POLITE").

signal continued

enum Look { INTRO, RESULT }

const TITLE_LINE_RATIO := 40.0 / 34.0   # Title-L 34/40 (T-09.1 tokens; a validar)

var _look: Look = Look.INTRO
var _ring := StyleBoxFlat.new()

@onready var _box: VBoxContainer = $Box
@onready var _title: Label = $Box/Title
@onready var _text: Label = $Box/Text


func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	accessibility_live = AccessibilityServer.LIVE_POLITE
	for side in [&"margin_left", &"margin_right"]:
		add_theme_constant_override(side, Tokens.ESP_24)
	_box.add_theme_constant_override(&"separation", Tokens.ESP_16)
	_ring.draw_center = false
	_ring.set_border_width_all(Tokens.FOCUS_RING)
	_ring.border_color = Tokens.TEXT
	_ring.set_corner_radius_all(Tokens.RADIUS_12 + Tokens.FOCUS_OFFSET)
	_ring.anti_aliasing = true
	focus_entered.connect(queue_redraw)
	focus_exited.connect(queue_redraw)
	_fit_title_line()
	show_intro("")


## T-09.1 — opening text, white Title-L.
func show_intro(text: String) -> void:
	_look = Look.INTRO
	_title.text = text
	_text.text = ""
	_text.visible = false
	focus_mode = Control.FOCUS_NONE
	accessibility_name = text
	queue_redraw()


## T-09.7 / T-09.8 / T-09.9 — result title and text.
func show_result(title: String, text: String) -> void:
	_look = Look.RESULT
	_title.text = title
	_text.text = text
	_text.visible = text != ""
	focus_mode = Control.FOCUS_ALL
	accessibility_name = title if text == "" else "%s. %s" % [title, text]
	queue_redraw()


func look() -> Look:
	return _look


func title_text() -> String:
	return _title.text


func body_text() -> String:
	return _text.text if _text.visible else ""


func _gui_input(event: InputEvent) -> void:
	if _look == Look.RESULT and event.is_action_pressed(&"ui_accept"):
		accept_event()
		continued.emit()


func _notification(what: int) -> void:
	if what == NOTIFICATION_THEME_CHANGED and is_node_ready():
		_fit_title_line()


## Focus ring only for keyboard / gamepad focus (grab_focus(hide_focus), 4.7).
func _draw() -> void:
	if _look == Look.RESULT and has_focus(true):
		draw_style_box(_ring, _box.get_rect().grow(Tokens.FOCUS_OFFSET + Tokens.FOCUS_RING))


func _fit_title_line() -> void:
	var font := get_theme_font(&"font", &"TitleL")
	var size := get_theme_font_size(&"font_size", &"TitleL")
	_title.add_theme_constant_override(&"line_spacing", int(round(size * TITLE_LINE_RATIO - font.get_height(size))))
