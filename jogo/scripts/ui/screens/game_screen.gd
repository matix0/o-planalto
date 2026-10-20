extends AppScreen
## T-04 to T-08 in one screen (docs/14 §14.02-§14.10; 14A §14A.02; gdd/sistemas/10 §3.1-3.5):
## year card (C-16), chained events (C-17), the card (C-02 to C-07), the effects on the HUD
## (T-07), the consequence (T-07.3) and the learning card (C-09, T-08).
##
## The screen follows Game.current_state() after every Game action and asks Main for another
## screen when the state leaves the game: impeachment (A-25) or final (A-26; a meter at 0
## shatters first, A-15). A resumed run shows consequence, learning card and events
## read-only, without replaying the effects (gdd 10 §3.5, §5, CA-07).
## Input is blocked from the release of the card to the consequence (T-07: nothing to tap).
## Esc: a half revealed by tap or keyboard is cancelled first (D-167); otherwise Main opens
## the pause. A tap outside the card cancels a revealed half (D-145).

signal _card_gone
signal _hud_idle

const IMPEACHMENT_FADE := 0.5      # A-25: "corte dramático", ≥ 500 ms (a validar)
const CONTEXT_FADE := 0.15         # A-11: speaker and problem leave (fade 150)
const CONTEXT_ENTER := 0.25        # they come back with the next card (A-01 time, a validar)
const EVENT_FINAL_HOLD := 0.8      # read-only event that ended the run: time to read (a validar)
const EVENT_DOTS := false          # T-05.1: effect dots on events [a definir] — none
const CLOSING_DOTS := false        # T-04: turn closing changes animate without dots (a validar)
const P1_STEP := 36                # D-169: test base P1 — no portrait, the problem scrolls
const P1_PROBLEM_LINES := 4        # T-15.6: 4 visible lines + gradient + bar
const YEAR_FOOTER := ""            # T-04: footer during the year card [a definir] — empty

@onready var _safe: MarginContainer = %SafeArea
@onready var _hud_slot: Control = %HudSlot
@onready var _hud: Hud = %Hud
@onready var _speaker: SpeakerView = %Speaker
@onready var _speaker_gap: Control = %SpeakerGap
@onready var _problem_box: MarginContainer = %ProblemBox
@onready var _problem_scroll: ScrollContainer = %ProblemScroll
@onready var _problem: Label = %Problem
@onready var _problem_fade: TextureRect = %ProblemFade
@onready var _card: SwipeCard = %Card
@onready var _year_card: YearCard = %YearCard
@onready var _footer: CardFooter = %Footer
@onready var _event: EventNotice = %EventNotice
@onready var _consequence: ConsequenceLine = %Consequence
@onready var _sheet: LearningSheet = %LearningSheet

## What the screen is showing: &"", &"year", &"events", &"card", &"resolving",
## &"consequence", &"learning", &"leaving".
var _step: StringName = &""
var _token := 0
var _hud_busy := false
var _card_leaving := false
var _year_footer := ""             # "Ano N · Fase" of the last year card (footer of T-05)
var _p1 := false
var _context_tween: Tween
var _overlay_queued := false


func _ready() -> void:
	_card.choice_confirmed.connect(_on_choice)
	_card.exit_finished.connect(_on_card_exit)
	_card.hint_enabled = true
	_hud.changes_finished.connect(_on_hud_finished)
	_consequence.continued.connect(_on_consequence_continued)
	_sheet.continued.connect(_on_learning_continued)
	_event.continued.connect(_on_event_continued)
	_footer.pause_pressed.connect(_on_pause_pressed)
	_footer.set_pause_visible(true)
	_footer.set_text("")
	Settings.changed.connect(_on_settings_changed)
	_hud_slot.item_rect_changed.connect(_queue_overlay_layout)
	_footer.item_rect_changed.connect(_queue_overlay_layout)
	resized.connect(_queue_overlay_layout)
	var bar := _problem_scroll.get_v_scroll_bar()
	bar.value_changed.connect(_update_problem_fade)
	bar.changed.connect(_update_problem_fade.bind(0.0))
	var a := app()
	if a:
		a.pause_changed.connect(_on_pause_changed)
	_apply_settings()
	_queue_overlay_layout()


func _notification(what: int) -> void:
	if what == NOTIFICATION_THEME_CHANGED and is_node_ready():
		_style_problem()


# --- AppScreen -------------------------------------------------------------------------------

func enter(params: Dictionary = {}) -> void:
	if params.get("returned", false):
		_apply_settings()
		return
	var g := game()
	if g == null or not g.has_method(&"card_view"):
		return   # a Game without the views (the shell tests' fake): nothing to show
	_hud.set_values(_values_of(g.hud()))
	_dispatch()


func handle_cancel() -> bool:
	if _step == &"card":
		return _card.cancel_reveal()   # D-167: 1st Esc cancels the revealed half
	return false


func allows_pause() -> bool:
	return true


func _apply_safe_area() -> void:
	if not is_node_ready():
		return
	fit_margins(_safe, Tokens.ESP_8, 0)
	_sheet.safe_top = safe_top
	_sheet.safe_bottom = safe_bottom
	_queue_overlay_layout()


# --- State → what is on screen ---------------------------------------------------------------

## Reads the Game state and shows it (also after every Game action).
func _dispatch() -> void:
	var g := game()
	var s: StringName = g.current_state() if g else &"start"
	match s:
		&"year_intro":
			_show_year()
		&"events":
			_show_event()
		&"card":
			_show_card()
		&"consequence":
			_show_consequence(g.consequence_view())
		&"learning":
			_show_learning(g.learning_view())
		_:
			_leave_to(s)


## The state left the game: impeachment scene (A-25) or final (A-26).
func _leave_to(s: StringName) -> void:
	_next_token()
	_step = &"leaving"
	var target := AppMain.screen_for_state(s)
	var params := {}
	if target == &"final":
		params["fade_time"] = AppMain.FINAL_FADE
	elif target == &"impeachment":
		params["fade_time"] = IMPEACHMENT_FADE
	request.emit(target, params)


## T-04 / C-16: "Ano N · Fase" (+ Capture warning in Year 4); the closing changes of the
## turn animate on the HUD meanwhile (no dots, a validar). Pause stays available.
func _show_year() -> void:
	var token := _next_token()
	_step = &"year"
	var g := game()
	var view: Dictionary = g.year_view()
	_clear_center()
	_year_footer = "%s · %s" % [String(view.get("title", "")), String(view.get("phase", ""))]
	_footer.set_text(YEAR_FOOTER)
	var changes: Array = view.get("closing_changes", [])
	_hud_apply(changes if CLOSING_DOTS else _without_dots(changes))
	_year_card.show_year(view, _values_of(g.hud()), _rm())
	await _year_card.held
	if token != _token:
		return
	await _wait_hud()
	if token != _token:
		return
	_year_card.leave(_rm())
	await _year_card.left
	if token != _token:
		return
	g.continue_from_year()
	_dispatch()


## T-05 / C-17: one notice per event, in order; the HUD shows its changes. Advances on a
## tap; an event that zeroed a meter goes on alone (shatter, then final or impeachment).
func _show_event() -> void:
	var token := _next_token()
	_step = &"events"
	var g := game()
	var view: Dictionary = g.event_view()
	_clear_center()
	_footer.set_text(_year_footer)
	_event.show_event(view, _rm())
	if bool(view.get("readonly", false)):
		_hud.set_values(_values_of(g.hud()))   # resumed: no replay
	else:
		var changes: Array = view.get("changes", [])
		_hud_apply(changes if EVENT_DOTS else _without_dots(changes))
	await _wait_hud()
	if token != _token:
		return
	if String(view.get("outcome", "")) == "":
		_event.wait_for_tap()
		focus_first(_event)
		return
	if bool(view.get("readonly", false)):
		await get_tree().create_timer(EVENT_FINAL_HOLD, false).timeout
		if token != _token:
			return
	_continue_event()


func _on_event_continued() -> void:
	if _step == &"events":
		_continue_event()


func _continue_event() -> void:
	_next_token()
	var g := game()
	g.continue_from_event()
	if g.current_state() != &"events":
		_event.hide_notice()
	_dispatch()


## T-06: speaker, problem, the card and the footer "Ano · Fase · n/7".
func _show_card() -> void:
	_next_token()
	_step = &"card"
	var view: Dictionary = game().card_view()
	_event.hide_notice()
	_consequence.hide_line()
	_year_card.hide_now()
	_speaker.setup(String(view.get("speaker", "")), not _p1)
	_problem.text = String(view.get("problem", ""))
	_problem_scroll.scroll_vertical = 0
	_footer.set_text(String(view.get("footer", "")))
	_set_context_visible(true)
	_fade_context(1.0, CONTEXT_FADE if _rm() else CONTEXT_ENTER)
	_card_leaving = false
	_card.visible = true
	_card.setup({
		"title": view.get("title", ""),
		"sides": view.get("sides", {}),
		"problem": view.get("problem", ""),
		"mode": &"crisis" if bool(view.get("crisis", false)) else &"normal",
	})
	_card.play_enter()
	_set_problem_interactive(true)
	_update_problem_fade()
	_focus_card()


## The decision (release beyond the limit, 2nd tap or Enter): resolve and save, animate the
## HUD (dots 100 ms after the release, A-07 to A-10), then the consequence (T-07.3) — or the
## final / impeachment when a meter reached 0 (A-15 already played on the icon).
func _on_choice(side: int) -> void:
	if _step != &"card":
		return
	var token := _next_token()
	_step = &"resolving"
	_card_leaving = true
	_set_problem_interactive(false)
	var result: Dictionary = game().choose(side)
	if result.is_empty():
		push_warning("GameScreen: choose(%d) ignored in state %s" % [side, game().current_state()])
	_hud_apply(result.get("changes", []))
	if _card_leaving:
		await _card_gone
	if token != _token:
		return
	await _wait_hud()
	if token != _token:
		return
	_dispatch()


func _on_card_exit(_side: int) -> void:
	_card_leaving = false
	_card.visible = false
	_card_gone.emit()


## T-07.3: speaker and problem fade out (150 ms) and the sentence fades in (A-11); waits
## for a tap anywhere. Read-only after a resume: no effect replay, nothing else on screen.
func _show_consequence(view: Dictionary) -> void:
	_next_token()
	_step = &"consequence"
	var readonly := bool(view.get("readonly", false))
	_card.visible = false
	_year_card.hide_now()
	_event.hide_now()
	_set_problem_interactive(false)
	if readonly:
		_hud.set_values(_values_of(game().hud()))
		_set_context_visible(false)
	else:
		_fade_context(0.0, CONTEXT_FADE)
	_consequence.show_text(String(view.get("text", "")), readonly)
	focus_first(_consequence)


func _on_consequence_continued() -> void:
	if _step != &"consequence":
		return
	_next_token()
	var g := game()
	g.continue_from_consequence()
	if g.current_state() == &"learning":
		_show_learning(g.learning_view())
	else:
		_consequence.hide_line()
		_dispatch()


## T-08: the sheet rises over the consequence (A-12); "Continuar" → next card, year card,
## events, impeachment or final.
func _show_learning(view: Dictionary) -> void:
	_next_token()
	_step = &"learning"
	_card.visible = false
	_year_card.hide_now()
	_event.hide_now()
	_set_problem_interactive(false)
	if not _consequence.visible:
		_set_context_visible(false)   # resumed straight into the learning card
	_sheet.reduce_motion = _rm()
	_sheet.safe_top = safe_top
	_sheet.safe_bottom = safe_bottom
	_sheet.open(view)


func _on_learning_continued() -> void:
	if _step != &"learning":
		return
	_next_token()
	game().continue_from_learning()
	_sheet.close()
	_consequence.hide_line()
	_dispatch()


# --- HUD -------------------------------------------------------------------------------------

func _hud_apply(changes: Array) -> void:
	_hud_busy = true
	_hud.apply_changes(changes, _rm())   # empty list → changes_finished next frame


func _on_hud_finished() -> void:
	_hud_busy = false
	_hud_idle.emit()


func _wait_hud() -> void:
	if _hud_busy:
		await _hud_idle


static func _without_dots(changes: Array) -> Array:
	var out: Array = []
	for c in changes:
		var d: Dictionary = (c as Dictionary).duplicate()
		d["dot"] = "none"   # EffectDot.kind_from → NONE
		out.append(d)
	return out


static func _values_of(hud_list: Array) -> Dictionary:
	var out := {}
	for m in hud_list:
		out[String((m as Dictionary).get("id", ""))] = int((m as Dictionary).get("value", 0))
	return out


# --- Context (speaker + problem) -------------------------------------------------------------

## Year card and events: no speaker, no problem, no card (T-04, T-05).
func _clear_center() -> void:
	_card.visible = false
	_consequence.hide_now()
	_set_problem_interactive(false)
	_set_context_visible(false)


func _set_context_visible(on: bool) -> void:
	_kill(_context_tween)
	_speaker.visible = on
	_speaker_gap.visible = on
	_problem_box.visible = on
	if not on:
		_speaker.modulate.a = 1.0
		_problem_box.modulate.a = 1.0


func _fade_context(to: float, time: float) -> void:
	_kill(_context_tween)
	if not _speaker.visible:
		return
	if to > 0.0 and is_equal_approx(_speaker.modulate.a, 1.0):
		_speaker.modulate.a = 0.0
		_problem_box.modulate.a = 0.0
	_context_tween = create_tween().set_parallel(true)
	_context_tween.tween_property(_speaker, "modulate:a", to, time)
	_context_tween.tween_property(_problem_box, "modulate:a", to, time)


## P1 (36 px): the problem scrolls inside 4 lines; the scroll only takes touches while the
## card is up, so a tap there still reaches the consequence later.
func _set_problem_interactive(on: bool) -> void:
	_problem_scroll.mouse_filter = Control.MOUSE_FILTER_PASS if (on and _p1) else Control.MOUSE_FILTER_IGNORE


func _apply_problem_mode() -> void:
	if _p1:
		_problem_scroll.vertical_scroll_mode = ScrollContainer.SCROLL_MODE_AUTO
		_problem_scroll.custom_minimum_size.y = Tokens.type_line("Body", P1_STEP) * P1_PROBLEM_LINES
	else:
		_problem_scroll.vertical_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
		_problem_scroll.custom_minimum_size.y = 0
	_set_problem_interactive(_step == &"card")
	_update_problem_fade()


func _update_problem_fade(_value: float = 0.0) -> void:
	if not is_node_ready():
		return
	var bar := _problem_scroll.get_v_scroll_bar()
	_problem_fade.visible = _p1 and bar.max_value - bar.page - bar.value > 1.0


func _style_problem() -> void:
	var hc := Settings.high_contrast
	_problem_fade.texture = LearningSheet.make_fade(Tokens.HC_BG if hc else Tokens.BG)
	LearningSheet.style_scrollbar(_problem_scroll, Tokens.TEXT if hc else Tokens.OUTLINE)


# --- Settings, pause, overlays ---------------------------------------------------------------

func _on_settings_changed(_key: StringName) -> void:
	_apply_settings()


## Live: drag limit, reduce motion, high contrast, text step (P1 at 36 px).
func _apply_settings() -> void:
	var rm := Settings.reduce_motion
	var hc := Settings.high_contrast
	_card.drag_limit = Settings.drag_limit
	_card.reduce_motion = rm
	_card.high_contrast = hc
	_hud.high_contrast = hc
	_speaker.high_contrast = hc
	_footer.high_contrast = hc
	_sheet.reduce_motion = rm
	_consequence.reduce_motion = rm
	var p1 := Settings.text_step >= P1_STEP
	if p1 != _p1:
		_p1 = p1
		_speaker.setup(_speaker.speaker_name(), not _p1)
	_apply_problem_mode()
	_style_problem()
	_queue_overlay_layout()


func _on_pause_pressed() -> void:
	var a := app()
	if a:
		a.open_pause()


func _on_pause_changed(is_open: bool) -> void:
	if is_open:
		_card.cancel_gesture()


## D-145: a tap outside the card cancels a revealed half (taps on the card slot are the
## card's own). Labels and containers of this screen let taps through (mouse_filter IGNORE).
## An arrow key while the card has no focus (touch or mouse so far) focuses it and reveals.
func _unhandled_input(event: InputEvent) -> void:
	if _step != &"card":
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


## Keyboard / gamepad users get the focus (and its ring) on the card; touch and mouse users
## do not, so the card rests without the ring (T-06.1). SwipeCard draws its own ring from
## has_focus(), which does not see a hidden focus (4.7) — see .claude/notas/p005/lote-d.md.
func _focus_card() -> void:
	var a := app()
	if a and a.keyboard_navigation():
		focus_first(_card)
	elif _card.has_focus():
		_card.release_focus()


func _queue_overlay_layout() -> void:
	if _overlay_queued:
		return
	_overlay_queued = true
	_layout_overlays.call_deferred()


## Consequence and event content sit between the HUD and the footer (T-07.3, T-05).
func _layout_overlays() -> void:
	_overlay_queued = false
	if not is_inside_tree():
		return
	var top := _rect_in_self(_hud_slot).end.y + Tokens.ESP_16
	var bottom := maxf(0.0, size.y - _rect_in_self(_footer).position.y)
	_consequence.offset_top = top
	_consequence.offset_bottom = -bottom
	_event.set_area(top, bottom)


func _rect_in_self(c: Control) -> Rect2:
	return Rect2(c.global_position - global_position, c.size)


func _rm() -> bool:
	return Settings.reduce_motion


func _next_token() -> int:
	_token += 1
	return _token


func _kill(t: Tween) -> void:
	if t and t.is_valid():
		t.kill()


# --- For tests and captures ------------------------------------------------------------------

func step() -> StringName:
	return _step


func card() -> SwipeCard:
	return _card


func hud() -> Hud:
	return _hud


func sheet() -> LearningSheet:
	return _sheet


func consequence() -> ConsequenceLine:
	return _consequence


func event_notice() -> EventNotice:
	return _event


func year_card() -> YearCard:
	return _year_card


func footer() -> CardFooter:
	return _footer


func speaker() -> SpeakerView:
	return _speaker


func problem_label() -> Label:
	return _problem


func is_hud_busy() -> bool:
	return _hud_busy
