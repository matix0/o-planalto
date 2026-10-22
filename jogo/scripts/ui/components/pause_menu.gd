class_name PauseMenu
extends Control
## T-11 — menu de pausa: Continuar, Configurações, Abandonar mandato (14A T-11.1).
## Opened by Main from the footer pause button (D-150) or Esc (D-167).
## Main sets get_tree().paused; this node runs with process_mode ALWAYS.
## A-20: fundo + painel com fade de 200 ms. Reduzir movimento: fade 150 ms
## (T-11.1; a tabela de animações diz "igual" — divergência, usado o T-11).
## T-11.2: na confirmação de abandono, o painel some e o mesmo fundo fica.

signal resume_requested
signal settings_requested
signal abandon_requested

const FADE := 0.2
const FADE_REDUCED := 0.15
const TITLE := "Pausa"

@onready var _scrim: ColorRect = %Scrim
@onready var _panel: PanelContainer = %Panel
@onready var _resume: Button = %ResumeButton
@onready var _settings: Button = %SettingsButton
@onready var _abandon: Button = %AbandonButton

## Initial focus without the ring (touch/mouse); Main sets it from the last input.
var hide_focus := false
var _open := false
var _tween: Tween


func _ready() -> void:
	visible = false
	process_mode = Node.PROCESS_MODE_ALWAYS
	_scrim.color = Tokens.SCRIM
	_panel.accessibility_name = TITLE
	_resume.pressed.connect(func() -> void: resume_requested.emit())
	_settings.pressed.connect(func() -> void: settings_requested.emit())
	_abandon.pressed.connect(func() -> void: abandon_requested.emit())
	var buttons: Array[Button] = [_resume, _settings, _abandon]
	for i in buttons.size():
		var b := buttons[i]
		var nxt := buttons[(i + 1) % buttons.size()]
		var prv := buttons[(i - 1 + buttons.size()) % buttons.size()]
		b.focus_neighbor_bottom = b.get_path_to(nxt)
		b.focus_next = b.get_path_to(nxt)
		b.focus_neighbor_top = b.get_path_to(prv)
		b.focus_previous = b.get_path_to(prv)
		b.focus_neighbor_left = ^"."    # one column: side keys never leave the menu
		b.focus_neighbor_right = ^"."


func set_frame(column_width: float) -> void:
	_panel.custom_minimum_size.x = maxf(0.0, column_width - Tokens.ESP_24 * 2)


func open() -> void:
	_open = true
	visible = true
	if _tween and _tween.is_valid():
		_tween.kill()
	modulate.a = 0.0
	_tween = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	_tween.tween_property(self, "modulate:a", 1.0, FADE_REDUCED if Settings.reduce_motion else FADE)
	_panel.visible = true
	_resume.grab_focus.call_deferred(hide_focus)


func close() -> void:
	_open = false
	if _tween and _tween.is_valid():
		_tween.kill()
	modulate.a = 1.0
	_panel.visible = true
	visible = false


## T-11.2: hides the panel (the scrim stays) while the abandon confirmation
## is on top; uncovering gives the focus back to "Abandonar mandato".
func set_covered(covered: bool) -> void:
	if not _open:
		return
	_panel.visible = not covered
	if not covered:
		_abandon.grab_focus.call_deferred(hide_focus)


func is_covered() -> bool:
	return _open and not _panel.visible


func buttons() -> Array[Button]:
	return [_resume, _settings, _abandon]


func is_open() -> bool:
	return _open
