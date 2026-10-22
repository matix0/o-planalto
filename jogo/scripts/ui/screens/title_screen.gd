extends AppScreen
## T-01 — tela inicial (14A §14A.02 T-01.1 a T-01.4; docs/15 §15.03).
## Sem partida salva: "Novo mandato" é o primário e "Continuar" não aparece.
## Com partida salva: "Continuar" primário e "Novo mandato" secundário (um único
## Primary por tela). Salvamento ilegível: aviso C-21 no topo e sem "Continuar".
## Novo mandato com partida salva: confirmação C-14 (variante A, D-173 pendente).

const NEW_TERM_TITLE := "Novo mandato"
const NEW_TERM_BODY := "Iniciar um novo mandato apagará a partida salva atual."

@onready var _safe_area: MarginContainer = %SafeArea
@onready var _continue: Button = %ContinueButton
@onready var _new_term: Button = %NewTermButton
@onready var _settings: Button = %SettingsButton
@onready var _about: Button = %AboutButton


func _ready() -> void:
	_continue.pressed.connect(_on_continue)
	_new_term.pressed.connect(_on_new_term)
	_settings.pressed.connect(func() -> void: request.emit(&"settings", {"push": true}))
	_about.visible = false   # D-198: credits live in Configurações


func enter(params: Dictionary = {}) -> void:
	refresh(not params.get("returned", false))


func _apply_safe_area() -> void:
	fit_margins(_safe_area, Tokens.ESP_24, Tokens.ESP_24)


## Shows "Continuar" only when a save exists; grabs the focus on the first button.
func refresh(grab: bool = true) -> void:
	var g := game()
	var has_save: bool = g != null and g.has_save()
	_continue.visible = has_save
	_new_term.theme_type_variation = &"Secondary" if has_save else &"Primary"
	if grab:
		focus_first(_continue if has_save else _new_term)


func buttons() -> Array[Button]:
	return [_continue, _new_term, _settings]


func _on_continue() -> void:
	var g := game()
	if g != null and g.resume():
		request.emit(AppMain.screen_for_state(g.current_state()), {"resume": true})   # A-27
		return
	# Unreadable save: Game deleted it; warn and drop "Continuar" (T-01.4, gdd 10 §5).
	var a := app()
	if a:
		a.show_toast(AppMain.SAVE_UNREADABLE_TEXT, &"top")
	refresh(true)


func _on_new_term() -> void:
	var g := game()
	if g != null and g.has_save():
		var a := app()
		if a:
			var ok: bool = await a.confirm(NEW_TERM_TITLE, NEW_TERM_BODY)
			if not ok:
				return
	if g != null:
		g.new_run()
	# Tutorial only the first time (gdd 10 §3.5 keeps "tutorial visto").
	request.emit(&"calibration" if Settings.tutorial_seen else &"tutorial", {})
