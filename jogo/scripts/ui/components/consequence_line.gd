class_name ConsequenceLine
extends Control
## T-07.3 — the consequence sentence over the updated HUD (docs/14 §14.06, §14.10.1; A-11).
## Shared by the game screen (lote D) and the impeachment scene (lote E).
##
## show_text() fades the sentence in (A-11, 200 ms; "Reduzir movimento": the same short fade)
## and waits for a tap or click anywhere on the screen, or Enter / Space, then emits
## `continued` once (GDD §10.3 speaks of a "continuar" button; docs/14 §14.06 wins: it
## waits for the tap, D6). The screen calls the Game action and then hide_line() (or opens
## the learning sheet over it, T-08).
##
## Taps arrive through _unhandled_input(): labels and containers of the screen keep
## mouse_filter = IGNORE (or PASS) so a tap reaches it; buttons (the pause button) keep their
## own clicks. The sentence is centered in this control's rect with esp-24 on the sides —
## place it between the HUD and the footer, as in T-07.3.
## Read-only (run resumed after the app closed, gdd 10 §5): a tag
## "Você já leu esta carta" shows above the sentence.

signal continued

const FADE_IN := 0.2          # A-11 (a validar); same with "Reduzir movimento"
const FADE_OUT := 0.15
const HINT_TEXT := "Toque na tela para continuar"
const REREAD_TEXT := "Você já leu esta carta"

## A-11 is the same with "Reduzir movimento" (short fade); kept for symmetry with the sheet.
var reduce_motion: bool = false

var _waiting := false
var _pressed := false
var _tween: Tween

@onready var _reread: PanelContainer = %RereadTag
@onready var _reread_text: Label = %RereadText
@onready var _text: Label = %Text
@onready var _hint: PanelContainer = %Hint
@onready var _hint_text: Label = %HintText


func _ready() -> void:
	visible = false
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	focus_mode = Control.FOCUS_ALL
	_text.accessibility_live = AccessibilityServer.LIVE_POLITE
	_hint_text.text = HINT_TEXT
	_reread_text.text = REREAD_TEXT
	resized.connect(_fit_pills)
	_fit_pills()


func _notification(what: int) -> void:
	if what == NOTIFICATION_THEME_CHANGED and is_node_ready():
		_fit_pills.call_deferred()


## Pill tags (Tag panel + autowrapped Caption) that keep the width of their text and wrap
## only when it does not fit in `max_width` (large text steps, +30% translation).
static func fit_pill_label(label: Label, max_width: float) -> void:
	var font := label.get_theme_font(&"font")
	var font_size := label.get_theme_font_size(&"font_size")
	var panel := label.get_parent() as Control
	var pad := 0.0
	if panel:
		var box := panel.get_theme_stylebox(&"panel")
		if box:
			pad = box.get_margin(SIDE_LEFT) + box.get_margin(SIDE_RIGHT)
	var text_w := ceilf(font.get_string_size(label.text, HORIZONTAL_ALIGNMENT_LEFT, -1, font_size).x) + 2.0
	label.custom_minimum_size.x = maxf(1.0, minf(text_w, max_width - pad))


## Shows `text` and starts waiting for the tap. `readonly` = resumed run (tag shown).
func show_text(text: String, readonly: bool = false) -> void:
	_kill()
	_text.text = text
	accessibility_name = text
	_reread.visible = readonly
	_hint.visible = true
	visible = true
	_waiting = true
	_pressed = false
	modulate.a = 0.0
	_tween = create_tween()
	_tween.tween_property(self, "modulate:a", 1.0, FADE_IN) \
		.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)


## Stops waiting and fades out (150 ms).
func hide_line() -> void:
	_waiting = false
	_pressed = false
	_kill()
	if not visible:
		return
	_tween = create_tween()
	_tween.tween_property(self, "modulate:a", 0.0, FADE_OUT)
	_tween.tween_callback(hide)


## Hides at once.
func hide_now() -> void:
	_waiting = false
	_pressed = false
	_kill()
	visible = false


func is_waiting() -> bool:
	return _waiting


func text() -> String:
	return _text.text


## Same as a tap (tests, keyboard helpers).
func continue_now() -> void:
	_continue()


# --- Input -----------------------------------------------------------------------------------

func _gui_input(event: InputEvent) -> void:
	if _waiting and _is_accept(event):
		accept_event()
		_continue()


func _unhandled_input(event: InputEvent) -> void:
	if not _waiting or not is_visible_in_tree():
		return
	var mb := event as InputEventMouseButton
	if mb and mb.button_index == MOUSE_BUTTON_LEFT:
		# A tap = press and release while waiting (a press from before does not count).
		if mb.pressed:
			_pressed = true
		elif _pressed:
			_continue()
		get_viewport().set_input_as_handled()
		return
	if _is_accept(event):
		get_viewport().set_input_as_handled()
		_continue()


func _is_accept(event: InputEvent) -> bool:
	return event.is_action_pressed(&"ui_accept") and not event.is_echo()


func _fit_pills() -> void:
	if size.x <= 2.0 * Tokens.ESP_24:
		return   # not laid out yet
	var avail := size.x - 2.0 * Tokens.ESP_24
	fit_pill_label(_hint_text, avail)
	fit_pill_label(_reread_text, avail)


func _continue() -> void:
	if not _waiting:
		return
	_waiting = false
	_pressed = false
	continued.emit()


func _kill() -> void:
	if _tween and _tween.is_valid():
		_tween.kill()
