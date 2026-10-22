extends SceneTree
## Headless: godot --headless --path jogo -s res://tests/test_e2e.gd
## P-005 — one whole run through the real app, as a player would play it: Main (main.tscn),
## the real Game, and input pushed into the window (clicks and keys).
##   title → tutorial (1st time) → calibration (6) → 4 years of cards with events → the
##   impeachment scene (acquitted) → back to the cards → end of the term → final screen.
## On a card of Year 2 the app is "closed" and opened again: the title offers "Continuar" and
## the same card comes back (gdd 10 §3.5). After the final: "Jogar novamente" → calibration
## (tutorial already seen) → pause → "Abandonar mandato" → title (gdd 10 CA-10).
## Choices follow a fixed policy on a fixed seed: drain political capital until the scene,
## pass its tests, then keep the lowest meter high. Before the screens, the same policy is
## played through GameFlow alone (`_api_expected`, V-033); the screens must reach the same
## ending, so they make exactly the calls the rules expect.
## Every screen: no side word (D-084). Game and scene screens: no meter number before the final.
## Untyped references on purpose: classes that use autoloads cannot be named in a -s script.

const MAIN_SCENE := "res://scenes/main.tscn"
const TEST_SETTINGS := "user://test_e2e_settings.cfg"
const TEST_SAVE := "user://test_e2e_save.json"
const RUN_SEED := 15
const API_MAX_STEPS := 5000
const EXPECTED_PATH: Array[StringName] = [&"title", &"tutorial", &"calibration", &"game", &"impeachment", &"game", &"final"]
const RESUME_AT_YEAR := 2
const SIDE_WORDS := ["esquerda", "direita", "◀", "▶", "←", "→"]
const TIME_SCALE := 4.0
const MAX_ACTIONS := 900
const STEP_TIMEOUT := 8.0
const RETRY_AFTER := 0.4
const TAP_POINT := Vector2(195, 420)   # middle of the phone canvas: no button there

var _failures: PackedStringArray = []
var _main: Control
var _game: Node
var _data: GameDatabase
var _settings: Node
var _saves: Node
var _real_settings_path := ""
var _real_save_path := ""
var _order: Array = []
var _visits: Array[StringName] = []
var _expected := {}   # {reason, id, scene} of the policy played through GameFlow alone
var _scene_seen := false
var _resumed := false
var _paused_once := false
var _actions := 0
var _played := 0


func _initialize() -> void:
	_run.call_deferred()


func _run() -> void:
	create_timer(480.0, true, false, true).timeout.connect(func() -> void:
		printerr("FAIL: test_e2e timed out at %s after %d actions (%s)" % [str(_signature()), _actions, ", ".join(_failures)])
		quit(1))
	await process_frame
	# Headless windows are 64×64: GUI picking needs the phone canvas.
	root.size = Vector2i(Tokens.VIEWPORT)
	await process_frame
	_settings = root.get_node(^"Settings")
	_game = root.get_node(^"Game")
	_saves = root.get_node(^"SaveManager")
	_data = root.get_node(^"GameData")
	_order = Array(_data.meter_ids)
	_real_settings_path = _settings.storage_path
	_settings.storage_path = TEST_SETTINGS
	_settings.reset_defaults(false)
	_real_save_path = _saves.path
	_saves.path = TEST_SAVE
	_saves.delete()
	Engine.time_scale = TIME_SCALE
	_expected = _api_expected()
	print("  API: %s / %s (scene: %s)" % [_expected.reason, _expected.id, _expected.scene])

	await _new_main()   # the app opens on the title
	await _title_new_term()
	await _tutorial()
	await _play_to_final()
	await _final_checks()
	await _replay_and_abandon()

	Engine.time_scale = 1.0
	paused = false
	if _main:
		_main.queue_free()
	await process_frame
	_saves.delete()
	_saves.path = _real_save_path
	if FileAccess.file_exists(TEST_SETTINGS):
		DirAccess.remove_absolute(ProjectSettings.globalize_path(TEST_SETTINGS))
	_settings.storage_path = _real_settings_path
	print("  path: ", " → ".join(_visits.map(func(v: StringName) -> String: return String(v))))
	print("  %d actions, %d cards played" % [_actions, _played])
	_finish("test_e2e")


# --- Steps -----------------------------------------------------------------------------------

func _title_new_term() -> void:
	_expect(_main.current_id() == &"title", "the app opens on the title (got %s)" % _main.current_id())
	var screen: Node = _main.current_screen()
	var buttons: Array = screen.buttons()
	_expect(not (buttons[0] as Control).visible, "T-01: no 'Continuar' without a save")
	_check_texts(screen, "title", false)
	_click_control(buttons[1])   # "Novo mandato"
	await _settle_to(&"tutorial")


func _tutorial() -> void:
	_expect(_main.current_id() == &"tutorial", "1st time: the tutorial (got %s)" % _main.current_id())
	var screen: Node = _main.current_screen()
	var advance := screen.find_child("AdvanceButton", true, false) as Control
	for i in 4:
		_expect(screen.step() == i + 1, "T-02 step %d (got %d)" % [i + 1, screen.step()])
		_check_texts(screen, "tutorial %d" % (i + 1), false)
		if i == 3:
			# The title drew a random seed; the same run every time from here on.
			_game.new_run(RUN_SEED)
		_click_control(advance)
		if i < 3:
			_expect(await _wait(func() -> bool: return screen.step() == i + 2, 3.0), "T-02 advances to step %d" % (i + 2))
	await _settle_to(&"calibration")
	_expect(bool(_settings.tutorial_seen), "gdd 10 §3.5: tutorial seen is saved")


## Acts on whatever the app shows until the final screen.
func _play_to_final() -> void:
	while _main.current_id() != &"final" and _actions < MAX_ACTIONS:
		await _idle()
		if _main.current_id() == &"final":
			break
		if _should_resume():
			await _close_and_resume()
			continue
		if not _paused_once and _main.current_id() == &"game" and _main.current_screen().step() == &"card":
			await _pause_check()
		var before := _signature()
		_check_current()
		_actions += 1
		await _wait(_ready_to_act, STEP_TIMEOUT)
		# A key or tap can land in the middle of an animation and be ignored: try again,
		# until the app moves on (acting stops as soon as anything changes).
		var moved := false
		var deadline := Time.get_ticks_msec() + int(STEP_TIMEOUT * 1000.0)
		while not moved and Time.get_ticks_msec() < deadline:
			await _act()
			moved = await _wait(func() -> bool: return _signature() != before, RETRY_AFTER)
		if not moved:
			_expect(false, "stuck at %s" % str(before))
			return
		_visit()
	await _settle_to(&"final")
	_expect(_main.current_id() == &"final", "the final screen after %d actions" % _actions)


func _final_checks() -> void:
	var screen: Node = _main.current_screen()
	var v: Dictionary = _game.final_view()
	var ending: Dictionary = v.get("ending", {})
	_expect(String(v.get("reason", "")) == _expected.reason and String(ending.get("id", "")) == _expected.id,
		"same ending as the policy through the API: %s/%s (got %s/%s)" % [_expected.reason, _expected.id, v.get("reason", ""), ending.get("id", "")])
	_expect(_expected.scene, "the API run also went through the impeachment scene")
	_expect(_texts(screen).has(String(ending.get("name", "?"))), "T-10 shows the ending name")
	_expect(not _saves.has_save(), "gdd 10 §3.5: the save is deleted on the final screen")
	_played = (_game.flow.run.played as Array).size() if _game.flow != null else 0
	_expect(_resumed, "the run was closed and resumed once")
	_expect(_scene_seen, "the impeachment scene was played")
	_expect(_is_subsequence(EXPECTED_PATH, _visits), "screens in order %s (got %s)" % [str(EXPECTED_PATH), str(_visits)])
	_check_texts(screen, "final", false)


## "Jogar novamente" → calibration (no tutorial) → pause → "Abandonar mandato" → title.
func _replay_and_abandon() -> void:
	var screen: Node = _main.current_screen()
	var again: Button = screen.buttons()[0]   # "Jogar novamente", at the end of the scroll
	screen.scroll().ensure_control_visible(again)
	await _frames(3)
	_click_control(again)
	await _settle_to(&"calibration")
	_expect(_main.current_id() == &"calibration", "Jogar novamente → calibration, tutorial already seen (got %s)" % _main.current_id())
	_expect(_game.current_state() == &"calibration", "a new run")
	screen = _main.current_screen()
	_click_control(screen.footer().pause_button())
	_expect(await _wait(func() -> bool: return _main.is_paused(), 3.0), "T-11: the pause opens from the footer button")
	await _frames(3)
	_click_control(_main.pause_menu().buttons()[2])   # "Abandonar mandato"
	_expect(await _wait(func() -> bool: return _main.modal().is_open(), 3.0), "C-14 asks before abandoning")
	await _frames(3)
	var confirm := _modal_button(_modal_confirm_text())
	_expect(confirm != null, "C-14 has the confirm button")
	if confirm:
		_click_control(confirm)
	await _settle_to(&"title")
	_expect(_main.current_id() == &"title" and _game.current_state() == &"start", "abandon in the calibration → title, no ending (CA-10)")
	_expect(not _saves.has_save(), "nothing saved after abandoning")


# --- Acting ----------------------------------------------------------------------------------

func _act() -> void:
	var screen: Node = _main.current_screen()
	match _main.current_id():
		&"calibration":
			await _decide(1)
		&"game":
			match screen.step():
				&"card":
					await _decide(_pick_in(_game.flow, _scene_seen))
				&"consequence":
					_key(KEY_ENTER)
				&"learning":
					_click_control(screen.sheet().continue_button())
				&"events":
					_click(TAP_POINT)
				&"year":
					if screen.year_card().is_waiting_tap():
						_key(KEY_ENTER)   # Captura warning waits for a tap (D-184)
				_:
					pass   # resolving, leaving: the screen moves on alone
		&"impeachment":
			_scene_seen = true
			if screen.is_locked():
				return
			match screen.stage():
				"intro", "result":
					_key(KEY_ENTER)
				"phase":
					await _decide(_scene_pick_in(_game.flow))
				"consequence":
					_key(KEY_ENTER)
				"learning":
					_click_control(screen.sheet().continue_button())


## The current step takes input (the sentence is up, the notice waits, the scene is not in
## its opening cut); other steps move on alone.
func _ready_to_act() -> bool:
	var screen: Node = _main.current_screen()
	if screen == null or _main.is_busy():
		return false
	match _main.current_id():
		&"game":
			match screen.step():
				&"consequence":
					return screen.consequence().is_waiting()
				&"events":
					return screen.event_notice().is_waiting()
				&"learning":
					return screen.sheet().is_open()
		&"impeachment":
			if screen.is_locked():
				return false
			if screen.stage() == "consequence":
				return screen.consequence().is_waiting()
			if screen.stage() == "learning":
				return screen.sheet().is_open()
	return true


## Keyboard decision through the window: the arrow reveals that half (and gives the card the
## focus), Enter confirms (D-156).
func _decide(side: int) -> void:
	_key(KEY_RIGHT if side > 0 else KEY_LEFT)
	await _frames(2)
	_key(KEY_ENTER)


## The policy: drain political capital until the scene, then keep the lowest meter high
## (fictitious data, D-135). `flow` is the Game's (screens) or the API run's.
func _pick_in(flow: Variant, scene_seen: bool) -> int:
	var run: RunState = flow.run
	var card: Dictionary = _data.cards[run.current_card["id"]]
	var side_a := int(run.current_card["side_a"])
	var scores := {}
	for side in [-1, 1]:
		var opt: Dictionary = card[CardRules.option_key(side, side_a)]
		var m: Dictionary = run.meters.duplicate()
		MeterRules.apply_effects(m, flow._ints(opt["effects"]), flow._multiplier(), _data.balance, _order)
		var safe: int = m.values().min() * 1000 + m.values().reduce(func(a, v): return a + v, 0)
		scores[side] = safe if scene_seen else -int(opt["effects"].get("political_capital", 0)) * 100000 + safe
	return -1 if scores[-1] > scores[1] else 1


## Passes the phase test when an option does (acquittal path).
func _scene_pick_in(flow: Variant) -> int:
	var imp: Dictionary = flow.run.impeachment
	var card: Dictionary = _data.impeachment_cards[int(imp["phase"]) - 1]
	var a_passes := ImpeachmentRules.test_passes(card["option_a"]["test"], flow.run.meters)
	var b_passes := ImpeachmentRules.test_passes(card["option_b"]["test"], flow.run.meters)
	var take_a := a_passes or not b_passes
	return int(imp["side_a"]) if take_a else -int(imp["side_a"])


## V-033: the same seed and policy through GameFlow alone, no screens: calibration all +1
## (like `_act`), then `_pick_in` and `_scene_pick_in`.
func _api_expected() -> Dictionary:
	var f := GameFlow.new(_data)
	f.start(RUN_SEED)
	var scene := false
	var steps := 0
	while f.state() != &"final" and steps < API_MAX_STEPS:
		steps += 1
		match f.state():
			&"calibration":
				f.answer_calibration(1)
			&"year_intro":
				f.continue_from_year()
			&"events":
				f.continue_from_event()
			&"card":
				f.choose(_pick_in(f, scene))
			&"consequence":
				f.continue_from_consequence()
			&"learning":
				f.continue_from_learning()
			&"impeachment":
				scene = true
				if f.impeachment_view()["stage"] == "phase":
					f.choose_impeachment(_scene_pick_in(f))
				else:
					f.continue_impeachment()
	_expect(f.state() == &"final", "the API run reaches the final (state %s)" % f.state())
	var v: Dictionary = f.final_view()
	return {"reason": String(v.get("reason", "")), "id": String(v.get("ending", {}).get("id", "")), "scene": scene}


func _should_resume() -> bool:
	return not _resumed and _main.current_id() == &"game" and _main.current_screen().step() == &"card" \
		and _game.current_state() == &"card" and int(_game.flow.run.year) >= RESUME_AT_YEAR


## "Closes the app" on a card and opens it again: only the save is left; the title offers
## "Continuar", which brings back the same card (gdd 10 §3.5, F-07).
func _close_and_resume() -> void:
	_resumed = true
	var card_id := String(_game.flow.run.current_card["id"])
	var values := _game_values()
	_main.queue_free()
	_main = null
	await _frames(2)
	_game.flow = null   # a new process: nothing in memory
	await _new_main()
	_expect(_main.current_id() == &"title", "reopened app shows the title")
	var screen: Node = _main.current_screen()
	var cont := screen.buttons()[0] as Control
	_expect(cont.visible, "T-01: 'Continuar' with a save")
	_click_control(cont)
	await _settle_to(&"game")
	_expect(_main.current_id() == &"game", "Continuar → the game screen (got %s)" % _main.current_id())
	_expect(_game.current_state() == &"card" and String(_game.flow.run.current_card["id"]) == card_id, "Continuar → the same card %s" % card_id)
	_expect(_values(_main.current_screen().hud()) == values and _game_values() == values, "resumed HUD = values before closing")


## Esc with nothing revealed opens the pause (D-167); Esc again closes it ("Continuar").
func _pause_check() -> void:
	_paused_once = true
	_key(KEY_ESCAPE)
	_expect(await _wait(func() -> bool: return _main.is_paused(), 2.0), "Esc on a card opens the pause")
	_expect(paused, "T-11: the tree is paused")
	await _frames(3)
	_key(KEY_ESCAPE)
	_expect(await _wait(func() -> bool: return not _main.is_paused(), 2.0), "Esc closes the pause")
	await _frames(3)


# --- Checks ----------------------------------------------------------------------------------

func _check_current() -> void:
	var id: StringName = _main.current_id()
	var screen: Node = _main.current_screen()
	_check_texts(screen, String(id), id == &"game" or id == &"impeachment")


## No side words (D-084); with `numbers`, no meter value as a number (docs/14 §14.05).
func _check_texts(node: Node, where: String, numbers: bool) -> void:
	var values := _game_values() if numbers else {}
	var footer_text := ""
	if node.has_method(&"footer"):
		footer_text = node.footer().display_text()
	for t in _texts(node):
		var low := t.to_lower()
		for w in SIDE_WORDS:
			_expect(not low.contains(w), "%s: side word '%s' in '%s'" % [where, w, t])
		if t == footer_text or values.is_empty():
			continue
		var cleaned := _strip_ids(t)
		for id in values:
			var rx := RegEx.create_from_string("(?<![\\d/])%d(?![\\d/])" % int(values[id]))
			_expect(rx.search(cleaned) == null, "%s: meter value %d (%s) in '%s'" % [where, values[id], id, t])


## Card / learning ids ("THEM-004"), durations ("48 horas"), "n de N", "Ano N", "Fase N" and the scene's vote counts
## (513, 342, 81, 54: gdd 03 §3.3) are not meter values.
func _strip_ids(t: String) -> String:
	var rx := RegEx.create_from_string("[A-Z]+-\\d+|\\d+ (horas|dias|meses|anos)\\b|\\d+ de \\d+|Ano \\d|[Ff]ase \\d|\\d+/\\d+|\\b(513|342|81|54)\\b")
	return rx.sub(t, "", true)


func _signature() -> Array:
	if _main == null or _game == null:
		return []
	var screen: Node = _main.current_screen()
	var sub := ""
	var extra := ""
	if screen and screen.has_method(&"stage"):
		sub = String(screen.stage())
		extra = "%s/%s/%s" % [screen.is_locked(), screen.sheet().is_open(), screen.consequence().is_waiting()]
	elif screen and screen.has_method(&"step"):
		sub = str(screen.step())
	var played := -1
	if _game.flow != null:
		played = (_game.flow.run.played as Array).size()
	var imp: Dictionary = _game.impeachment_view()
	return [_main.current_id(), sub, extra, _game.current_state(), played,
		_game.calibration_view().get("index", 0), _game.event_view().get("index", 0),
		"%s%s" % [imp.get("stage", ""), imp.get("phase", "")], _main.is_busy()]


func _visit() -> void:
	if _main == null:
		return
	var id: StringName = _main.current_id()
	if id != &"" and (_visits.is_empty() or _visits[-1] != id):
		_visits.append(id)


static func _is_subsequence(want: Array, got: Array) -> bool:
	var i := 0
	for x in got:
		if i < want.size() and x == want[i]:
			i += 1
	return i == want.size()


# --- Helpers ---------------------------------------------------------------------------------

func _new_main() -> void:
	_main = (load(MAIN_SCENE) as PackedScene).instantiate() as Control
	root.add_child(_main)
	_main.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	_main.size = Vector2(Tokens.VIEWPORT)
	await _settle_to(&"title")


func _settle_to(id: StringName) -> void:
	await _wait(func() -> bool: return _main.current_id() == id and not _main.is_busy(), STEP_TIMEOUT)
	await _frames(2)
	_visit()


func _idle() -> void:
	await _wait(func() -> bool: return not _main.is_busy(), STEP_TIMEOUT)
	await _frames(2)
	_visit()


## ConfirmModal uses Settings, so it is not named here (see the header).
func _modal_confirm_text() -> String:
	return String(_main.modal().get_script().get_script_constant_map().get("DEFAULT_CONFIRM", ""))


func _modal_button(text: String) -> Button:
	for b in _main.modal().buttons():
		if (b as Button).text == text:
			return b
	return null


func _values(hud: Node) -> Dictionary:
	return hud.values()


func _game_values() -> Dictionary:
	var out := {}
	for m in _game.hud():
		out[String(m.id)] = int(m.value)
	return out


func _click_control(c: Control) -> void:
	_expect(c != null and c.is_visible_in_tree(), "clickable control %s" % (str(c.name) if c else "null"))
	if c:
		_click(c.get_global_rect().get_center())


func _click(pos: Vector2) -> void:
	for pressed in [true, false]:
		var e := InputEventMouseButton.new()
		e.button_index = MOUSE_BUTTON_LEFT
		e.position = pos
		e.global_position = pos
		e.pressed = pressed
		root.push_input(e)


func _key(code: Key) -> void:
	var down := InputEventKey.new()
	down.keycode = code
	down.physical_keycode = code
	down.pressed = true
	root.push_input(down)
	var up := down.duplicate() as InputEventKey
	up.pressed = false
	root.push_input(up)


func _texts(node: Node) -> PackedStringArray:
	var out: PackedStringArray = []
	for n in _all(node):
		if n is Label and (n as Label).is_visible_in_tree():
			out.append((n as Label).text)
		elif n is Button and (n as Button).is_visible_in_tree():
			out.append((n as Button).text)
		elif n is LinkButton and (n as LinkButton).is_visible_in_tree():
			out.append((n as LinkButton).text)
		elif n is FoldableContainer and (n as FoldableContainer).is_visible_in_tree():
			out.append((n as FoldableContainer).title)
	return out


func _all(node: Node) -> Array[Node]:
	var out: Array[Node] = [node]
	for c in node.get_children():
		out.append_array(_all(c))
	return out


func _wait(cond: Callable, seconds: float) -> bool:
	var end := Time.get_ticks_msec() + int(seconds * 1000.0)
	while Time.get_ticks_msec() < end:
		if cond.call():
			return true
		await process_frame
	return cond.call()


func _frames(n: int) -> void:
	for i in n:
		await process_frame


func _expect(cond: bool, what: String) -> void:
	if not cond:
		_failures.append(what)


func _finish(test_name: String) -> void:
	if _failures.is_empty():
		print("%s: OK" % test_name)
		quit(0)
	else:
		for f in _failures:
			printerr("FAIL: ", f)
		quit(1)
