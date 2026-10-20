class_name SwipeCard
extends Control
## C-04/C-05/C-06/C-10 — the decision card (docs/14 §14.04; gdd/sistemas/05_cartas.md §3.4;
## wireframes C-04 to C-06, T-06, RM, Animações).
## This control fills the CardSlot and fits a 5:6 card of at most 280×336 in it.
##
## Drag (docs/14 §14.04.4, A-03): the card follows the finger and tilts up to
## 5° at the limit (pivot bottom-center); the option text of that side and the
## party border appear. Release beyond `drag_limit` × card width (0.25-0.40,
## D-146/D-158) → exits (A-06); before → back to center (A-05). A flick of
## 700 px/s confirms only once the text of that side has been shown or after
## 20-25% of travel (D-153).
## Two-step tap (D-145, D-157): the 1st tap on a half reveals that option; a
## 2nd tap on the same half confirms if ≥ 0.5 s later; the other half swaps;
## a tap outside cancels (screens call cancel_reveal() for taps outside this
## control). No time limit.
## Keyboard when focused (D-156, D-167): arrows reveal, Enter confirms, Esc
## cancels a revealed half; with nothing revealed Esc is NOT consumed, so the
## screen opens the pause menu.
## Never shows side words (D-084) nor meter hints (docs/14 §14.05).

signal option_revealed(side: int)
signal option_hidden()
## Emitted at the moment of the decision (release, 2nd tap or Enter), before
## the exit animation, so the game can resolve and save.
signal choice_confirmed(side: int)
signal exit_finished(side: int)

enum Mode { NORMAL, CALIBRATION, CRISIS }
enum State { IDLE, PRESSED, DRAGGING, RETURNING, LEAVING }
enum TextMode { NONE, DRAG, TAP, BAND }

const ARMED_ENABLED := false          # PROPOSTA P3 — off until the PO decides
const ARMED_VIBRATION_MS := 30        # P3 / A-21 (Input.vibrate_handheld; VIBRATE permission)
const OPTION_BAND_P7 := false         # PROPOSTA P7 — option in a fixed band at the top at 36 px
const OPTION_BAND_MIN_SIZE := 36      # Option font size that triggers P7
const TAP_HINT_DELAY := 4.0           # D-163: idle time "[a definir]" — a validar
const TAP_HINT_TEXT := "[dica do toque — a definir]"
const TAP_SLOP := float(Tokens.ESP_8)        # travel before a press becomes a drag (a validar)
const TAP_MAX_TRAVEL := float(Tokens.ESP_24) # a press that moved more is not a tap (a validar)
const TEXT_FADE := 0.15               # A-04
const TEXT_SLIDE := 10.0              # A-04: 8-12 px
const RETURN_TIME := 0.2              # A-05 (a validar)
const EXIT_TIME := 0.3                # A-06: 250-350 ms
const EXIT_TILT_DEG := 12.0           # A-06
const ENTER_TIME := 0.25              # A-01 (a validar)
const SHORT_FADE := 0.15              # reduce motion: fades only (RM board)
const USE_SCREEN_VELOCITY := false    # D-154: velocity × screen_velocity, to test on devices
const HALF_HIGHLIGHT_ALPHA := 0.06    # C-04: touched half +6% white (a validar)
const TITLE_DIM := 0.45               # C-04: title opacity with the option visible (a validar)
const CRISIS_MARGIN := Tokens.ESP_12  # C-10: hatched frame around the card

@export_range(0.25, 0.40, 0.01) var drag_limit: float = Tokens.DRAG_LIMIT_DEFAULT:
	set(v):
		drag_limit = clampf(v, Tokens.DRAG_LIMIT_MIN, Tokens.DRAG_LIMIT_DEFAULT)

var reduce_motion: bool = false
var high_contrast: bool = false:
	set(v):
		high_contrast = v
		if is_node_ready():
			_apply_contrast()
## Contextual tap hint after TAP_HINT_DELAY idle seconds (D-163).
var hint_enabled: bool = true:
	set(v):
		hint_enabled = v
		if is_node_ready():
			_restart_hint_timer()
## PROPOSTA P7 per instance (the gallery shows both).
var option_band: bool = OPTION_BAND_P7
## Seconds; injectable so tests can check the 0.5 s rule (D-157).
var time_source: Callable = func() -> float: return Time.get_ticks_msec() / 1000.0

var _mode: Mode = Mode.NORMAL
var _sides: Dictionary = {}           # -1 / 1 -> {text, color}
var _state: State = State.IDLE
var _press_pos := Vector2.ZERO        # in resting-card coordinates (drag offset removed)
var _press_on_card := false
var _drag_dx := 0.0
var _velocity_x := 0.0
var _last_pos := Vector2.ZERO
var _last_time := 0.0
var _revealed_side := 0               # tap / keyboard reveal
var _reveal_time := 0.0
var _text_side := 0                   # side whose text is on screen
var _text_mode: TextMode = TextMode.NONE
var _text_shown_at := 0.0
var _armed := false
var _hint_used := false
var _pointer_input := false
var _preview := Vector2.ZERO          # static drag frame: (side, fraction of the width)
var _tween: Tween
var _text_tween: Tween
var _hint_tween: Tween
var _outer_box := StyleBoxFlat.new()
var _band_box := StyleBoxFlat.new()
var _half_box := StyleBoxFlat.new()
var _pill_box := StyleBoxFlat.new()
var _option_band_box := StyleBoxFlat.new()

@onready var _fit: AspectRatioContainer = $CardFit
@onready var _card: Control = $CardFit/Card
@onready var _crisis: ColorRect = $CardFit/Card/CrisisFrame
@onready var _bg: PanelContainer = $CardFit/Card/Bg
@onready var _half: Panel = $CardFit/Card/HalfHighlight
@onready var _border_outer: Panel = $CardFit/Card/BorderOuter
@onready var _border_band: Panel = $CardFit/Card/BorderOuter/BorderBand
@onready var _face: MarginContainer = $CardFit/Card/Face
@onready var _title: Label = $CardFit/Card/Face/CardTitle
@onready var _option: Label = $CardFit/Card/OptionLabel
@onready var _hint: PanelContainer = $CardFit/Card/TapHint
@onready var _hint_label: Label = $CardFit/Card/TapHint/Row/Text
@onready var _focus_ring: Panel = $CardFit/Card/FocusRing
@onready var _band: PanelContainer = $OptionBand
@onready var _band_label: Label = $OptionBand/BandLabel
@onready var _hint_timer: Timer = $HintTimer


func _ready() -> void:
	focus_mode = Control.FOCUS_ALL
	mouse_filter = Control.MOUSE_FILTER_STOP
	_fit.ratio = Tokens.CARD_RATIO
	_card.offset_transform_enabled = true
	_card.offset_transform_pivot_ratio = Vector2(0.5, 1.0)
	_option.offset_transform_enabled = true
	_option.accessibility_live = AccessibilityServer.LIVE_POLITE
	_band_label.accessibility_live = AccessibilityServer.LIVE_POLITE
	_hint.accessibility_live = AccessibilityServer.LIVE_POLITE
	_hint_label.text = TAP_HINT_TEXT
	_hint_label.add_theme_color_override(&"font_color", Tokens.TEXT)
	_build_styles()
	_apply_contrast()
	_hint_timer.one_shot = true
	_hint_timer.timeout.connect(_on_hint_timeout)
	focus_entered.connect(_on_focus_entered)
	focus_exited.connect(_update_focus_ring)
	resized.connect(_layout_fit)
	_crisis.resized.connect(_update_crisis_size)
	_layout_fit()
	reset()


## view: {title, sides: {-1: {text, color}, 1: {text, color}}, mode, problem}
## color = Tokens.PARTY key; mode: &"normal" | &"calibration" (white filete
## only, D-166) | &"crisis" (hatched frame, C-10).
func setup(view: Dictionary) -> void:
	_title.text = String(view.get("title", ""))
	_sides = {}
	var sides: Dictionary = view.get("sides", {})
	for key in sides:
		var side := int(str(key))
		if side == -1 or side == 1:
			_sides[side] = sides[key]
	match StringName(view.get("mode", &"normal")):
		&"calibration":
			_mode = Mode.CALIBRATION
		&"crisis":
			_mode = Mode.CRISIS
		_:
			_mode = Mode.NORMAL
	_bg.theme_type_variation = &"CardCrisis" if _mode == Mode.CRISIS else &"Card"
	accessibility_name = "Carta: %s" % _title.text
	accessibility_description = String(view.get("problem", ""))
	reset()


## Back to rest: centered, no text, no border; hint timer restarted.
func reset() -> void:
	_kill_all()
	_state = State.IDLE
	_revealed_side = 0
	_text_side = 0
	_text_mode = TextMode.NONE
	_drag_dx = 0.0
	_armed = false
	_hint_used = false
	_preview = Vector2.ZERO
	_card.visible = true
	_card.modulate.a = 1.0
	_card.offset_transform_position = Vector2.ZERO
	_card.offset_transform_rotation = 0.0
	_option.visible = false
	_option.modulate.a = 0.0
	_option.offset_transform_position = Vector2.ZERO
	_band.visible = false
	_band.modulate.a = 0.0
	_border_outer.visible = false
	_half.visible = false
	_face.modulate.a = 1.0
	_hint.visible = false
	_crisis.visible = _mode == Mode.CRISIS
	_apply_border("")
	_update_focus_ring()
	_restart_hint_timer()


## A-01: entry of a new card (a validar). Reduce motion: fade only.
func play_enter() -> void:
	_kill(_tween)
	_card.modulate.a = 0.0
	_tween = create_tween()
	if reduce_motion:
		_tween.tween_property(_card, "modulate:a", 1.0, SHORT_FADE)
		return
	_card.offset_transform_position = Vector2(0, Tokens.ESP_16)
	_tween.set_parallel(true)
	_tween.tween_property(_card, "modulate:a", 1.0, ENTER_TIME) \
		.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	_tween.tween_property(_card, "offset_transform_position", Vector2.ZERO, ENTER_TIME) \
		.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)


## Hides a tap/keyboard reveal. Returns true if something was revealed.
## Screens call it for taps outside this control (D-145: tocar fora cancela).
func cancel_reveal() -> bool:
	if _revealed_side == 0 or _state != State.IDLE:
		return false
	_revealed_side = 0
	_hide_option()
	_restart_hint_timer()
	return true


## Drops a gesture in progress (finger still down) and sends the card back:
## pause opened mid-drag, app sent to the background, window lost focus.
func cancel_gesture() -> void:
	if _state == State.PRESSED:
		_state = State.IDLE
		_restart_hint_timer()
	elif _state == State.DRAGGING:
		_return_to_center()


func is_revealed() -> bool:
	return _revealed_side != 0


func revealed_side() -> int:
	return _revealed_side


func is_leaving() -> bool:
	return _state == State.LEAVING


## Resting card rect in this control's local coordinates.
func card_rect() -> Rect2:
	return Rect2(_fit.position + _card.position, _card.size)


func card_width() -> float:
	return maxf(_card.size.x, 1.0)


## Static frame (gallery, screenshots): card held at `fraction` of its width
## (kept on resize until the next press or reset()).
func preview_drag(side: int, fraction: float) -> void:
	_kill_all()
	_state = State.IDLE
	_revealed_side = 0
	_hint_timer.stop()
	_hide_hint(false)
	_preview = Vector2(side, fraction)
	if _card.size.x > 1.0:
		_set_drag(_preview.x * _preview.y * card_width(), false)


## Static frame: option revealed by a 1st tap on that half.
func preview_tap(side: int) -> void:
	_kill_all()
	_preview = Vector2.ZERO
	_reveal(side, _now(), false)


## Static frame: contextual tap hint (D-163).
func preview_hint() -> void:
	_hint_timer.stop()
	_show_hint(false)


# --- Input -------------------------------------------------------------------

func _notification(what: int) -> void:
	if not is_node_ready() or not is_inside_tree():
		return
	if what in [NOTIFICATION_APPLICATION_FOCUS_OUT, NOTIFICATION_APPLICATION_PAUSED, NOTIFICATION_WM_WINDOW_FOCUS_OUT]:
		cancel_gesture()
	elif what == NOTIFICATION_VISIBILITY_CHANGED and not is_visible_in_tree():
		cancel_gesture()


func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton or event is InputEventMouseMotion:
		if event is InputEventMouseButton:
			_pointer_input = true
			_update_focus_ring()
		if handle_pointer(event):
			accept_event()
	elif event is InputEventKey or event is InputEventJoypadButton or event is InputEventAction:
		_pointer_input = false
		_update_focus_ring()
		if handle_key(event):
			accept_event()


## Pointer (mouse; touch arrives as mouse through "emulate mouse from touch").
## Positions are local to this control. Returns true when the event was used.
func handle_pointer(event: InputEvent) -> bool:
	if _state == State.LEAVING:
		return true
	var button := event as InputEventMouseButton
	if button and button.button_index == MOUSE_BUTTON_LEFT:
		if button.pressed:
			_on_press(button.position)
		else:
			_on_release(button.position)
		return true
	var motion := event as InputEventMouseMotion
	if motion and (_state == State.PRESSED or _state == State.DRAGGING):
		_on_motion(motion)
		return true
	return false


## Keyboard (PC, D-156/D-167). Returns true when consumed.
func handle_key(event: InputEvent) -> bool:
	if _state != State.IDLE or not event.is_pressed() or event.is_echo():
		return false
	if event.is_action(&"ui_left"):
		_reveal(-1, _now(), true)
		return true
	if event.is_action(&"ui_right"):
		_reveal(1, _now(), true)
		return true
	if event.is_action(&"ui_accept"):
		if _revealed_side != 0:
			_confirm(_revealed_side)
			return true
		return false
	if event.is_action(&"ui_cancel"):
		return cancel_reveal()
	return false


func _on_press(pos: Vector2) -> void:
	if _state == State.RETURNING:
		# Catch the card on its way back; presses elsewhere are ignored.
		var offset := _card.offset_transform_position.x
		if not card_rect().has_point(pos - Vector2(offset, 0.0)):
			return
		_kill(_tween)
		_drag_dx = offset
	_preview = Vector2.ZERO
	_hint_timer.stop()
	_hide_hint(true)
	_press_pos = pos - Vector2(_drag_dx, 0.0)
	_press_on_card = card_rect().has_point(_press_pos)
	_last_pos = pos
	_last_time = _now()
	_velocity_x = 0.0
	_state = State.PRESSED if is_zero_approx(_drag_dx) else State.DRAGGING


func _on_motion(event: InputEventMouseMotion) -> void:
	var t := _now()
	var v := event.screen_velocity.x if USE_SCREEN_VELOCITY else event.velocity.x
	if is_zero_approx(v) and t > _last_time:
		v = (event.position.x - _last_pos.x) / (t - _last_time)
	_velocity_x = v
	_last_pos = event.position
	_last_time = t
	var dx := event.position.x - _press_pos.x
	if _state == State.PRESSED and _press_on_card and absf(dx) > TAP_SLOP:
		_state = State.DRAGGING
		_revealed_side = 0
	if _state == State.DRAGGING:
		_set_drag(dx, true)


func _on_release(pos: Vector2) -> void:
	var t := _now()
	if _state == State.DRAGGING:
		var side := _side_of(_drag_dx)
		var w := card_width()
		var beyond := absf(_drag_dx) >= drag_limit * w
		var flick := absf(_velocity_x) >= Tokens.FLICK_SPEED and signf(_velocity_x) == signf(_drag_dx)
		var text_read := _text_side == side and t - _text_shown_at >= TEXT_FADE
		var lock_ok := absf(_drag_dx) >= Tokens.FLICK_LOCK * w or text_read
		if side != 0 and (beyond or (flick and lock_ok)):
			_confirm(side)
		else:
			_return_to_center()
		return
	if _state != State.PRESSED:
		return
	_state = State.IDLE
	if pos.distance_to(_press_pos) > TAP_MAX_TRAVEL:
		_restart_hint_timer()
		return
	if not _press_on_card:
		if not cancel_reveal():
			_restart_hint_timer()
		return
	var half := -1 if _press_pos.x < card_rect().get_center().x else 1
	if _revealed_side == half:
		if t - _reveal_time >= Tokens.TAP_CONFIRM_DELAY:
			_confirm(half)
		return
	_reveal(half, t, true)


# --- States ------------------------------------------------------------------

func _set_drag(dx: float, animated: bool) -> void:
	_drag_dx = dx
	var limit := drag_limit * card_width()
	_card.offset_transform_position = Vector2(dx, 0.0)
	var tilt := 0.0 if reduce_motion else deg_to_rad(Tokens.TILT_DEG_AT_LIMIT)
	_card.offset_transform_rotation = tilt * clampf(dx / limit, -1.0, 1.0)
	var side := _side_of(dx)
	if side == 0:
		_hide_option()
	else:
		_show_option(side, false, animated)
	_set_armed(side != 0 and absf(dx) >= limit)


func _reveal(side: int, t: float, animated: bool) -> void:
	_revealed_side = side
	_reveal_time = t
	_hint_timer.stop()
	_hide_hint(animated)
	_show_option(side, true, animated)


func _confirm(side: int) -> void:
	_finish(_text_tween)
	_kill(_tween)
	_kill(_hint_tween)
	_state = State.LEAVING
	_revealed_side = 0
	_hint_timer.stop()
	_hint.visible = false
	if _text_side != side:
		_show_option(side, _is_centered(), false)
	_update_focus_ring()
	_tween = create_tween()
	if _band.visible:
		_tween.tween_property(_band, "modulate:a", 0.0, SHORT_FADE)
		_tween.set_parallel(true)
	if reduce_motion:
		_tween.tween_property(_card, "modulate:a", 0.0, SHORT_FADE)
	else:
		var screen_w := get_viewport_rect().size.x if is_inside_tree() else float(Tokens.VIEWPORT.x)
		var target := side * (screen_w + card_width())
		_tween.set_parallel(true)
		_tween.tween_property(_card, "offset_transform_position:x", target, EXIT_TIME) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN)
		_tween.tween_property(_card, "offset_transform_rotation", deg_to_rad(EXIT_TILT_DEG) * side, EXIT_TIME) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN)
		_tween.chain().tween_property(_card, "modulate:a", 0.0, 0.05)
	_tween.chain().tween_callback(_on_exit_done.bind(side))
	# Last, so a listener may reset() / setup() the next card right away.
	choice_confirmed.emit(side)


func _on_exit_done(side: int) -> void:
	_card.visible = false
	_band.visible = false
	exit_finished.emit(side)


func _return_to_center() -> void:
	_state = State.RETURNING
	_set_armed(false)
	_hide_option()
	_kill(_tween)
	if reduce_motion:
		_card.offset_transform_position = Vector2.ZERO
		_card.offset_transform_rotation = 0.0
		_after_return()
		return
	_tween = create_tween().set_parallel(true)
	_tween.tween_property(_card, "offset_transform_position", Vector2.ZERO, RETURN_TIME) \
		.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	_tween.tween_property(_card, "offset_transform_rotation", 0.0, RETURN_TIME) \
		.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	_tween.chain().tween_callback(_after_return)


func _after_return() -> void:
	_drag_dx = 0.0
	_state = State.IDLE
	_restart_hint_timer()


## Shows the option of `side`: dragging → label in the half facing the screen
## center (54%, inset 24) or the P7 band; tap → full width, centered, touched
## half highlighted. Swapping sides: the old text fades out first (C-06).
func _show_option(side: int, centered: bool, animated: bool) -> void:
	var data: Dictionary = _sides.get(side, {})
	var mode := TextMode.TAP if centered else (TextMode.BAND if _band_active() else TextMode.DRAG)
	_apply_border(String(data.get("color", "")))
	_border_outer.visible = true
	_set_half(side if centered else 0)
	if side == _text_side and mode == _text_mode:
		return
	var swapping := _text_side != 0
	_text_side = side
	_text_mode = mode
	_finish(_text_tween)
	var text := String(data.get("text", ""))
	var now := _now()
	if not animated:
		_place_text(side, mode, text, false)
		_text_holder(mode).modulate.a = 1.0
		_face.modulate.a = TITLE_DIM
		_text_shown_at = now - TEXT_FADE
		option_revealed.emit(side)
		return
	_text_tween = create_tween()
	if swapping:
		var gap := TEXT_FADE * 0.5
		_text_tween.set_parallel(true)
		for holder: Control in [_option, _band]:
			if holder.visible:
				_text_tween.tween_property(holder, "modulate:a", 0.0, gap)
		_text_tween.tween_interval(gap)
		_text_tween.chain()
		_text_tween.set_parallel(false)
		_text_tween.tween_callback(_place_text.bind(side, mode, text, true))
		_text_shown_at = now + gap
	else:
		_place_text(side, mode, text, true)
		_text_shown_at = now
	var holder := _text_holder(mode)
	_text_tween.tween_property(holder, "modulate:a", 1.0, TEXT_FADE) \
		.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	_text_tween.parallel().tween_property(_face, "modulate:a", TITLE_DIM, TEXT_FADE)
	if holder == _option and not reduce_motion:
		_text_tween.parallel().tween_property(_option, "offset_transform_position", Vector2.ZERO, TEXT_FADE) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	option_revealed.emit(side)


func _hide_option() -> void:
	_border_outer.visible = false
	_set_half(0)
	if _text_side == 0:
		return
	_text_side = 0
	_text_mode = TextMode.NONE
	_finish(_text_tween)
	_text_tween = create_tween().set_parallel(true)
	for holder: Control in [_option, _band]:
		if holder.visible:
			_text_tween.tween_property(holder, "modulate:a", 0.0, TEXT_FADE)
	_text_tween.tween_property(_face, "modulate:a", 1.0, TEXT_FADE)
	_text_tween.chain().tween_callback(_hide_text_nodes)
	option_hidden.emit()


func _hide_text_nodes() -> void:
	if _text_side == 0:
		_option.visible = false
		_band.visible = false


func _text_holder(mode: TextMode) -> Control:
	return _band if mode == TextMode.BAND else _option


## Sets the text and layout of the label for `mode`; starts it transparent
## (and 10 px lower) when it is about to fade in.
func _place_text(side: int, mode: TextMode, text: String, fading_in: bool) -> void:
	if mode == TextMode.BAND:
		_option.visible = false
		_band_label.text = text
		_band.visible = true
		if fading_in:
			_band.modulate.a = 0.0
		return
	_band.visible = false
	_option.text = text
	_layout_option(side, mode == TextMode.TAP)
	_option.visible = true
	if fading_in:
		_option.modulate.a = 0.0
		_option.offset_transform_position = Vector2(0, 0 if reduce_motion else TEXT_SLIDE)
	else:
		_option.offset_transform_position = Vector2.ZERO


## Dragging: label in the half facing the screen center (54% wide, inset
## esp-24). Tap: full width, centered (card at rest).
func _layout_option(side: int, centered: bool) -> void:
	var inset := float(Tokens.ESP_24)
	_option.anchor_top = 0.0
	_option.anchor_bottom = 0.0
	_option.offset_top = inset
	_option.offset_bottom = inset
	if centered:
		_option.anchor_left = 0.0
		_option.anchor_right = 1.0
		_option.offset_left = inset
		_option.offset_right = -inset
		_option.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	elif side > 0:
		_option.anchor_left = 0.0
		_option.anchor_right = Tokens.OPTION_WIDTH_RATIO
		_option.offset_left = inset
		_option.offset_right = inset
		_option.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
	else:
		_option.anchor_left = 1.0 - Tokens.OPTION_WIDTH_RATIO
		_option.anchor_right = 1.0
		_option.offset_left = -inset
		_option.offset_right = -inset
		_option.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT


## C-04: touched half +6% white, rounded on the card's outer corners.
func _set_half(side: int) -> void:
	_half.visible = side != 0
	if side == 0:
		return
	var r := Tokens.RADIUS_16
	_half_box.corner_radius_top_left = r if side < 0 else 0
	_half_box.corner_radius_bottom_left = r if side < 0 else 0
	_half_box.corner_radius_top_right = r if side > 0 else 0
	_half_box.corner_radius_bottom_right = r if side > 0 else 0
	_half.anchor_left = 0.0 if side < 0 else 0.5
	_half.anchor_right = 0.5 if side < 0 else 1.0
	_half.anchor_top = 0.0
	_half.anchor_bottom = 1.0
	_half.offset_left = 0.0
	_half.offset_right = 0.0
	_half.offset_top = 0.0
	_half.offset_bottom = 0.0


## C-05: white 2 / party 8 / white 2 (P3 armed: 2 / 12 / 2); calibration:
## white 2 only (D-166).
func _apply_border(color_key: String) -> void:
	if _mode == Mode.CALIBRATION:
		_outer_box.set_border_width_all(Tokens.BORDER_FILETE)
		_border_band.visible = false
		return
	var band := Tokens.BORDER_ARMED_BAND if _armed else Tokens.BORDER_BAND
	_outer_box.set_border_width_all(Tokens.BORDER_FILETE * 2 + band)
	_band_box.set_border_width_all(band)
	_band_box.border_color = Tokens.PARTY.get(color_key, Tokens.TEXT)
	_border_band.visible = true


func _set_armed(on: bool) -> void:
	if not ARMED_ENABLED or on == _armed:
		return
	_armed = on
	if _text_side != 0:
		_apply_border(String(_sides.get(_text_side, {}).get("color", "")))
	if on and not reduce_motion and OS.has_feature("mobile"):
		Input.vibrate_handheld(ARMED_VIBRATION_MS)


func _band_active() -> bool:
	return option_band and _option.get_theme_font_size(&"font_size") >= OPTION_BAND_MIN_SIZE


func _restart_hint_timer() -> void:
	if not is_inside_tree():
		return
	_hint_timer.stop()
	if not hint_enabled:
		_hide_hint(false)
		return
	if not _hint_used and _state == State.IDLE and _revealed_side == 0:
		_hint_timer.start(TAP_HINT_DELAY)


func _on_hint_timeout() -> void:
	if hint_enabled and _state == State.IDLE and _revealed_side == 0 and not _hint_used:
		_show_hint(true)


## A-02: fade in 150 ms; leaves on the 1st gesture.
func _show_hint(animated: bool) -> void:
	_hint_used = true
	_hint.visible = true
	_kill(_hint_tween)
	if animated:
		_hint.modulate.a = 0.0
		_hint_tween = create_tween()
		_hint_tween.tween_property(_hint, "modulate:a", 1.0, SHORT_FADE) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	else:
		_hint.modulate.a = 1.0


func _hide_hint(animated: bool) -> void:
	if not _hint.visible:
		return
	_kill(_hint_tween)
	if not animated:
		_hint.visible = false
		return
	_hint_tween = create_tween()
	_hint_tween.tween_property(_hint, "modulate:a", 0.0, SHORT_FADE)
	_hint_tween.tween_callback(_hint.hide)


func _is_centered() -> bool:
	return is_zero_approx(_card.offset_transform_position.x)


## The ring is for keyboard focus only (Tab, arrows), not for a tap.
func _on_focus_entered() -> void:
	_pointer_input = Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)
	_update_focus_ring()


func _update_focus_ring() -> void:
	if _focus_ring:
		_focus_ring.visible = has_focus() and not _pointer_input and _state != State.LEAVING


func _layout_fit() -> void:
	if _fit == null:
		return
	var h := minf(Tokens.CARD_MAX.y, size.y)
	var w := h * Tokens.CARD_RATIO
	if w > size.x:
		w = size.x
		h = w / Tokens.CARD_RATIO
	_fit.size = Vector2(w, h)
	_fit.position = ((size - _fit.size) * 0.5).round()
	if _preview.x != 0.0 and w > 1.0 and _state == State.IDLE:
		_card.size = Vector2(w, h)
		_set_drag(_preview.x * _preview.y * w, false)


func _update_crisis_size() -> void:
	var mat := _crisis.material as ShaderMaterial
	if mat:
		mat.set_shader_parameter(&"rect_size", _crisis.size)
		mat.set_shader_parameter(&"radius", float(Tokens.RADIUS_16 + CRISIS_MARGIN))


func _build_styles() -> void:
	_outer_box.draw_center = false
	_outer_box.border_color = Tokens.TEXT
	_outer_box.set_corner_radius_all(Tokens.RADIUS_16)
	_outer_box.anti_aliasing = true
	_border_outer.add_theme_stylebox_override(&"panel", _outer_box)
	_band_box.draw_center = false
	_band_box.set_corner_radius_all(Tokens.RADIUS_16 - Tokens.BORDER_FILETE)
	_band_box.anti_aliasing = true
	_border_band.add_theme_stylebox_override(&"panel", _band_box)
	_half_box.bg_color = Color(Tokens.TEXT, HALF_HIGHLIGHT_ALPHA)
	_half.add_theme_stylebox_override(&"panel", _half_box)
	var ring := StyleBoxFlat.new()
	ring.draw_center = false
	ring.set_border_width_all(Tokens.FOCUS_RING)
	ring.border_color = Tokens.TEXT
	ring.set_corner_radius_all(Tokens.RADIUS_16 + Tokens.FOCUS_OFFSET)
	ring.set_expand_margin_all(Tokens.FOCUS_OFFSET)
	ring.anti_aliasing = true
	_focus_ring.add_theme_stylebox_override(&"panel", ring)
	_pill_box.set_border_width_all(1)
	_pill_box.set_corner_radius_all(Tokens.RADIUS_PILL)
	_pill_box.content_margin_left = Tokens.ESP_12
	_pill_box.content_margin_right = Tokens.ESP_12
	_pill_box.content_margin_top = Tokens.ESP_8
	_pill_box.content_margin_bottom = Tokens.ESP_8
	_pill_box.anti_aliasing = true
	_hint.add_theme_stylebox_override(&"panel", _pill_box)
	_option_band_box.set_border_width_all(Tokens.BORDER_FILETE)
	_option_band_box.border_color = Tokens.TEXT
	_option_band_box.set_corner_radius_all(Tokens.RADIUS_12)
	_option_band_box.content_margin_left = Tokens.ESP_16
	_option_band_box.content_margin_right = Tokens.ESP_16
	_option_band_box.content_margin_top = Tokens.ESP_12
	_option_band_box.content_margin_bottom = Tokens.ESP_12
	_option_band_box.anti_aliasing = true
	_band.add_theme_stylebox_override(&"panel", _option_band_box)


func _apply_contrast() -> void:
	var bg := Tokens.HC_BG if high_contrast else Tokens.BG
	_pill_box.bg_color = bg
	_pill_box.border_color = Tokens.TEXT if high_contrast else Tokens.OUTLINE
	_option_band_box.bg_color = bg


func _side_of(dx: float) -> int:
	if dx > 0.0:
		return 1
	if dx < 0.0:
		return -1
	return 0


func _now() -> float:
	return float(time_source.call())


func _kill(t: Tween) -> void:
	if t and t.is_valid():
		t.kill()


## Jumps a tween to its end state (runs its callbacks), then drops it.
func _finish(t: Tween) -> void:
	if t and t.is_valid():
		t.custom_step(60.0)
		t.kill()


func _kill_all() -> void:
	for t: Tween in [_tween, _text_tween, _hint_tween]:
		_kill(t)
