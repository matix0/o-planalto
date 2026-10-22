class_name AppMain
extends Control
## App shell — main scene (P-005, lote C).
## - Theme: ThemeBuilder.build(text_step, high_contrast), rebuilt when Settings change.
## - Background over the whole window; centered column ≤ 430 canvas units (D-171).
## - Safe area: DisplayServer.get_display_safe_area() ÷ stretch scale (Viewport
##   board, a validar no aparelho); 0 on PC and Web. Screens apply it themselves.
## - Screens: stack with fade transitions (A-22, A-27: 300 ms; Reduzir movimento: igual).
## - Overlays: toast (C-21), confirmation (C-14), pause menu (T-11).
## - Esc: modal → pause → screen → opens the pause only if the screen did not use it (D-167).
## Screen API: AppScreen (scripts/ui/app_screen.gd).

signal screen_changed(screen_id: StringName)
## The pause menu opened (true) or closed (false) — e.g. SwipeCard.cancel_gesture().
signal pause_changed(is_open: bool)

## Screen ids → scenes. Missing files fall back to the placeholder ("Em construção").
const SCREENS := {
	&"title": "res://scenes/screens/title.tscn",
	&"tutorial": "res://scenes/screens/tutorial.tscn",
	&"settings": "res://scenes/screens/settings.tscn",
	&"about": "res://scenes/screens/about.tscn",
	&"calibration": "res://scenes/screens/calibration.tscn",   # wave 2
	&"game": "res://scenes/screens/game.tscn",                 # wave 2
	&"impeachment": "res://scenes/screens/impeachment.tscn",   # wave 2 (T-09, own screen)
	&"final": "res://scenes/screens/final.tscn",               # wave 2
}
const PLACEHOLDER_SCENE := "res://scenes/screens/placeholder.tscn"
## Game state (contract API) → screen. gdd/sistemas/10_estado_partida.md §3.1.
const STATE_SCREENS := {
	&"start": &"title",
	&"calibration": &"calibration",
	&"year_intro": &"game",
	&"events": &"game",
	&"card": &"game",
	&"consequence": &"game",
	&"learning": &"game",
	&"impeachment": &"impeachment",
	&"final": &"final",
}
const SCREEN_FADE := 0.3             # A-22 / A-27 (total: half out, half in)
const FINAL_FADE := 1.0              # A-26 / D-184: to black (half) and from black (half)
const FINAL_HOLD := 0.8              # D-184: pause on black before the final screen (DP-009, a validar)
const SAVE_UNREADABLE_TEXT := "Não foi possível continuar o mandato"   # gdd 10 §5 (T-01.4)
const SAVE_FAILED_TEXT := "Não foi possível salvar automaticamente neste dispositivo."      # C-21, T-14.1
const ABANDON_TITLE := "Sair da partida"
const ABANDON_BODY_CALIBRATION := "Deseja sair do alinhamento e voltar ao menu inicial?"
const ABANDON_BODY_RUN := "Abandonar o cargo agora encerrará seu governo como Renúncia."

## Game API: the `Game` autoload by default. Tests inject a fake before add_child().
var game: Node = null
## First screen shown on _ready (tests may set &"" to start empty).
var start_screen: StringName = &"title"
## Safe-area override (left, top, right, bottom) for tests and captures; x < 0 = device.
var debug_safe_insets := Vector4(-1.0, 0.0, 0.0, 0.0)
## Test hook: these ids open the placeholder even when their scene exists (shell tests
## use a fake Game that does not implement the in-game views).
var force_placeholder: Array = []

@onready var _bg: PanelContainer = %Bg
@onready var _frame: Control = %Frame
@onready var _host: Control = %ScreenHost
@onready var _overlays: Control = %Overlays
var _black: ColorRect = null   # D-184 transition to the final screen
@onready var _toast: AppToast = %Toast
@onready var _modal: ConfirmModal = %ConfirmModal
@onready var _pause: PauseMenu = %PauseMenu

var _stack: Array[AppScreen] = []
var _queue: Array[Callable] = []
var _busy := false
var _safe := Vector4.ZERO
var _column: float = Tokens.VIEWPORT.x
var _focus_memory := {}              # AppScreen -> Control focused before a push
var _focus_before_pause: Variant     # Control focused before the pause (may be freed)
var _reopen_pause := false
var _backdrop := Tokens.BG
var _backdrop_override := false
var _keyboard_nav := false


func _ready() -> void:
	add_to_group(&"app_main")
	process_mode = Node.PROCESS_MODE_ALWAYS
	_host.process_mode = Node.PROCESS_MODE_PAUSABLE
	if game == null:
		game = get_node_or_null(^"/root/Game")
	if game and game.has_signal(&"toast_requested"):
		game.connect(&"toast_requested", _on_game_toast)
	Settings.changed.connect(_on_settings_changed)
	_apply_theme()
	resized.connect(_layout)
	_pause.resume_requested.connect(close_pause)
	_pause.settings_requested.connect(_on_pause_settings)
	_pause.abandon_requested.connect(_on_pause_abandon)
	_layout()
	if start_screen != &"":
		go_to(start_screen)


func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_GO_BACK_REQUEST and is_node_ready():
		# Android back = Esc (needs application/config/quit_on_go_back = false). On the title
		# screen, with nothing open, it leaves the game (D-185).
		if not handle_cancel() and current_id() == &"title" and not _busy:
			get_tree().quit()


func _input(event: InputEvent) -> void:
	# Keyboard or gamepad → focus rings on; click or touch → initial focus without ring.
	if (event is InputEventKey or event is InputEventJoypadButton) and event.is_pressed():
		_keyboard_nav = true
	elif (event is InputEventMouseButton or event is InputEventScreenTouch) and event.is_pressed():
		_keyboard_nav = false


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(&"ui_cancel") and handle_cancel():
		get_viewport().set_input_as_handled()


# --- Navigation ---------------------------------------------------------------

## Replaces the whole stack with `id`.
func go_to(id: StringName, params: Dictionary = {}) -> void:
	_enqueue(_do_go_to.bind(id, params))


## Shows `id` over the current screen, which waits underneath (hidden, not processing).
func push(id: StringName, params: Dictionary = {}) -> void:
	_enqueue(_do_push.bind(id, params))


## Closes the top screen and returns to the one underneath (or to the title).
func back() -> void:
	_enqueue(_do_back)


static func screen_for_state(state: StringName) -> StringName:
	return STATE_SCREENS.get(state, &"title")


func current_screen() -> AppScreen:
	return null if _stack.is_empty() else _stack.back() as AppScreen


func current_id() -> StringName:
	var s := current_screen()
	return s.screen_id if s else &""


func stack_ids() -> Array[StringName]:
	var ids: Array[StringName] = []
	for s in _stack:
		ids.append(s.screen_id)
	return ids


func is_busy() -> bool:
	return _busy


# --- Overlays -----------------------------------------------------------------

## C-21 — place: &"top" (T-01.4) or &"bottom" (over the footer, T-14.1).
func show_toast(text: String, place: StringName = &"top") -> void:
	_toast.show_message(text, place)


## C-14 — one-step confirmation; returns true when confirmed. Focus comes back on cancel.
func confirm(title: String, body: String, confirm_text: String = ConfirmModal.DEFAULT_CONFIRM, cancel_text: String = ConfirmModal.DEFAULT_CANCEL) -> bool:
	var previous: Variant = get_viewport().gui_get_focus_owner()
	_modal.hide_focus = not _keyboard_nav
	var ok: bool = await _modal.ask(title, body, confirm_text, cancel_text)
	if not ok:
		_grab_later(previous)
	return ok


## Gives the focus to a control; the ring shows only when the player is using
## the keyboard or a gamepad (Control.grab_focus(hide_focus), 4.7).
func give_focus(control: Control) -> void:
	_grab_later(control)


## True after a key or gamepad press, false after a click or a touch.
func keyboard_navigation() -> bool:
	return _keyboard_nav


## T-11 — only when the current screen allows it (calibration and game).
func open_pause() -> void:
	var s := current_screen()
	if _pause.is_open() or _modal.is_open() or s == null or not s.allows_pause():
		return
	var owner_now := get_viewport().gui_get_focus_owner()
	if owner_now and not _overlays.is_ancestor_of(owner_now):
		_focus_before_pause = owner_now
	get_tree().paused = true
	_pause.hide_focus = not _keyboard_nav
	_pause.open()
	pause_changed.emit(true)


func close_pause(restore_focus: bool = true) -> void:
	if not _pause.is_open():
		return
	_pause.close()
	get_tree().paused = false
	pause_changed.emit(false)
	if restore_focus:
		_grab_later(_focus_before_pause)


func is_paused() -> bool:
	return _pause.is_open()


## Esc / Android back. Returns true when something used the key (D-167).
func handle_cancel() -> bool:
	if _modal.is_open():
		_modal.cancel()
		return true
	if _pause.is_open():
		close_pause()        # Esc no menu = Continuar (a validar, T-11.1)
		return true
	var s := current_screen()
	if s == null:
		return false
	if _busy:
		return true          # ignore Esc during a transition
	if s.handle_cancel():
		return true
	if s.allows_pause():
		open_pause()
		return true
	return false


## Backdrop over the whole window (e.g. Tokens.CRISIS_BG in the impeachment scene, C-10).
func set_backdrop(color: Color) -> void:
	_backdrop = color
	_backdrop_override = true
	_apply_backdrop()


func reset_backdrop() -> void:
	_backdrop_override = false
	_apply_backdrop()


func column_width() -> float:
	return _column


## Recomputes the safe area and the column (also runs on every resize).
func refresh_layout() -> void:
	_layout()


## Vector4(left, top, right, bottom) in canvas units.
func safe_insets() -> Vector4:
	return _safe


func toast() -> AppToast:
	return _toast


func modal() -> ConfirmModal:
	return _modal


func pause_menu() -> PauseMenu:
	return _pause


# --- Internals ----------------------------------------------------------------

func _apply_theme() -> void:
	theme = ThemeBuilder.build(Settings.text_step, Settings.high_contrast)
	_apply_backdrop()


func _apply_backdrop() -> void:
	if _backdrop_override:
		var sb := StyleBoxFlat.new()
		sb.bg_color = _backdrop
		_bg.add_theme_stylebox_override(&"panel", sb)
	else:
		_bg.remove_theme_stylebox_override(&"panel")


func _on_settings_changed(key: StringName) -> void:
	if key == &"text_step" or key == &"high_contrast" or key == &"all":
		_apply_theme()


func _on_game_toast(kind: StringName) -> void:
	if kind == &"save_failed":
		show_toast(SAVE_FAILED_TEXT, &"bottom")


func _layout() -> void:
	_safe = _safe_insets()
	_frame.offset_left = _safe.x
	_frame.offset_right = -_safe.z
	_column = minf(maxf(0.0, size.x - _safe.x - _safe.z), Tokens.COLUMN_MAX)
	_host.offset_left = -_column * 0.5
	_host.offset_right = _column * 0.5
	for s in _stack:
		s.set_safe_area(_safe.y, _safe.w)
	_toast.set_frame(_column, _safe.y, _safe.w)
	_modal.set_frame(_column)
	_pause.set_frame(_column)


func _safe_insets() -> Vector4:
	if debug_safe_insets.x >= 0.0:
		return debug_safe_insets
	# V-026: phones in the browser too (web_android / web_ios); values a validar no aparelho.
	if not (OS.has_feature("mobile") or OS.has_feature("web_android") or OS.has_feature("web_ios")):
		return Vector4.ZERO
	var safe := DisplayServer.get_display_safe_area()
	var screen := DisplayServer.screen_get_size()
	var scale := get_viewport().get_final_transform().get_scale()   # a validar no aparelho
	if safe.size == Vector2i.ZERO or scale.x <= 0.0 or scale.y <= 0.0:
		return Vector4.ZERO
	return Vector4(
		maxf(0.0, safe.position.x / scale.x),
		maxf(0.0, safe.position.y / scale.y),
		maxf(0.0, (screen.x - safe.end.x) / scale.x),
		maxf(0.0, (screen.y - safe.end.y) / scale.y))


func _enqueue(op: Callable) -> void:
	_queue.append(op)
	if not _busy:
		_run_queue()


func _run_queue() -> void:
	_busy = true
	while not _queue.is_empty():
		var op: Callable = _queue.pop_front()
		await op.call()
	_busy = false


func _on_screen_request(id: StringName, params: Dictionary, from: AppScreen) -> void:
	if from != current_screen():
		return   # only the top screen navigates
	if id == &"back":
		back()
	elif params.get("push", false):
		push(id, params)
	else:
		go_to(id, params)


func _do_go_to(id: StringName, params: Dictionary) -> void:
	if id == &"final":
		await _do_go_to_black(id, params)
		return
	var half := _half_fade(params)
	var old := current_screen()
	if old:
		await _fade(old, 0.0, half)
	for s in _stack:
		_discard(s)
	_stack.clear()
	var screen := _make_screen(id, params)
	await _fade(screen, 1.0, half)
	screen_changed.emit(screen.screen_id)


## D-184 (doc 14 §14.10.2, A-26): the run fades to black, a pause, then the final screen
## comes out of the black. Input is blocked meanwhile (the black layer stops it).
func _do_go_to_black(id: StringName, params: Dictionary) -> void:
	var half := float(params.get("fade_time", FINAL_FADE)) * 0.5
	var black := _black_layer()
	black.modulate.a = 0.0
	black.visible = true
	await _fade(black, 1.0, half)
	for s in _stack:
		_discard(s)
	_stack.clear()
	var screen := _make_screen(id, params)
	screen.modulate.a = 1.0
	if is_inside_tree():
		await get_tree().create_timer(FINAL_HOLD).timeout
	await _fade(black, 0.0, half)
	black.visible = false
	screen_changed.emit(screen.screen_id)


func _black_layer() -> ColorRect:
	if _black == null:
		_black = ColorRect.new()
		_black.name = "ToBlack"
		_black.color = Color.BLACK
		_black.mouse_filter = Control.MOUSE_FILTER_STOP
		_black.visible = false
		_overlays.add_child(_black)
		_overlays.move_child(_black, 0)   # under the pause, the modal and the toast
		_black.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	return _black


func _do_push(id: StringName, params: Dictionary) -> void:
	var half := _half_fade(params)
	var old := current_screen()
	if old:
		var owner_now := get_viewport().gui_get_focus_owner()
		if owner_now and old.is_ancestor_of(owner_now):
			_focus_memory[old] = owner_now
		await _fade(old, 0.0, half)
		old.visible = false
		old.process_mode = Node.PROCESS_MODE_DISABLED
	var screen := _make_screen(id, params)
	await _fade(screen, 1.0, half)
	screen_changed.emit(screen.screen_id)


func _do_back() -> void:
	if _stack.size() < 2:
		await _do_go_to(&"title", {})
		return
	var half := _half_fade({})
	var top: AppScreen = _stack.pop_back()
	await _fade(top, 0.0, half)
	_discard(top)
	var prev := current_screen()
	prev.process_mode = Node.PROCESS_MODE_INHERIT
	prev.visible = true
	prev.set_safe_area(_safe.y, _safe.w)
	prev.enter({"returned": true})
	_grab_later(_focus_memory.get(prev))
	_focus_memory.erase(prev)
	await _fade(prev, 1.0, half)
	screen_changed.emit(prev.screen_id)
	if _reopen_pause:
		_reopen_pause = false
		open_pause()


func _make_screen(id: StringName, params: Dictionary) -> AppScreen:
	var screen := _instantiate(id)
	screen.screen_id = id
	screen.modulate.a = 0.0
	_host.add_child(screen)
	screen.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	screen.request.connect(_on_screen_request.bind(screen))
	_stack.append(screen)
	screen.set_safe_area(_safe.y, _safe.w)
	screen.enter(params)
	return screen


func _instantiate(id: StringName) -> AppScreen:
	var path: String = "" if force_placeholder.has(id) else SCREENS.get(id, "")
	if path == "" and not force_placeholder.has(id):
		push_warning("Main: unknown screen id '%s'" % id)
	elif path != "" and ResourceLoader.exists(path):
		var node := (load(path) as PackedScene).instantiate()
		if node is AppScreen:
			return node as AppScreen
		push_error("Main: '%s' is not an AppScreen" % path)
		node.free()
	return (load(PLACEHOLDER_SCENE) as PackedScene).instantiate() as AppScreen


func _discard(screen: AppScreen) -> void:
	_focus_memory.erase(screen)
	if screen.get_parent() == _host:
		_host.remove_child(screen)
	screen.queue_free()


func _half_fade(params: Dictionary) -> float:
	return float(params.get("fade_time", SCREEN_FADE)) * 0.5


func _fade(item: CanvasItem, to: float, time: float) -> void:
	if time <= 0.0 or not is_inside_tree():
		item.modulate.a = to
		return
	var t := create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	t.tween_property(item, "modulate:a", to, time)
	await t.finished


func _on_pause_settings() -> void:
	close_pause(false)
	_reopen_pause = true
	push(&"settings")


func _on_pause_abandon() -> void:
	_pause.set_covered(true)
	var in_calibration: bool = game != null and game.current_state() == &"calibration"
	var body := ABANDON_BODY_CALIBRATION if in_calibration else ABANDON_BODY_RUN
	_modal.hide_focus = not _keyboard_nav
	var ok: bool = await _modal.ask(ABANDON_TITLE, body, ConfirmModal.DEFAULT_CONFIRM, ConfirmModal.DEFAULT_CANCEL, false)
	if not ok:
		_pause.set_covered(false)
		return
	close_pause(false)
	if game:
		game.abandon()
	var target := screen_for_state(game.current_state() if game else &"start")
	go_to(target, {"fade_time": FINAL_FADE} if target == &"final" else {})


## Untyped on purpose: the control may have been freed meanwhile.
func _grab_later(control: Variant) -> void:
	if not is_instance_valid(control) or not (control is Control):
		return
	var hide := not _keyboard_nav
	(func() -> void:
		if is_instance_valid(control) and (control as Control).is_visible_in_tree():
			(control as Control).grab_focus(hide)
	).call_deferred()
