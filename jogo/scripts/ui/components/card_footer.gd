class_name CardFooter
extends VBoxContainer
## C-07 — footer of the game screen (docs/14 §14.02; wireframe C-07, Tela):
## "Ano X · Fase · n/7" (Footer style, up to 2 lines) or, in the calibration
## and tutorial, the C-19 progress ("n/N" + segments), plus the 48×48 pause
## button. 1 px #37474F rule on top (HC: 2 px white).

signal pause_pressed

const SEGMENT_SIZE := Vector2(Tokens.ESP_16, Tokens.ESP_4)   # C-19
const PAUSE_ICON_PX := 22                                   # C-07 (CC0 icon 22)
const TEXT_MAX_LINES := 2                                   # D21: 2 lines at 24 px
## At 36 px (P1) "Ano 2 · Realidade Bate · 1/7" needs 3 lines; 2 would cut the "1/7"
## (D21 covers up to 24 px — a validar).
const TEXT_MAX_LINES_LARGE := 3
const LARGE_TEXT_PX := 36

var high_contrast: bool = false:
	set(v):
		high_contrast = v
		if is_node_ready():
			_apply_contrast()

var _done := 0
var _total := 0

@onready var _rule: ColorRect = $TopRule
@onready var _text: Label = $Pad/Row/ProgressText
@onready var _steps: HBoxContainer = $Pad/Row/Steps
@onready var _count: Label = $Pad/Row/Steps/Count
@onready var _segments: HBoxContainer = $Pad/Row/Steps/Segments
@onready var _pause: Button = $Pad/Row/PauseButton


func _ready() -> void:
	_fit_lines()
	_pause.accessibility_name = "Pausar"
	_pause.tooltip_text = "Pausar"
	_pause.add_theme_constant_override(&"icon_max_width", PAUSE_ICON_PX)
	_pause.pressed.connect(pause_pressed.emit)
	_steps.accessibility_live = AccessibilityServer.LIVE_POLITE
	_apply_contrast()


## "Ano 1 · Lua de Mel · 3/7" (no months, no money: docs/14 §14.02).
func set_text(text: String) -> void:
	_text.text = text
	_text.visible = true
	_steps.visible = false


## C-19: "n/N" then N segments (done white, to do #78909C). The screen
## reader reads "<noun> n de N" (texto a validar).
func set_progress(done: int, total: int, a11y_noun: String = "Pergunta") -> void:
	_done = clampi(done, 0, total)
	_total = maxi(total, 0)
	_count.text = "%d/%d" % [_done, _total]
	_steps.accessibility_name = "%s %d de %d" % [a11y_noun, _done, _total]
	_text.visible = false
	_steps.visible = true
	_rebuild_segments()


func set_pause_visible(on: bool) -> void:
	_pause.visible = on


func pause_button() -> Button:
	return _pause


func display_text() -> String:
	return _count.text if _steps.visible else _text.text


func _rebuild_segments() -> void:
	for child in _segments.get_children():
		_segments.remove_child(child)
		child.queue_free()
	for i in _total:
		var seg := Panel.new()
		seg.custom_minimum_size = SEGMENT_SIZE
		seg.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		seg.mouse_filter = Control.MOUSE_FILTER_IGNORE
		var box := StyleBoxFlat.new()
		box.set_corner_radius_all(Tokens.ESP_2)
		box.anti_aliasing = true
		seg.add_theme_stylebox_override(&"panel", box)
		_segments.add_child(seg)
	_paint_segments()


func _paint_segments() -> void:
	var todo := Tokens.TEXT if high_contrast else Tokens.INACTIVE
	var i := 0
	for seg: Panel in _segments.get_children():
		var box := seg.get_theme_stylebox(&"panel") as StyleBoxFlat
		box.bg_color = Tokens.TEXT if i < _done else todo
		i += 1


func _notification(what: int) -> void:
	if what == NOTIFICATION_THEME_CHANGED and is_node_ready():
		_fit_lines.call_deferred()   # the label's own theme cache refreshes after ours


func _fit_lines() -> void:
	var px := _text.get_theme_font_size(&"font_size")
	_text.max_lines_visible = TEXT_MAX_LINES_LARGE if px >= LARGE_TEXT_PX else TEXT_MAX_LINES
	_text.update_minimum_size()   # the container must grow to the 3rd line (V-048)


func _apply_contrast() -> void:
	_rule.color = Tokens.TEXT if high_contrast else Tokens.CARD
	_rule.custom_minimum_size.y = Tokens.ESP_2 if high_contrast else 1
	_paint_segments()
