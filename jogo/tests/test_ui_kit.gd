extends SceneTree
## Headless checks of the game UI kit (P-005, Lote B): MeterIcon, Hud,
## SpeakerView, SwipeCard (drag limit, flick lock, two-step tap, keyboard),
## CardFooter, and no side words / no meter numbers in what is shown.
## godot --headless --path jogo -s res://tests/test_ui_kit.gd

const SIDE_WORDS: Array[String] = ["esquerda", "direita", "◀", "▶", "←", "→", "⬅", "➡"]
const START := {
	"dignity": 45, "awareness": 40, "sovereignty": 40, "security": 50,
	"integrity": 40, "treasury": 55, "political_capital": 50, "legitimacy": 55,
}
const VIEW := {
	"title": "Privatização da estatal",
	"problem": "O Congresso analisa um projeto de privatização da estatal de energia.",
	"sides": {
		-1: {"text": "Nomear relator adversário", "color": "red"},
		1: {"text": "Aceitar as mudanças", "color": "orange"},
	},
}

var _failures: PackedStringArray = []
var _clock := 100.0
var _events: PackedStringArray = []


func _initialize() -> void:
	_run.call_deferred()


func _run() -> void:
	var host := Control.new()
	host.size = Vector2(Tokens.VIEWPORT)
	host.theme = ThemeBuilder.build()
	root.add_child(host)
	await _test_meters(host)
	await _test_hud(host)
	_test_speaker(host)
	await _test_card(host)
	await _test_footer(host)
	host.queue_free()
	if _failures.is_empty():
		print("test_ui_kit: OK")
		quit(0)
	else:
		for f in _failures:
			printerr("FAIL: " + f)
		quit(1)


# --- MeterIcon -----------------------------------------------------------------

func _test_meters(host: Control) -> void:
	var meter: MeterIcon = load("res://scenes/components/meter_icon.tscn").instantiate()
	meter.meter_id = "dignity"
	host.add_child(meter)
	meter.set_value(45)
	_expect(meter.accessibility_name == "Dignidade, faixa 3 de 5", "meter a11y name: %s" % meter.accessibility_name)
	_expect(meter.band() == 3, "band of 45 is 3")
	var number: Label = meter.get_node("Number")
	_expect(not number.visible, "no number during the game")
	var regex := RegEx.create_from_string("^[^0-9]+, faixa [1-5] de 5$")
	for id: String in Hud.ORDER:
		meter.meter_id = id
		for v in [0, 20, 21, 55, 100]:
			meter.set_value(v)
			_expect(regex.search(meter.accessibility_name) != null, "a11y name without number: %s" % meter.accessibility_name)
			_expect(meter.accessibility_name.begins_with(String(Tokens.METER_NAMES[id])), "a11y name of %s" % id)
	meter.meter_id = "sovereignty"
	meter.set_value(0)
	_expect(meter.get_node("Well/Broken").visible, "broken icon at 0")
	var trail: TextureRect = meter.get_node("Well/Trail")
	meter.show_state(43, 40, &"small")
	_expect(trail.visible and trail.size.y >= Tokens.ESP_2, "trail ≥ 2 px for ±3 (D-161)")
	meter.show_state(41, 64, &"big")
	_expect(is_equal_approx(trail.size.y, 23 * MeterIcon.PX_PER_POINT), "trail height for 64 → 41")
	var dot: EffectDot = meter.get_node("DotSlot/EffectDot")
	_expect(dot.kind == EffectDot.Kind.BIG and dot.modulate.a > 0.9, "big dot shown")
	meter.show_number = true
	_expect(number.visible, "number variant (T-10 only)")
	meter.show_number = false
	# Animated change, reduce motion and normal.
	for rm in [true, false]:
		meter.set_value(40)
		meter.animate_change(40, 43, &"small", rm)
		_expect(await _wait(meter.animation_finished, 3.0), "meter animation finishes (rm=%s)" % rm)
		_expect(meter.value == 43 and is_equal_approx(meter.get_node("Well").value, 43.0), "meter filled to 43")
		_expect(meter.accessibility_name == "Soberania, faixa 3 de 5", "band change announced: %s" % meter.accessibility_name)
	meter.animate_change(6, 0, &"big", true)
	_expect(await _wait(meter.animation_finished, 3.0), "meter reaches 0")
	_expect(meter.get_node("Well/Broken").visible, "shatter shows the broken icon")
	meter.queue_free()


# --- Hud -----------------------------------------------------------------------

func _test_hud(host: Control) -> void:
	var hud: Hud = load("res://scenes/components/hud.tscn").instantiate()
	host.add_child(hud)
	await process_frame
	var ids: PackedStringArray = []
	for m in hud.meters():
		ids.append(m.meter_id)
	_expect(ids == PackedStringArray(Hud.ORDER), "8 meters in GDD order: %s" % ", ".join(ids))
	_expect(hud.get_combined_minimum_size() == Tokens.HUD_SIZE, "HUD is 336×52, got %s" % hud.get_combined_minimum_size())
	hud.set_values(START)
	_expect(hud.values() == START, "set_values")
	hud.apply_changes([
		{"id": "sovereignty", "old": 40, "new": 43},
		{"id": "political_capital", "delta": -3},
	], true)
	_expect(await _wait(hud.changes_finished, 3.0), "changes_finished after the timeline")
	_expect(hud.values().sovereignty == 43 and hud.values().political_capital == 47, "values after changes")
	hud.apply_changes([])
	_expect(await _wait(hud.changes_finished, 1.0), "changes_finished with no change")
	hud.high_contrast = true
	_expect(hud.meter("dignity").high_contrast, "high contrast reaches the meters")
	_check_no_side_words(hud, "hud")
	hud.queue_free()


# --- SpeakerView ---------------------------------------------------------------

func _test_speaker(host: Control) -> void:
	var speaker: SpeakerView = load("res://scenes/components/speaker_view.tscn").instantiate()
	host.add_child(speaker)
	speaker.setup("Congresso")
	_expect(speaker.speaker_name() == "Congresso", "speaker name")
	_expect(speaker.get_node("Portrait").visible, "portrait shown")
	speaker.setup("  ", false)
	_expect(speaker.speaker_name() == SpeakerView.UNKNOWN, "empty quem_fala → [a definir]")
	_expect(not speaker.get_node("Portrait").visible, "portrait hidden (P1)")
	speaker.high_contrast = true
	_expect(speaker.get_node("Portrait").texture != null, "high contrast portrait")
	speaker.queue_free()


# --- SwipeCard -----------------------------------------------------------------

func _test_card(host: Control) -> void:
	var slot := Control.new()
	slot.size = Vector2(390, 400)
	host.add_child(slot)
	var card: SwipeCard = load("res://scenes/components/swipe_card.tscn").instantiate()
	slot.add_child(card)
	card.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	card.time_source = func() -> float: return _clock
	card.reduce_motion = true
	card.hint_enabled = false
	card.setup(VIEW)
	card.option_revealed.connect(func(side: int) -> void: _events.append("reveal:%d" % side))
	card.option_hidden.connect(func() -> void: _events.append("hidden"))
	card.choice_confirmed.connect(func(side: int) -> void: _events.append("confirm:%d" % side))
	await process_frame
	await process_frame

	var rect := card.card_rect()
	_expect(rect.size.is_equal_approx(Tokens.CARD_MAX), "card fits 280×336, got %s" % rect.size)
	_expect(rect.position.is_equal_approx(Vector2(55, 32)), "card centered in the slot, got %s" % rect.position)
	_expect(card.accessibility_name == "Carta: Privatização da estatal", "card a11y name")
	var option: Label = card.get_node("CardFit/Card/OptionLabel")
	_expect(option.accessibility_live == AccessibilityServer.LIVE_POLITE, "option label is a polite live region")
	var c := rect.get_center()
	var w := rect.size.x

	# Drag below the limit → back to center; beyond → confirms.
	_drag(card, c, [c + Vector2(0.30 * w, 0)])
	_expect_events(["reveal:1", "hidden"], "release below the limit returns")
	_expect(not card.is_leaving() and card.get_node("CardFit/Card").offset_transform_position == Vector2.ZERO, "card back at center")
	_drag(card, c, [c + Vector2(0.42 * w, 0)])
	_expect_events(["reveal:1", "confirm:1"], "release beyond the limit confirms (+1)")
	card.reset()
	_drag(card, c, [c - Vector2(0.20 * w, 0), c - Vector2(0.42 * w, 0)])
	_expect_events(["reveal:-1", "confirm:-1"], "release beyond the limit confirms (-1)")
	card.reset()

	# Adjustable limit 25-40% (D-158).
	card.drag_limit = 0.1
	_expect(is_equal_approx(card.drag_limit, 0.25), "drag limit clamped to 0.25")
	card.drag_limit = 0.9
	_expect(is_equal_approx(card.drag_limit, 0.40), "drag limit clamped to 0.40")
	card.drag_limit = 0.25
	_drag(card, c, [c + Vector2(0.27 * w, 0)])
	_expect_events(["reveal:1", "confirm:1"], "limit 25% confirms at 27%")
	card.reset()
	card.drag_limit = 0.40

	# Flick (D-146, D-153): only after the lock or once the text was shown.
	_drag(card, c, [c + Vector2(12, 0)], 900.0)
	_expect_events(["reveal:1", "hidden"], "flick before the lock does not confirm")
	_drag(card, c, [c + Vector2(0.25 * w, 0)], 900.0)
	_expect_events(["reveal:1", "confirm:1"], "flick after 25% travel confirms")
	card.reset()
	_press(card, c)
	_move(card, c + Vector2(20, 0))
	_clock += 0.2
	_move(card, c + Vector2(30, 0), 900.0)
	_release(card, c + Vector2(30, 0))
	_expect_events(["reveal:1", "confirm:1"], "flick after the text was shown confirms")
	card.reset()
	_drag(card, c, [c + Vector2(0.25 * w, 0)], -900.0)
	_expect_events(["reveal:1", "hidden"], "flick against the drag does not confirm")
	_drag(card, c, [c + Vector2(0.25 * w, 0)], 500.0)
	_expect_events(["reveal:1", "hidden"], "slow release below the limit does not confirm")

	# Two-step tap (D-145, D-157).
	var right := c + Vector2(60, 40)
	var left := c + Vector2(-60, 40)
	_tap(card, right)
	_expect_events(["reveal:1"], "1st tap reveals the touched half")
	_expect(card.revealed_side() == 1 and option.horizontal_alignment == HORIZONTAL_ALIGNMENT_CENTER, "tap: centered full-width text")
	_clock += 0.3
	_tap(card, right)
	_expect_events([], "2nd tap before 0.5 s is ignored")
	_clock += 0.3
	_tap(card, right)
	_expect_events(["confirm:1"], "2nd tap on the same half after 0.5 s confirms")
	card.reset()
	_tap(card, right)
	_clock += 1.0
	_tap(card, left)
	_expect_events(["reveal:1", "reveal:-1"], "tap on the other half swaps")
	_expect(card.revealed_side() == -1, "revealed side swapped")
	_clock += 0.2
	_tap(card, left)
	_expect_events([], "swap restarts the 0.5 s")
	_clock += 0.4
	_tap(card, left)
	_expect_events(["confirm:-1"], "confirm after the swap")
	card.reset()
	_tap(card, right)
	_tap(card, Vector2(8, 8))
	_expect_events(["reveal:1", "hidden"], "tap outside the card cancels")
	_expect(not card.is_revealed(), "nothing revealed after cancel")
	_tap(card, left)
	_expect(card.cancel_reveal() and not card.cancel_reveal(), "cancel_reveal() for taps outside the control")
	_expect_events(["reveal:-1", "hidden"], "public cancel")
	_press(card, right)
	_move(card, right + Vector2(0, 60))
	_release(card, right + Vector2(0, 60))
	_expect_events([], "vertical swipe is not a tap")
	_tap(card, right)
	_drag(card, c, [c - Vector2(0.42 * w, 0)])
	_expect(_events.has("confirm:-1"), "drag after a tap reveal still works")
	_events.clear()
	card.reset()

	# Keyboard (D-156, D-167).
	_expect(card.handle_key(_action(&"ui_right")) and card.revealed_side() == 1, "arrow reveals")
	_expect(card.handle_key(_action(&"ui_cancel")) and not card.is_revealed(), "1st Esc cancels the reveal")
	_expect(not card.handle_key(_action(&"ui_cancel")), "2nd Esc is left for the pause menu")
	_expect(not card.handle_key(_action(&"ui_accept")), "Enter with nothing revealed does nothing")
	_expect(card.handle_key(_key(KEY_LEFT)) and card.revealed_side() == -1, "real Left key reveals (-1)")
	_expect(card.handle_key(_key(KEY_ENTER)), "Enter confirms")
	_expect_events(["reveal:1", "hidden", "reveal:-1", "confirm:-1"], "keyboard sequence")
	card.reset()

	# Layout of the option text while dragging (C-06) and border (C-05).
	var card_node: Control = card.get_node("CardFit/Card")
	card.preview_drag(1, 0.40)
	_expect(card_node.offset_transform_rotation == 0.0, "reduce motion: follows the finger without tilting (A-03 RM)")
	card.reduce_motion = false
	card.preview_drag(1, 0.40)
	card.reduce_motion = true
	_expect(is_equal_approx(card_node.offset_transform_position.x, 0.40 * w), "card offset at the limit")
	_expect(is_equal_approx(card_node.offset_transform_rotation, deg_to_rad(Tokens.TILT_DEG_AT_LIMIT)), "tilt 5° at the limit")
	_expect(option.text == "Aceitar as mudanças" and option.horizontal_alignment == HORIZONTAL_ALIGNMENT_LEFT, "option text +1")
	_expect(is_equal_approx(option.position.x, Tokens.ESP_24) and absf(option.size.x - Tokens.OPTION_WIDTH_RATIO * w) < 1.0,
		"+1 text in the half facing the center (x %.1f, w %.1f)" % [option.position.x, option.size.x])
	var band_box := card.get_node("CardFit/Card/BorderOuter/BorderBand").get_theme_stylebox(&"panel") as StyleBoxFlat
	var outer_box := card.get_node("CardFit/Card/BorderOuter").get_theme_stylebox(&"panel") as StyleBoxFlat
	_expect(band_box.border_color == Tokens.PARTY.orange and band_box.border_width_left == Tokens.BORDER_BAND, "party band 8 px")
	_expect(outer_box.border_width_left == 12, "white 2 + party 8 + white 2 = 12")
	card.preview_drag(-1, 0.40)
	await process_frame
	_expect(absf(option.position.x + option.size.x - (w - Tokens.ESP_24)) < 1.0 and option.horizontal_alignment == HORIZONTAL_ALIGNMENT_RIGHT,
		"-1 text mirrored")
	_expect(band_box.border_color == Tokens.PARTY.red, "red border for -1")
	_check_no_side_words(card, "card dragging")
	card.preview_tap(1)
	_check_no_side_words(card, "card tap")
	card.preview_hint()
	_check_no_side_words(card, "card hint")
	var calib := VIEW.duplicate(true)
	calib.mode = &"calibration"
	card.setup(calib)
	card.preview_drag(1, 0.40)
	_expect(outer_box.border_width_left == Tokens.BORDER_FILETE and not card.get_node("CardFit/Card/BorderOuter/BorderBand").visible,
		"calibration: white filete only (D-166)")
	var crisis := VIEW.duplicate(true)
	crisis.mode = &"crisis"
	card.setup(crisis)
	_expect(card.get_node("CardFit/Card/CrisisFrame").visible, "crisis: hatched frame (C-10)")
	_events.clear()

	# Contextual tap hint (D-163): after the idle delay; leaves on the 1st gesture.
	card.setup(VIEW)
	var hint: Control = card.get_node("CardFit/Card/TapHint")
	var hint_timer: Timer = card.get_node("HintTimer")
	card.hint_enabled = true
	_expect(not hint_timer.is_stopped() and is_equal_approx(hint_timer.wait_time, SwipeCard.TAP_HINT_DELAY), "hint timer armed while idle")
	hint_timer.timeout.emit()
	_expect(hint.visible, "hint shown after the idle delay")
	_press(card, c)
	_release(card, c + Vector2(30, 0))
	await _wait_until(func() -> bool: return not hint.visible, 1.0)
	_expect(not hint.visible, "hint leaves on the 1st gesture")
	hint_timer.timeout.emit()
	_expect(not hint.visible, "hint shown only once per card")
	card.hint_enabled = false
	_expect(hint_timer.is_stopped(), "hint can be disabled")
	_events.clear()

	# PROPOSTA P7: option in a band at the top at 36 px (off by default).
	var band: Control = card.get_node("OptionBand")
	slot.theme = ThemeBuilder.build(36)
	await process_frame
	card.reset()
	card.preview_drag(1, 0.40)
	_expect(option.visible and not band.visible, "36 px without P7: text stays on the card")
	card.option_band = true
	card.reset()
	card.preview_drag(1, 0.40)
	_expect(band.visible and not option.visible and band.get_node("BandLabel").text == "Aceitar as mudanças", "P7 band at 36 px")
	card.preview_tap(-1)
	_expect(option.visible and not band.visible, "tap reveal stays on the card at 36 px")
	card.option_band = false
	slot.theme = null
	await process_frame
	_events.clear()

	# A gesture in progress can be dropped (pause, app in background).
	card.reset()
	_press(card, c)
	_move(card, c + Vector2(50, 0))
	card.cancel_gesture()
	_expect_events(["reveal:1", "hidden"], "cancel_gesture returns the card")
	_release(card, c + Vector2(50, 0))
	_expect_events([], "release after cancel_gesture does nothing")
	# A listener may set up the next card inside choice_confirmed.
	card.choice_confirmed.connect(func(_side: int) -> void: card.reset(), CONNECT_ONE_SHOT)
	_drag(card, c, [c + Vector2(0.45 * w, 0)])
	await process_frame
	_expect(not card.is_leaving() and card.get_node("CardFit/Card").visible, "reset() inside choice_confirmed wins over the exit")
	_events.clear()

	# Reduce motion: the card fades out in place and still reports the exit.
	card.reset()
	var rm_exit := {"side": 0}
	card.exit_finished.connect(func(side: int) -> void: rm_exit.side = side, CONNECT_ONE_SHOT)
	_drag(card, c, [c - Vector2(0.45 * w, 0)])
	await _wait_until(func() -> bool: return rm_exit.side != 0, 2.0)
	_expect(rm_exit.side == -1, "reduce motion exit reports exit_finished(-1)")
	_events.clear()

	# Animated exit and return (A-05, A-06).
	card.setup(VIEW)
	card.reduce_motion = false
	await process_frame
	var exited := {"side": 0}
	card.exit_finished.connect(func(side: int) -> void: exited.side = side, CONNECT_ONE_SHOT)
	_drag(card, c, [c + Vector2(0.45 * w, 0)])
	_expect(card.is_leaving(), "input blocked while leaving")
	_tap(card, right)
	_expect_events(["reveal:1", "confirm:1"], "no extra event while leaving")
	await _wait_until(func() -> bool: return exited.side != 0, 2.0)
	_expect(exited.side == 1 and not card_node.visible, "exit animation ends with exit_finished(+1)")
	card.reset()
	_drag(card, c, [c + Vector2(0.2 * w, 0)])
	await _wait_until(func() -> bool: return card_node.offset_transform_position == Vector2.ZERO, 2.0)
	_expect(card_node.offset_transform_position == Vector2.ZERO and card_node.offset_transform_rotation == 0.0, "return animation back to center")
	_events.clear()

	# Through the GUI (focus + _gui_input).
	card.reset()
	card.grab_focus()
	await process_frame
	_expect(card.get_node("CardFit/Card/FocusRing").visible, "keyboard focus shows the ring")
	root.push_input(_key(KEY_RIGHT))
	await process_frame
	_expect(card.revealed_side() == 1, "focused card receives the arrow key through _gui_input")
	slot.queue_free()


# --- CardFooter ----------------------------------------------------------------

func _test_footer(host: Control) -> void:
	var footer: CardFooter = load("res://scenes/components/card_footer.tscn").instantiate()
	host.add_child(footer)
	footer.size.x = 342
	footer.set_text("Ano 1 · Lua de Mel · 3/7")
	await process_frame
	_expect(footer.display_text() == "Ano 1 · Lua de Mel · 3/7", "footer text")
	_expect(footer.get_combined_minimum_size().y >= Tokens.FOOTER_MIN, "footer at least 64 high")
	var pause := footer.pause_button()
	_expect(pause.accessibility_name == "Pausar" and pause.custom_minimum_size == Vector2(48, 48), "pause 48×48 named Pausar")
	var pressed := {"n": 0}
	footer.pause_pressed.connect(func() -> void: pressed.n += 1)
	pause.pressed.emit()
	_expect(pressed.n == 1, "pause_pressed")
	footer.set_progress(3, 6)
	_expect(footer.display_text() == "3/6", "progress n/N")
	_expect(footer.get_node("Pad/Row/Steps/Segments").get_child_count() == 6, "6 segments")
	_expect(footer.get_node("Pad/Row/Steps").accessibility_name == "Pergunta 3 de 6", "progress a11y name")
	footer.high_contrast = true
	_check_no_side_words(footer, "footer")
	footer.queue_free()


# --- Helpers -------------------------------------------------------------------

func _drag(card: SwipeCard, from: Vector2, path: Array, velocity_x: float = 0.0) -> void:
	_press(card, from)
	for i in path.size():
		_move(card, path[i], velocity_x if i == path.size() - 1 else 0.0)
	_release(card, path[-1])


func _tap(card: SwipeCard, pos: Vector2) -> void:
	_press(card, pos)
	_release(card, pos)


func _press(card: SwipeCard, pos: Vector2) -> void:
	card.handle_pointer(_button(pos, true))


func _release(card: SwipeCard, pos: Vector2) -> void:
	card.handle_pointer(_button(pos, false))


func _move(card: SwipeCard, pos: Vector2, velocity_x: float = 0.0) -> void:
	var e := InputEventMouseMotion.new()
	e.position = pos
	e.velocity = Vector2(velocity_x, 0)
	e.button_mask = MOUSE_BUTTON_MASK_LEFT
	card.handle_pointer(e)


func _button(pos: Vector2, pressed: bool) -> InputEventMouseButton:
	var e := InputEventMouseButton.new()
	e.button_index = MOUSE_BUTTON_LEFT
	e.pressed = pressed
	e.position = pos
	return e


func _action(action: StringName) -> InputEventAction:
	var e := InputEventAction.new()
	e.action = action
	e.pressed = true
	return e


func _key(code: Key) -> InputEventKey:
	var e := InputEventKey.new()
	e.keycode = code
	e.physical_keycode = code
	e.pressed = true
	return e


func _expect_events(expected: Array, what: String) -> void:
	var got := ", ".join(_events)
	_expect(_events == PackedStringArray(expected), "%s — got [%s]" % [what, got])
	_events.clear()


func _check_no_side_words(node: Node, where: String) -> void:
	for text in _visible_texts(node):
		var low := text.to_lower()
		for word in SIDE_WORDS:
			_expect(not low.contains(word), "side word '%s' in %s: %s" % [word, where, text])


func _visible_texts(node: Node) -> PackedStringArray:
	var out: PackedStringArray = []
	if node is Label:
		out.append(node.text)
	if node is Button:
		out.append(node.text)
	if node is Control:
		out.append(node.accessibility_name)
		out.append(node.accessibility_description)
		out.append(node.tooltip_text)
	for child in node.get_children():
		out.append_array(_visible_texts(child))
	return out


func _wait(sig: Signal, timeout: float) -> bool:
	var state := {"done": false}
	var on_signal := func(_a: Variant = null, _b: Variant = null) -> void: state.done = true
	sig.connect(on_signal, CONNECT_ONE_SHOT)
	await _wait_until(func() -> bool: return state.done, timeout)
	if sig.is_connected(on_signal):
		sig.disconnect(on_signal)
	return state.done


func _wait_until(cond: Callable, timeout: float) -> void:
	var start := Time.get_ticks_msec()
	while not cond.call() and Time.get_ticks_msec() - start < int(timeout * 1000.0):
		await process_frame


func _expect(cond: bool, what: String) -> void:
	if not cond:
		_failures.append(what)
