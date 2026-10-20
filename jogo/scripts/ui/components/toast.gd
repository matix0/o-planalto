class_name AppToast
extends Control
## C-21 — aviso discreto: falha ao gravar (1× por partida) e salvamento ilegível
## (gdd/sistemas/10_estado_partida.md §5). Never takes focus, never blocks input.
## A-19: fade 150 ms in and out; permanência [a definir].

const FADE := 0.15
const HOLD_SECONDS := 4.0   # [a definir] — não definido no repo (C-21)

@onready var _margin: MarginContainer = %Margin
@onready var _box: VBoxContainer = %Box
@onready var _message: Label = %Message

var _column_width: float = Tokens.VIEWPORT.x
var _safe_top: float = 0.0
var _safe_bottom: float = 0.0
var _place: StringName = &"top"
var _tween: Tween
var _hold: SceneTreeTimer


func _ready() -> void:
	modulate.a = 0.0
	visible = false
	_message.accessibility_live = AccessibilityServer.LIVE_POLITE
	resized.connect(_layout)


## Main calls this on resize: width of the centered column and safe margins (canvas units).
func set_frame(column_width: float, safe_top: float, safe_bottom: float) -> void:
	_column_width = column_width
	_safe_top = safe_top
	_safe_bottom = safe_bottom
	_layout()


## place: &"top" (T-01.4) or &"bottom" (over the footer, T-14.1) — posição [a definir].
func show_message(text: String, place: StringName = &"top", hold: float = HOLD_SECONDS) -> void:
	_message.text = text
	_place = place
	_layout()
	visible = true
	_kill()
	_tween = create_tween()
	_tween.tween_property(self, "modulate:a", 1.0, FADE).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	if hold > 0.0:
		_tween.tween_interval(hold)
		_tween.tween_property(self, "modulate:a", 0.0, FADE).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN)
		_tween.tween_callback(func() -> void: visible = false)


func hide_now() -> void:
	_kill()
	modulate.a = 0.0
	visible = false


func is_showing() -> bool:
	return visible


func message() -> String:
	return _message.text


func _kill() -> void:
	if _tween and _tween.is_valid():
		_tween.kill()


func _layout() -> void:
	if not is_node_ready():
		return
	var side := maxf(0.0, (size.x - _column_width) * 0.5) + Tokens.ESP_24
	# T-14.1: over the footer, the toast leaves the pause button (48) + esp-8 free (a validar).
	var pause_gap := float(Tokens.TOUCH_MIN + Tokens.ESP_8) if _place == &"bottom" else 0.0
	_margin.add_theme_constant_override(&"margin_left", int(side))
	_margin.add_theme_constant_override(&"margin_right", int(side + pause_gap))
	_margin.add_theme_constant_override(&"margin_top", int(_safe_top + Tokens.ESP_24))
	_margin.add_theme_constant_override(&"margin_bottom", int(_safe_bottom + Tokens.ESP_8))
	_box.alignment = BoxContainer.ALIGNMENT_END if _place == &"bottom" else BoxContainer.ALIGNMENT_BEGIN
