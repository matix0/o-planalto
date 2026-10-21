class_name ConfirmModal
extends Control
## C-14 — modal de confirmação: "Novo mandato" com partida salva (T-01.3),
## abandonar na calibração (T-03.4) e abandonar na partida (T-11.2).
## Variante A (cancelar primário) × B (confirmar primário) aguardam o PO (D-173):
## o padrão é A, por ser o mais seguro. Textos: "[a definir]".
## A-18: fundo 0 → 62% + painel com fade e escala 0,96 → 1 em 200 ms;
## Reduzir movimento: só fade de 150 ms.

signal decided(confirmed: bool)

const VARIANT := &"A"            # D-187: variante A, cancelar em destaque (fecha a D-173)
const OPEN_TIME := 0.2
const OPEN_TIME_REDUCED := 0.15
const DEFAULT_CONFIRM := "[confirmar — a definir]"
const DEFAULT_CANCEL := "[cancelar — a definir]"

@onready var _scrim: ColorRect = %Scrim
@onready var _panel: PanelContainer = %Panel
@onready var _title: Label = %Title
@onready var _body: Label = %Body
@onready var _primary: Button = %PrimaryButton
@onready var _secondary: Button = %SecondaryButton

var variant: StringName = VARIANT
## Initial focus without the ring (touch/mouse); Main sets it from the last input.
var hide_focus := false
var _column_width: float = Tokens.VIEWPORT.x
var _open := false
var _tween: Tween


func _ready() -> void:
	visible = false
	_scrim.color = Tokens.SCRIM
	_primary.pressed.connect(_on_primary)
	_secondary.pressed.connect(_on_secondary)
	_wire_focus_loop()


func set_frame(column_width: float) -> void:
	_column_width = column_width
	_panel.custom_minimum_size.x = maxf(0.0, column_width - Tokens.ESP_24 * 2)


## Shows the modal and waits: `var ok: bool = await modal.ask(...)`.
## own_scrim = false when another overlay already dims the screen (T-11.2:
## the pause menu keeps its scrim and only hides its panel).
func ask(title: String, body: String, confirm_text: String = DEFAULT_CONFIRM, cancel_text: String = DEFAULT_CANCEL, own_scrim: bool = true) -> bool:
	_title.text = title
	_body.text = body
	_panel.accessibility_name = title
	_panel.accessibility_description = body
	var cancel_first := variant == &"A"
	_primary.text = cancel_text if cancel_first else confirm_text
	_secondary.text = confirm_text if cancel_first else cancel_text
	_scrim.visible = own_scrim
	_open = true
	visible = true
	_animate_in()
	_cancel_button().grab_focus.call_deferred(hide_focus)   # foco inicial em cancelar (a validar)
	var confirmed: bool = await decided
	return confirmed


func cancel() -> void:
	if _open:
		_close(false)


func confirm() -> void:
	if _open:
		_close(true)


func is_open() -> bool:
	return _open


func buttons() -> Array[Button]:
	return [_primary, _secondary]


func title_text() -> String:
	return _title.text


func _cancel_button() -> Button:
	return _primary if variant == &"A" else _secondary


func _on_primary() -> void:
	_close(variant != &"A")


func _on_secondary() -> void:
	_close(variant == &"A")


func _close(confirmed: bool) -> void:
	_open = false
	if _tween and _tween.is_valid():
		_tween.kill()
	visible = false
	decided.emit(confirmed)


func _animate_in() -> void:
	if _tween and _tween.is_valid():
		_tween.kill()
	var reduced: bool = Settings.reduce_motion
	modulate.a = 0.0
	# offset_transform_* (4.7) is visual only: the CenterContainer keeps the layout.
	_panel.offset_transform_enabled = true
	_panel.offset_transform_pivot_ratio = Vector2(0.5, 0.5)
	_panel.offset_transform_scale = Vector2.ONE if reduced else Vector2(0.96, 0.96)
	_tween = create_tween().set_parallel(true).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	var time := OPEN_TIME_REDUCED if reduced else OPEN_TIME
	_tween.tween_property(self, "modulate:a", 1.0, time)
	if not reduced:
		_tween.tween_property(_panel, "offset_transform_scale", Vector2.ONE, OPEN_TIME)


func _wire_focus_loop() -> void:
	for pair in [[_primary, _secondary], [_secondary, _primary]]:
		var a: Button = pair[0]
		var b: Button = pair[1]
		a.focus_neighbor_bottom = a.get_path_to(b)
		a.focus_neighbor_top = a.get_path_to(b)
		a.focus_next = a.get_path_to(b)
		a.focus_previous = a.get_path_to(b)
		a.focus_neighbor_left = ^"."    # one column: side keys never leave the modal
		a.focus_neighbor_right = ^"."
