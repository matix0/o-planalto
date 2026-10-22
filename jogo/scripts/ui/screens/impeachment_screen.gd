extends AppScreen
## T-09 — impeachment scene, on its own screen (gdd/sistemas/03_impeachment.md §3.2-3.3, §8;
## docs/14 §14.08, §14.10; wireframes T09a, T09b, F07, C-10, C-11; Animações A-16, A-25, A-26).
##
## Every stage comes from Game.impeachment_view() (api.md §5): intro → phase → consequence →
## learning → … (5 cards) → result. The screen shows and asks; Game decides and saves. After the
## app reopens, the consequence, the Aprendizado and the result come back read-only (F-07,
## gdd 10 CA-07): nothing is chosen again and no effect is replayed.
##
## Layout = T-06 with the scoreboard (C-11) between the HUD and the speaker, the hatched frame
## on the card (C-10, SwipeCard mode &"crisis") and the scene background #1C2529 on the whole
## window (Main.set_backdrop). No side words (D-084), no meter numbers, no green or red.
## Consequence (T-07.3) and Aprendizado (T-08) use the game screen's components (lote D).
## Labels and containers let taps through (mouse_filter IGNORE / PASS): a tap outside the card
## cancels a revealed option (D-145) and reaches the consequence line.

const INTRO_CUT := 0.5          # A-25: dramatic cut ≥ 500 ms; input blocked meanwhile
const INTRO_DIM := 0.72         # A-16: black 0 → 72% (a validar)
const INTRO_DIM_TIME := 0.6     # A-16, part of its 1.5-2.5 s (a validar)
const TEXT_FADE := 0.3          # opening text in, result text in (a validar)
const OUT_FADE := 0.15          # A-11: speaker and problem leave before the consequence
const SHORT_FADE := 0.15        # Reduzir movimento: short fades only

var _view: Dictionary = {}
var _stage := ""                # on screen: intro, phase, resolving, consequence, learning, result, leaving
var _serial := 0                # bumped on every stage change; late callbacks of an old stage stop
var _locked := false            # input blocked (A-25 cut, A-16, card exit, HUD timeline)
var _waiting_exit := false
var _waiting_hud := false
var _left := false
var _layout_queued := false
var _body_tween: Tween
var _intro_tween: Tween
var _result_tween: Tween

@onready var _safe_area: MarginContainer = %SafeArea
@onready var _hud: Hud = %Hud
@onready var _scoreboard: Scoreboard = %Scoreboard
@onready var _board_gap: Control = %BoardGap
@onready var _speaker: SpeakerView = %Speaker
@onready var _speaker_gap: Control = %SpeakerGap
@onready var _problem: Label = %Problem
@onready var _card: SwipeCard = %Card
@onready var _result: ImpeachmentPanel = %Result
@onready var _footer: CardFooter = %Footer
@onready var _tap_layer: Control = %TapLayer
@onready var _consequence: ConsequenceLine = %Consequence
@onready var _sheet: LearningSheet = %LearningSheet
@onready var _intro: Control = %Intro
@onready var _dim: ColorRect = %Dim
@onready var _intro_text: ImpeachmentPanel = %IntroText


func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	_card.choice_confirmed.connect(_on_choice)
	_card.exit_finished.connect(_on_card_exit)
	_hud.changes_finished.connect(_on_hud_done)
	_footer.pause_pressed.connect(_on_pause_pressed)
	_result.continued.connect(_continue_result)
	_consequence.continued.connect(_on_consequence_continued)
	_sheet.continued.connect(_on_sheet_continued)
	_tap_layer.gui_input.connect(_on_tap_layer_input)
	_intro.gui_input.connect(_on_intro_input)
	for c: Control in [self, _footer, _scoreboard, _hud]:
		c.resized.connect(_queue_layout)
	_scoreboard.visibility_changed.connect(_queue_layout)
	Settings.changed.connect(_on_settings_changed)


func enter(params: Dictionary = {}) -> void:
	_apply_settings()
	if params.get("returned", false):
		return   # back from Configurações (pause menu): same stage, settings re-applied
	var a := app()
	if a and not a.pause_changed.is_connected(_on_pause_changed):
		a.pause_changed.connect(_on_pause_changed)
	if not get_viewport().size_changed.is_connected(_fit_dim):
		get_viewport().size_changed.connect(_fit_dim)
	_view = _read_view()
	_hud.set_values(_hud_values())
	_show_stage(true)


func allows_pause() -> bool:
	return true


## D-167: Esc first hides a revealed option; otherwise Main opens the pause.
func handle_cancel() -> bool:
	if _stage == "phase" and _card.visible:
		return _card.cancel_reveal()
	return false


# --- For tests and captures ------------------------------------------------------------------

func stage() -> String:
	return _stage


func is_locked() -> bool:
	return _locked


func scoreboard() -> Scoreboard:
	return _scoreboard


func card() -> SwipeCard:
	return _card


func result_panel() -> ImpeachmentPanel:
	return _result


func intro_panel() -> ImpeachmentPanel:
	return _intro_text


func consequence() -> ConsequenceLine:
	return _consequence


func sheet() -> LearningSheet:
	return _sheet


func hud() -> Hud:
	return _hud


func footer() -> CardFooter:
	return _footer


# --- Stages ------------------------------------------------------------------------------

func _show_stage(from_enter: bool) -> void:
	_serial += 1
	_locked = false
	_update_header()
	_footer.set_text(_scene_footer())   # every stage; a phase card brings its own
	var animate := not from_enter and not bool(_view.get("readonly", false))
	match String(_view.get("stage", "")):
		"intro":
			_show_intro()
		"phase":
			_show_phase(animate)
		"consequence":
			_show_consequence(animate)
		"learning":
			_show_learning()
		"result":
			_show_result(animate)
		_:
			_leave(AppMain.screen_for_state(_game_state()))


## T-09.1 — A-25 cut (≥ 500 ms, input blocked), then A-16: the screen darkens and the opening
## text appears. Tap, click or Enter continues (T-09.1: "toque ou tempo", [a definir]).
func _show_intro() -> void:
	_stage = "intro"
	var serial := _serial
	_card.visible = false
	_set_body(false)
	_show_board({}, false)
	_result.visible = false
	_tap_layer.visible = false
	_consequence.hide_now()
	_sheet.hide_now()
	_footer.set_text(_scene_footer())
	_intro_text.show_intro(String(_view.get("intro_text", "")))
	_intro.visible = true
	_intro.modulate.a = 1.0
	_intro.mouse_filter = Control.MOUSE_FILTER_STOP
	_fit_dim.call_deferred()
	_locked = true
	_dim.color = Color(0, 0, 0, 0)
	_intro_text.modulate.a = 0.0
	_kill(_intro_tween)
	_intro_tween = create_tween()
	_intro_tween.tween_interval(INTRO_CUT)
	_intro_tween.tween_callback(_unlock.bind(serial))
	_intro_tween.tween_property(_dim, "color:a", INTRO_DIM, SHORT_FADE if _rm() else INTRO_DIM_TIME) \
		.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	_intro_tween.parallel().tween_property(_intro_text, "modulate:a", 1.0, SHORT_FADE if _rm() else TEXT_FADE)


## T-09.2 to T-09.6 — the scoreboard enters before the card (A-16), then A-01.
func _show_phase(animate: bool) -> void:
	_stage = "phase"
	var serial := _serial
	var view: Dictionary = _view.get("card", {})
	_result.visible = false
	_tap_layer.visible = false
	_speaker.setup(String(view.get("speaker", "")), _portrait_on())
	_problem.text = String(view.get("problem", ""))
	_footer.set_text(String(view.get("footer", _scene_footer())))
	_card.setup({
		"title": view.get("title", ""),
		"problem": view.get("problem", ""),
		"sides": view.get("sides", {}),
		"mode": &"crisis",
	})
	var board: Dictionary = _view.get("scoreboard", {})
	_set_body(true)
	if not animate:
		_show_board(board, false)
		_card.visible = true
		focus_first(_card)
		return
	_locked = true
	_card.visible = false
	_fade_body(0.0, 1.0, SHORT_FADE if _rm() else TEXT_FADE)
	if not board.is_empty():
		_show_board(board, true)
		await _scoreboard.entered
		if serial != _serial:
			return
	else:
		_show_board({}, false)
	_card.visible = true
	_card.play_enter()
	_locked = false
	focus_first(_card)


## A choice on a phase card: Game resolves and saves; the HUD plays the effects while the card
## leaves (input blocked); then the consequence — or the final screen, when a meter reached 0.
func _on_choice(side: int) -> void:
	if _stage != "phase":
		return
	_stage = "resolving"
	_serial += 1
	_locked = true
	var r: Dictionary = game().choose_impeachment(side)
	if r.is_empty():
		_resync()
		return
	_waiting_exit = true
	_waiting_hud = true
	_hud.apply_changes(r.get("changes", []), _rm())


func _on_card_exit(_side: int) -> void:
	if _stage == "resolving":
		_waiting_exit = false
		_after_choice()


func _on_hud_done() -> void:
	if _stage == "resolving":
		_waiting_hud = false
		_after_choice()


func _after_choice() -> void:
	if _waiting_exit or _waiting_hud:
		return
	if _game_state() != &"impeachment":
		_leave(AppMain.screen_for_state(_game_state()))   # catastrophe: A-15 played, then A-26
		return
	_view = _read_view()
	_show_stage(false)


## Consequence of the phase card over the updated HUD, with the scoreboard of that vote
## (A-11, T-07.3). Read-only after a restart (F-07): the tag shows, nothing is replayed.
func _show_consequence(animate: bool) -> void:
	_stage = "consequence"
	var c: Dictionary = _view.get("consequence", {})
	var readonly := bool(_view.get("readonly", false))
	_card.visible = false
	_result.visible = false
	_tap_layer.visible = false
	_show_board(_view.get("scoreboard", {}), animate)
	if animate:
		_fade_body(-1.0, 0.0, SHORT_FADE if _rm() else OUT_FADE)
	else:
		_set_body(true, 0.0)
	_queue_layout()
	_consequence.show_text(String(c.get("text", "")), readonly)
	focus_first(_consequence)


func _on_consequence_continued() -> void:
	if _stage != "consequence" or _locked:
		return
	if not game().continue_impeachment():
		_resync()
		return
	_view = _read_view()
	if String(_view.get("stage", "")) != "learning":
		_consequence.hide_line()
	_show_stage(false)


## Aprendizado of the phase (APR-IMP-n): the sheet rises over the consequence (T-08, A-12).
func _show_learning() -> void:
	_stage = "learning"
	_card.visible = false
	_tap_layer.visible = false
	if not _consequence.visible:
		_set_body(true, 0.0)   # reopened straight into the Aprendizado
	_sheet.reduce_motion = _rm()
	_sheet.safe_top = safe_top
	_sheet.safe_bottom = safe_bottom
	_sheet.open(_view.get("learning", {}))


func _on_sheet_continued() -> void:
	if _stage != "learning":
		return
	if not game().continue_impeachment():
		_resync()
		return
	_view = _read_view()
	var focused := get_viewport().gui_get_focus_owner()
	if focused and _sheet.is_ancestor_of(focused):
		focused.release_focus()   # keys go to the next card, not to the closing sheet
	_sheet.close()
	_consequence.hide_line()
	_show_stage(false)


## T-09.7 / T-09.8 / T-09.9 — the Senate bar (A-16), then the result; the acquittal effects
## play on the HUD (A-07; dots [a definir]). Tap, click or Enter continues.
func _show_result(animate: bool) -> void:
	_stage = "result"
	var serial := _serial
	var res: Dictionary = _view.get("result", {})
	_card.visible = false
	_consequence.hide_now()
	_sheet.hide_now()
	_set_body(false)
	_footer.set_text(_scene_footer())
	_result.show_result(String(res.get("title", "")), String(res.get("text", "")))
	_result.visible = true
	_tap_layer.visible = true
	var board: Dictionary = _view.get("scoreboard", {})
	if not animate:
		_show_board(board, false)
		_result.modulate.a = 1.0
		focus_first(_result)
		return
	_locked = true
	_result.modulate.a = 0.0
	_show_board(board, true)
	await _scoreboard.entered
	if serial != _serial:
		return
	var changes: Array = res.get("changes", [])
	if not changes.is_empty():
		_hud.apply_changes(changes, _rm())
	_kill(_result_tween)
	_result_tween = create_tween()
	_result_tween.tween_property(_result, "modulate:a", 1.0, SHORT_FADE if _rm() else TEXT_FADE)
	await _result_tween.finished
	if serial != _serial:
		return
	_locked = false
	focus_first(_result)


func _continue_intro() -> void:
	if _stage != "intro" or _locked:
		return
	if not game().continue_impeachment():
		_resync()
		return
	_view = _read_view()
	_hide_intro()
	_show_stage(false)


## Acquittal → back where the run stopped; conviction → the "Impeachment" final (A-26).
func _continue_result() -> void:
	if _stage != "result" or _locked:
		return
	_stage = "leaving"
	if not game().continue_impeachment():
		_resync()
		return
	_leave(AppMain.screen_for_state(_game_state()))


func _leave(target: StringName) -> void:
	if _left:
		return
	_left = true
	_locked = true
	_stage = "leaving"
	_serial += 1
	request.emit(target, {"fade_time": AppMain.FINAL_FADE} if target == &"final" else {})


## Something did not match Game (should not happen): show what Game says now.
func _resync() -> void:
	if _game_state() != &"impeachment":
		_leave(AppMain.screen_for_state(_game_state()))
		return
	_view = _read_view()
	_show_stage(true)


# --- Input -------------------------------------------------------------------------------

func _unhandled_input(event: InputEvent) -> void:
	var mb := event as InputEventMouseButton
	if mb:
		# D-145: a tap outside the card hides a revealed option (the card keeps its own taps).
		if _stage == "phase" and mb.button_index == MOUSE_BUTTON_LEFT and not mb.pressed and _card.cancel_reveal():
			get_viewport().set_input_as_handled()
		return
	if not (event is InputEventKey or event is InputEventJoypadButton) or not event.is_pressed() or event.is_echo():
		return
	match _stage:
		"intro":
			if event.is_action(&"ui_accept"):
				get_viewport().set_input_as_handled()
				_continue_intro()
		"result":
			if event.is_action(&"ui_accept"):
				get_viewport().set_input_as_handled()
				_continue_result()
		"phase":
			# Keys reach the card even when it lost the focus (arrows reveal, Enter confirms).
			if not _locked and (event.is_action(&"ui_left") or event.is_action(&"ui_right") or event.is_action(&"ui_accept")):
				if _card.handle_key(event):
					get_viewport().set_input_as_handled()


func _on_intro_input(event: InputEvent) -> void:
	if _is_tap(event):
		_intro.accept_event()
		_continue_intro()


func _on_tap_layer_input(event: InputEvent) -> void:
	if _is_tap(event):
		_tap_layer.accept_event()
		_continue_result()


static func _is_tap(event: InputEvent) -> bool:
	var b := event as InputEventMouseButton
	return b != null and b.button_index == MOUSE_BUTTON_LEFT and not b.pressed


func _on_pause_pressed() -> void:
	var a := app()
	if a:
		a.open_pause()


func _on_pause_changed(is_open: bool) -> void:
	if is_open:
		_card.cancel_gesture()


# --- Settings, backdrop, layout --------------------------------------------------------------

func _on_settings_changed(_key: StringName) -> void:
	_apply_settings()


## Live: drag limit, Reduzir movimento, Alto contraste (P2) and the portrait at 36 px (P1).
func _apply_settings() -> void:
	var hc: bool = Settings.high_contrast
	var rm: bool = Settings.reduce_motion
	_card.drag_limit = Settings.drag_limit
	_card.reduce_motion = rm
	_card.high_contrast = hc
	_hud.high_contrast = hc
	_footer.high_contrast = hc
	_speaker.high_contrast = hc
	_scoreboard.high_contrast = hc
	_scoreboard.reduce_motion = rm
	_consequence.reduce_motion = rm
	_sheet.reduce_motion = rm
	_speaker.setup(_speaker.speaker_name(), _portrait_on())
	_apply_backdrop()


func _apply_backdrop() -> void:
	var a := app()
	if a and is_visible_in_tree():
		a.set_backdrop(Tokens.HC_BG if Settings.high_contrast else Tokens.CRISIS_BG)


func _notification(what: int) -> void:
	if what == NOTIFICATION_VISIBILITY_CHANGED and is_inside_tree():
		if is_visible_in_tree():
			_apply_backdrop()   # back from Configurações
		else:
			_reset_backdrop()   # Configurações pushed over the scene
	elif what == NOTIFICATION_EXIT_TREE:
		_reset_backdrop()


func _reset_backdrop() -> void:
	var a := app()
	if a:
		a.reset_backdrop()


func _apply_safe_area() -> void:
	fit_margins(_safe_area, Tokens.ESP_8, 0)   # T-06: top = safe_top + esp-8, bottom = safe_bottom
	_sheet.safe_top = safe_top
	_sheet.safe_bottom = safe_bottom
	_queue_layout()


func _queue_layout() -> void:
	if _layout_queued or not is_node_ready():
		return
	_layout_queued = true
	_layout_layers.call_deferred()


## The consequence sits between the scoreboard (or the HUD) and the footer (T-07.3); the tap
## layer of the result stops at the footer, so "Pausar" stays reachable.
func _layout_layers() -> void:
	_layout_queued = false
	if not is_inside_tree():
		return
	var above: Control = _scoreboard if _scoreboard.visible else _hud
	var top := _rect_in_self(above).end.y + Tokens.ESP_16
	var bottom := maxf(0.0, size.y - _rect_in_self(_footer).position.y)
	_consequence.offset_top = top
	_consequence.offset_bottom = -bottom
	_tap_layer.offset_bottom = -bottom
	_fit_dim()


## The darkened layer covers the whole window, safe areas and PC sides included (T-09.1).
func _fit_dim() -> void:
	if not is_inside_tree() or not _intro.visible:
		return
	var vp := get_viewport_rect()
	var r := _intro.get_global_rect()
	_dim.offset_left = vp.position.x - r.position.x
	_dim.offset_top = vp.position.y - r.position.y
	_dim.offset_right = vp.end.x - r.end.x
	_dim.offset_bottom = vp.end.y - r.end.y


func _rect_in_self(c: Control) -> Rect2:
	return Rect2(c.global_position - global_position, c.size)


# --- Helpers -------------------------------------------------------------------------------

func _read_view() -> Dictionary:
	return game().impeachment_view()


func _game_state() -> StringName:
	return game().current_state()


func _hud_values() -> Dictionary:
	var out := {}
	for m: Dictionary in game().hud():
		out[String(m["id"])] = int(m["value"])
	return out


func _rm() -> bool:
	return Settings.reduce_motion


## P1 (D-169): no portrait at 36 px.
func _portrait_on() -> bool:
	return Settings.text_step < Settings.TEST_TEXT_STEP


func _show_board(board: Dictionary, animate: bool) -> void:
	_board_gap.visible = not board.is_empty()
	_scoreboard.show_board(board, animate)


## Speaker and problem: shown (and at `alpha`) or out of the layout.
func _set_body(on: bool, alpha: float = 1.0) -> void:
	_kill(_body_tween)
	for c: Control in [_speaker, _speaker_gap, _problem]:
		c.visible = on
		c.modulate.a = alpha


## Fades speaker and problem (A-11 out; back in with the next card). `from` < 0 = current.
func _fade_body(from: float, to: float, time: float) -> void:
	_kill(_body_tween)
	_body_tween = create_tween().set_parallel(true)
	for c: Control in [_speaker, _speaker_gap, _problem]:
		c.visible = true
		if from >= 0.0:
			c.modulate.a = from
		_body_tween.tween_property(c, "modulate:a", to, time)


func _hide_intro() -> void:
	if not _intro.visible:
		return
	_intro.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_kill(_intro_tween)
	_intro_tween = create_tween()
	_intro_tween.tween_property(_intro, "modulate:a", 0.0, SHORT_FADE if _rm() else TEXT_FADE)
	_intro_tween.tween_callback(func() -> void: _intro.visible = false)


func _unlock(serial: int) -> void:
	if serial == _serial:
		_locked = false


func _kill(t: Tween) -> void:
	if t and t.is_valid():
		t.kill()


func _scene_footer() -> String:
	return GameFlow.scene_footer(maxi(1, int(_view.get("phase", 1))), String(_view.get("stage", "")) == "result")


## Header in the impeachment red, above the scoreboard (ideia inicial; P-017, D-199).
func _update_header() -> void:
	var header := get_node_or_null(^"SafeArea/Column/SceneHeader") as Label
	if header == null:
		header = Label.new()
		header.name = "SceneHeader"
		header.theme_type_variation = &"Caption"
		header.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		header.uppercase = true
		var gap: Node = $SafeArea/Column/HudGap
		gap.add_sibling(header)
	header.add_theme_color_override(&"font_color", Tokens.TEXT if Settings.high_contrast else Tokens.IMPEACH_ACCENT)
	header.text = _scene_footer()
