extends AppScreen
## T-12 — Configurações (14A §14A.02 T-12.1; C-20; docs/14 §14.12.1).
## Controles: tamanho do texto 16/18/20/24 (D-165), Reduzir movimento,
## Alto contraste (P2, D-169), sensibilidade do arraste 25–40 % (D-158).
## As mudanças valem na hora [a definir: C-20 / T-12.1] e ficam guardadas
## entre partidas (gdd 10 §3.5). Sem botão "salvar". Fechar volta a quem abriu
## (T-01 ou T-11.1); Esc fecha a tela (a validar).

const TITLE := "Configurações"
const CLOSE_NAME := "Fechar"        # a validar — rótulo do botão de fechar [a definir] (T-12/T-13)
const AUDIO_TITLE := "Áudio"
const AUDIO_TEXT := "O jogo ainda não tem som."
const REDUCE_MOTION := "Reduzir movimento"
const HIGH_CONTRAST := "Alto contraste"
const CREDITS := "Créditos e licenças"   # T-13 moved here from T-01 (D-198)

@onready var _safe_area: MarginContainer = %SafeArea
@onready var _close: Button = %CloseButton
@onready var _text_size: SettingsTextSize = %TextSize
@onready var _reduce_motion: SettingsSwitchRow = %ReduceMotion
@onready var _high_contrast: SettingsSwitchRow = %HighContrast
@onready var _sensitivity: SettingsSliderRow = %Sensitivity


func _ready() -> void:
	%Title.text = TITLE
	%AudioTitle.text = AUDIO_TITLE
	%AudioText.text = AUDIO_TEXT
	_close.accessibility_name = CLOSE_NAME
	_close.tooltip_text = CLOSE_NAME
	_reduce_motion.text = REDUCE_MOTION
	_high_contrast.text = HIGH_CONTRAST
	_close.pressed.connect(close)
	var credits := Button.new()
	credits.name = "CreditsButton"
	credits.text = CREDITS
	credits.theme_type_variation = &"Secondary"
	credits.custom_minimum_size = Vector2(0, Tokens.TOUCH_MIN)
	credits.pressed.connect(func() -> void: request.emit(&"about", {"push": true}))
	var sections: Node = $SafeArea/Column/Scroll/Sections
	sections.add_child(credits)
	sections.move_child(credits, sections.get_child_count() - 2)   # above BottomPad
	_text_size.step_selected.connect(func(step: int) -> void: Settings.set_value(&"text_step", step))
	_reduce_motion.toggled.connect(func(on: bool) -> void: Settings.set_value(&"reduce_motion", on))
	_high_contrast.toggled.connect(func(on: bool) -> void: Settings.set_value(&"high_contrast", on))
	_sensitivity.value_changed.connect(func(v: float) -> void: Settings.set_value(&"drag_limit", v))
	Settings.changed.connect(_on_settings_changed)
	sync_from_settings()


func enter(params: Dictionary = {}) -> void:
	sync_from_settings()
	if not params.get("returned", false):
		focus_first(_close)


func handle_cancel() -> bool:
	close()
	return true


func close() -> void:
	request.emit(&"back", {})


func _apply_safe_area() -> void:
	fit_margins(_safe_area, Tokens.ESP_8, 0.0)


## Puts every control in the state stored in Settings (no signals).
func sync_from_settings() -> void:
	_text_size.set_step(Settings.text_step)
	_reduce_motion.set_on(Settings.reduce_motion)
	_high_contrast.set_on(Settings.high_contrast)
	_sensitivity.set_fraction(Settings.drag_limit)


func _on_settings_changed(_key: StringName) -> void:
	sync_from_settings()
