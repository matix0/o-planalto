extends AppScreen
## T-03 — calibration (docs/15 §15.04; 14A §14A.02 T-03.1 to T-03.4; gdd/sistemas/10 §3.2,
## §3.3; D-145, D-146, D-153, D-157, D-158, D-166).
## Six questions on the card face (Title-M); answers only appear on drag or on the 1st tap,
## with the white filete only (no party color, D-166). No speaker, no problem; the footer
## shows the progress "n/6" (C-19). HUD during the calibration: [a definir] — dashed
## placeholder. After the 6th answer → Year 1 on the game screen: fade with a light zoom,
## 400 ms (A-23; "Reduzir movimento": fade only). Pause allowed (T-03.4: abandon → title).

const TO_YEAR_FADE := 0.4          # A-23 (Main fades the two screens)
const TO_YEAR_ZOOM := 1.04         # A-23: "leve zoom" [intensidade a definir]
const HUD_PLACEHOLDER := "[HUD na calibração — a definir]"
const CARD_A11Y := "Pergunta %d de %d: %s"   # T-03.1 [formato a definir]
const PROGRESS_NOUN := "Pergunta"
const DASH := 4.0

@onready var _safe: MarginContainer = %SafeArea
@onready var _hud_box: Control = %HudPlaceholder
@onready var _hud_text: Label = %HudPlaceholderText
@onready var _card: SwipeCard = %Card
@onready var _footer: CardFooter = %Footer

var _answering := false
var _leaving := false


func _ready() -> void:
	_card.choice_confirmed.connect(_on_choice)
	_card.exit_finished.connect(_on_exit)
	_footer.pause_pressed.connect(_on_pause_pressed)
	_footer.set_pause_visible(true)
	_hud_text.text = HUD_PLACEHOLDER
	_hud_box.draw.connect(_draw_hud_placeholder)
	Settings.changed.connect(_on_settings_changed)
	var a := app()
	if a:
		a.pause_changed.connect(_on_pause_changed)
	_apply_settings()


# --- AppScreen -------------------------------------------------------------------------------

func enter(params: Dictionary = {}) -> void:
	if params.get("returned", false):
		_apply_settings()
		return
	var g := game()
	if g == null or not g.has_method(&"calibration_view"):
		return   # a Game without the views (the shell tests' fake): nothing to show
	if g.current_state() != &"calibration":
		_leave(g.current_state())
		return
	_show_question()


func handle_cancel() -> bool:
	return _card.cancel_reveal()   # D-167: 1st Esc cancels a revealed answer; then the pause


func allows_pause() -> bool:
	return true


func _apply_safe_area() -> void:
	if is_node_ready():
		fit_margins(_safe, Tokens.ESP_8, 0)


# --- Flow ------------------------------------------------------------------------------------

func _show_question() -> void:
	var view: Dictionary = game().calibration_view()
	var index := int(view.get("index", 1))
	var total := int(view.get("total", 6))
	var question := String(view.get("question", ""))
	_answering = false
	_card.visible = true
	_card.setup({
		"title": question,
		"sides": view.get("sides", {}),
		"problem": "",
		"mode": &"calibration",
	})
	_card.accessibility_name = CARD_A11Y % [index, total, question]
	_footer.set_progress(index, total, PROGRESS_NOUN)
	_card.play_enter()
	_focus_card()


## Answer = Game.answer_calibration(side) (±5 on the starting meters, never shown).
func _on_choice(side: int) -> void:
	if _answering or _leaving:
		return
	_answering = true
	game().answer_calibration(side)


func _on_exit(_side: int) -> void:
	var s: StringName = game().current_state()
	if s == &"calibration":
		_show_question()
	else:
		_leave(s)


## Last answer → Year 1 (A-23); abandon or a stray state → the screen of that state.
func _leave(s: StringName) -> void:
	if _leaving:
		return
	_leaving = true
	_card.visible = false
	var target := AppMain.screen_for_state(s)
	if target == &"game" and not Settings.reduce_motion:
		offset_transform_enabled = true
		offset_transform_pivot_ratio = Vector2(0.5, 0.5)
		var t := create_tween()
		t.tween_property(self, "offset_transform_scale", Vector2.ONE * TO_YEAR_ZOOM, TO_YEAR_FADE * 0.5) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	request.emit(target, {"fade_time": TO_YEAR_FADE} if target == &"game" else {})


# --- Settings, pause, input ------------------------------------------------------------------

func _on_settings_changed(_key: StringName) -> void:
	_apply_settings()


func _apply_settings() -> void:
	_card.drag_limit = Settings.drag_limit
	_card.reduce_motion = Settings.reduce_motion
	_card.high_contrast = Settings.high_contrast
	_footer.high_contrast = Settings.high_contrast
	_hud_box.queue_redraw()


func _on_pause_pressed() -> void:
	var a := app()
	if a:
		a.open_pause()


func _on_pause_changed(is_open: bool) -> void:
	if is_open:
		_card.cancel_gesture()


## D-145: a tap outside the card cancels a revealed answer. An arrow key while the card has
## no focus (touch or mouse so far) focuses it and reveals.
func _unhandled_input(event: InputEvent) -> void:
	if _leaving:
		return
	var mb := event as InputEventMouseButton
	if mb:
		if mb.button_index == MOUSE_BUTTON_LEFT and not mb.pressed and _card.cancel_reveal():
			get_viewport().set_input_as_handled()
		return
	if not _card.has_focus() and (event.is_action_pressed(&"ui_left") or event.is_action_pressed(&"ui_right")):
		_card.grab_focus()
		if _card.handle_key(event):
			get_viewport().set_input_as_handled()


## Focus (and its ring) only for keyboard / gamepad users: the card rests without the ring
## for touch and mouse (T-03.1). See game_screen.gd _focus_card().
func _focus_card() -> void:
	var a := app()
	if a and a.keyboard_navigation():
		focus_first(_card)
	elif _card.has_focus():
		_card.release_focus()


## Dashed outline (1 px #90A4AE; P2 white) around the HUD slot: "[a definir]" marker.
func _draw_hud_placeholder() -> void:
	var color := Tokens.TEXT if Settings.high_contrast else Tokens.OUTLINE
	var r := Rect2(Vector2.ZERO, _hud_box.size).grow(-0.5)
	var corners := [r.position, Vector2(r.end.x, r.position.y), r.end, Vector2(r.position.x, r.end.y)]
	for i in 4:
		_hud_box.draw_dashed_line(corners[i], corners[(i + 1) % 4], color, 1.0, DASH)


# --- For tests and captures ------------------------------------------------------------------

func card() -> SwipeCard:
	return _card


func footer() -> CardFooter:
	return _footer
