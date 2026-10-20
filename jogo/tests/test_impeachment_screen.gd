extends SceneTree
## Headless: godot --headless --path jogo -s res://tests/test_impeachment_screen.gd
## T-09 impeachment screen (lote E) on the real Game. Seeded runs (careful policy, as in
## test_playthrough) play until the scene opens; then the screen is driven like a player:
## arrows + Enter on the crisis card, Enter or a tap on the opening text, the consequence and
## the result. Checked on every stage: the scoreboard against api.md §5 (none in phases 1 and
## 5; committee "[a definir]"; chamber "— / 513" before the vote, 342 when lost, "[< 342]" when
## won; Senate only the target in phase 4 (D-168) and the bar at the result: 54 on conviction),
## the crisis card (C-10), no side words (D-084), no meter numbers, no green or red (D-156),
## Esc (D-167), the pause, live settings, the scene background, read-only stages after the app
## reopens (F-07) and the way out (acquittal → game, conviction → final "Impeachment").
## Saves and settings go to temporary files; animations run at Engine.time_scale = 4.

const MAIN_SCENE := "res://scenes/main.tscn"
const TEST_SETTINGS := "user://test_imp_screen_settings.cfg"
const SIDE_WORDS := ["esquerda", "direita", "◀", "▶", "←", "→"]
const METER_IDS := ["dignity", "awareness", "sovereignty", "security", "integrity", "treasury", "political_capital", "legitimacy"]
const MAX_SEEDS := 60
const TIME_SCALE := 4.0
const BELOW_RATIO := 0.675          # Scoreboard.BELOW_RATIO
const COMMITTEE_AT := 0.5           # Scoreboard.COMMITTEE_QUORUM_AT
const MODE_HIDDEN := 0
const MODE_TARGET := 1
const MODE_BAR := 2

var _failures: PackedStringArray = []
var _main: Control
var _game: Node
var _saves: Node
var _settings: Node
var _data: Object
var _order: Array
var _seen := {}                     # outcomes reached by plan: acquitted (pass) / convicted (fail)
var _log: PackedStringArray = []


func _initialize() -> void:
	_run.call_deferred()


func _run() -> void:
	create_timer(240.0, true, false, true).timeout.connect(func() -> void:
		printerr("FAIL: test_impeachment_screen timed out")
		quit(1))
	await process_frame
	_game = root.get_node(^"Game")
	_saves = root.get_node(^"SaveManager")
	_settings = root.get_node(^"Settings")
	_data = root.get_node(^"GameData")
	_order = Array(_data.meter_ids)
	var real_settings: String = _settings.storage_path
	_settings.storage_path = TEST_SETTINGS
	_settings.reset_defaults(false)
	_saves.path = "user://test_imp_screen_%d.json" % OS.get_process_id()
	_saves.delete()
	Engine.time_scale = TIME_SCALE

	var next := 1
	# A — pass every test the player can (keys; the app restarts at a consequence, F-07) until
	# an acquittal shows. B — fail them (taps; restart at a phase card) until a conviction shows.
	for want_pass in [true, false]:
		var goal := "acquitted" if want_pass else "convicted"
		for attempt in 12:
			await _close_app()   # the screens of the last scene must not follow the next runs
			var seed := _reach_scene(next)
			if seed < 0:
				break
			next = seed + 1
			var outcome: String = await _play_scene(want_pass, seed)
			_log.append("seed %d %s → %s" % [seed, "pass" if want_pass else "fail", outcome if outcome != "" else "catastrophe"])
			if outcome == goal:
				break
	print("  scenes: ", ", ".join(_log))
	_expect(_seen.has("acquitted"), "an acquittal through the screen (%s)" % str(_seen))
	_expect(_seen.has("convicted"), "a conviction with the failing plan (%s)" % str(_seen))
	await _automatic_conviction(next)

	Engine.time_scale = 1.0
	if _main:
		_main.queue_free()
	paused = false
	await process_frame
	_saves.delete()
	_saves.path = _saves.DEFAULT_PATH
	if FileAccess.file_exists(TEST_SETTINGS):
		DirAccess.remove_absolute(ProjectSettings.globalize_path(TEST_SETTINGS))
	_settings.storage_path = real_settings
	_finish("test_impeachment_screen")


# --- Scenes ----------------------------------------------------------------------------------

## Plays one scene through the UI; returns the outcome ("" = left early: a meter reached 0).
func _play_scene(want_pass: bool, seed: int) -> String:
	var tag := "seed %d %s" % [seed, "pass" if want_pass else "fail"]
	# T-09.1 — opening. Tweens frozen (time_scale 0) while the screen enters: the A-25 cut is
	# checked before any frame time passes.
	Engine.time_scale = 0.0
	await _open_app(false)
	await _until(func() -> bool: return _main.current_screen() != null)
	var screen: Node = _main.current_screen()
	_expect(_main.current_id() == &"impeachment", "%s: Main shows the impeachment screen" % tag)
	_expect(screen.stage() == "intro" and screen.is_locked(), "%s: A-25 input blocked during the cut" % tag)
	_key(KEY_ENTER)   # ignored during the cut
	_tap_middle(screen.intro_panel())
	await _frames(3)
	_expect(screen.stage() == "intro", "%s: Enter and taps ignored during the cut" % tag)
	Engine.time_scale = TIME_SCALE
	await _settle()
	_expect(screen.allows_pause(), "%s: pause allowed in the scene" % tag)
	_expect(_backdrop() == Tokens.CRISIS_BG, "%s: scene background #1C2529 (got %s)" % [tag, _backdrop()])
	_expect(not screen.scoreboard().visible and not screen.card().visible, "%s: intro without card and scoreboard" % tag)
	_expect(screen.intro_panel().title_text() == String(_game.impeachment_view()["intro_text"]), "%s: opening text from Game" % tag)
	await _until(func() -> bool: return not screen.is_locked())
	_check_tree(screen, tag + " intro")
	if want_pass:
		_key(KEY_ENTER)
	else:
		_tap_middle(screen.intro_panel())
	for phase in range(1, 6):
		var ok: bool = await _until(func() -> bool: return screen.stage() == "phase" and not screen.is_locked())
		if not ok:
			_expect(false, "%s: phase %d did not open (stage %s)" % [tag, phase, screen.stage()])
			return ""
		await _frames(2)   # the focus moves to the card on the next frame (focus_first)
		_check_phase(screen, phase, tag)
		if phase == 2:
			await _settings_and_keys(screen, tag)
			if not want_pass:
				screen = await _restart_app(tag + " phase 2")   # F-07 at a phase card: same card, same sides
				_check_phase(screen, phase, tag + " after restart")
		var side := _scene_side(want_pass)
		_key(KEY_RIGHT if side == 1 else KEY_LEFT)
		await _frames(1)
		_key(KEY_ENTER)
		ok = await _until(func() -> bool: return screen.stage() == "consequence" or _left_screen(screen))
		if not ok:
			_expect(false, "%s: phase %d choice did not resolve (stage %s, Game %s)" % [tag, phase, screen.stage(), _game.impeachment_view().get("stage")])
			return ""
		if _left_screen(screen) or _game.current_state() == &"final":
			_expect(_game.current_state() == &"final", "%s: left the scene only for the final" % tag)
			return ""   # a meter reached 0 during the scene (catastrophe): another seed
		_check_consequence(screen, phase, tag)
		if phase == 3 and want_pass:
			screen = await _restart_app(tag + " phase 3 consequence")   # F-07: read-only consequence
			_check_consequence(screen, phase, tag + " after restart")
			_expect(bool(_game.impeachment_view()["readonly"]), "%s: consequence read-only after restart" % tag)
		if want_pass:
			_key(KEY_ENTER)
		else:
			_tap_middle(screen.consequence())
		ok = await _until(func() -> bool: return screen.stage() in ["learning", "phase", "result"])
		_expect(ok, "%s: consequence %d continues (stage %s)" % [tag, phase, screen.stage()])
		if screen.stage() == "learning":
			var sheet: Node = screen.sheet()
			_expect(sheet.is_open() and sheet.view()["id"] == "APR-IMP-%d" % phase, "%s: learning sheet APR-IMP-%d open" % [tag, phase])
			await _until(func() -> bool: return sheet.continue_button().size.y >= Tokens.TOUCH_MIN - 0.5)
			await _frames(5)
			_check_tree(screen, "%s learning %d" % [tag, phase])
			sheet.continue_button().pressed.emit()
	var ok_result: bool = await _until(func() -> bool: return screen.stage() == "result" and not screen.is_locked())
	_expect(ok_result, "%s: result shown (stage %s)" % [tag, screen.stage()])
	if not ok_result:
		return ""
	var outcome := String(_game.impeachment_view()["result"]["outcome"])
	_check_result(screen, outcome, tag)
	if outcome == ("acquitted" if want_pass else "convicted"):
		_seen[outcome] = true
	if want_pass:
		_key(KEY_ENTER)
	else:
		_tap_middle(screen.result_panel())
	await _settle()
	await _settle()
	var target: StringName = _main.screen_for_state(_game.current_state())
	if outcome == "convicted":
		_expect(_game.current_state() == &"final" and _game.final_view()["ending"]["id"] == "END-007", "%s: conviction → final Impeachment" % tag)
	else:
		_expect(_game.current_state() != &"impeachment", "%s: acquittal leaves the scene" % tag)
	_expect(_main.current_id() == target, "%s: screen after the result is %s (got %s)" % [tag, target, _main.current_id()])
	_expect(not _bg().has_theme_stylebox_override(&"panel"), "%s: backdrop reset after the scene" % tag)
	return outcome


## T-09.9 — the scene opens with Consciência and Integridade < 15: straight to the conviction.
## (The flag is set on the opening stage: a run that gets there by chance takes too many seeds.)
func _automatic_conviction(from_seed: int) -> void:
	await _close_app()
	var seed := _reach_scene(from_seed)
	if seed < 0:
		_expect(false, "T-09.9: no seed reached the scene")
		return
	_game.flow.run.impeachment["automatic"] = true
	await _open_app()
	var screen: Node = _main.current_screen()
	await _until(func() -> bool: return screen.stage() == "intro" and not screen.is_locked())
	_key(KEY_ENTER)
	var ok: bool = await _until(func() -> bool: return screen.stage() == "result" and not screen.is_locked())
	_expect(ok, "T-09.9: straight to the result")
	if ok:
		_expect(bool(_game.impeachment_view()["result"]["automatic"]), "T-09.9: automatic flag in the view")
		_check_result(screen, "convicted", "T-09.9")


# --- Checks ----------------------------------------------------------------------------------

func _check_phase(screen: Node, phase: int, tag: String) -> void:
	var where := "%s phase %d" % [tag, phase]
	var v: Dictionary = _game.impeachment_view()
	_expect(String(v["stage"]) == "phase" and int(v["phase"]) == phase, "%s: Game at the phase (%s)" % [where, v.get("stage")])
	var card: Node = screen.card()
	_expect(card.visible and card.get_node(^"CardFit/Card/CrisisFrame").visible, "%s: crisis card with the hatched frame" % where)
	_expect(card.accessibility_name == "Carta: %s" % v["card"]["title"], "%s: card title" % where)
	var sb: Node = screen.scoreboard()
	_expect(sb.board() == v.get("scoreboard", {}), "%s: scoreboard is Game's (%s)" % [where, v.get("scoreboard")])
	match phase:
		1, 5:
			_expect(not sb.visible and sb.mode() == MODE_HIDDEN, "%s: no scoreboard" % where)
		2:
			_board(sb, where, MODE_BAR, "Comissão especial", "[—]", " / [nº de membros — a definir]", "quórum [a definir]", 0.0)
		3:
			_board(sb, where, MODE_BAR, "Câmara", "—", " / 513", "quórum 342", 0.0)
			_expect(is_equal_approx(sb.quorum_ratio(), 342.0 / 513.0), "%s: quorum line at 342/513" % where)
		4:
			_board(sb, where, MODE_TARGET, "Senado", "—", " / 81", "quórum 54", 0.0)
			_expect(sb.accessibility_name == "Senado: meta de 54 votos de 81", "%s: Senate target name (%s)" % [where, sb.accessibility_name])
	_check_tree(screen, where)


func _check_consequence(screen: Node, phase: int, tag: String) -> void:
	var where := "%s consequence %d" % [tag, phase]
	var v: Dictionary = _game.impeachment_view()
	_expect(String(v["stage"]) == "consequence", "%s: Game at the consequence" % where)
	var c: Dictionary = v["consequence"]
	var lost := not bool(c["test_passed"])
	_expect(not screen.card().visible, "%s: card gone" % where)
	_expect(screen.consequence().visible, "%s: consequence shown" % where)
	_expect(_texts(screen).has(String(c["text"])), "%s: consequence text on screen" % where)
	var sb: Node = screen.scoreboard()
	await_board(sb)
	_expect(sb.board() == v.get("scoreboard", {}), "%s: scoreboard is Game's" % where)
	match phase:
		1, 5:
			_expect(not sb.visible, "%s: no scoreboard" % where)
		2:
			_board(sb, where, MODE_BAR, "Comissão especial", "[—]", " / [nº de membros — a definir]", "quórum [a definir]",
				COMMITTEE_AT if lost else COMMITTEE_AT * BELOW_RATIO)
		3:
			if lost:
				_board(sb, where, MODE_BAR, "Câmara", "342", " / 513", "quórum 342", 342.0 / 513.0)
				_expect(sb.accessibility_name == "Câmara: 342 de 513 votos; quórum 342", "%s: chamber name (%s)" % [where, sb.accessibility_name])
			else:
				_board(sb, where, MODE_BAR, "Câmara", "[< 342]", " / 513", "quórum 342 · valor exato [a definir]", 342.0 / 513.0 * BELOW_RATIO)
		4:
			_board(sb, where, MODE_TARGET, "Senado", "—", " / 81", "quórum 54", 0.0)
	# HUD = Game, no number shown.
	_expect(screen.hud().values() == _hud_values(), "%s: HUD shows Game's meters (%s vs %s)" % [where, screen.hud().values(), _hud_values()])
	_check_tree(screen, where)


func _check_result(screen: Node, outcome: String, tag: String) -> void:
	var where := "%s result %s" % [tag, outcome]
	var v: Dictionary = _game.impeachment_view()
	var res: Dictionary = v["result"]
	_expect(res["outcome"] == outcome, "%s: Game outcome %s" % [where, res["outcome"]])
	var panel: Node = screen.result_panel()
	_expect(panel.visible and panel.title_text() == String(res["title"]) and panel.body_text() == String(res["text"]), "%s: result title and text from Game" % where)
	_expect(panel.focus_mode == Control.FOCUS_ALL, "%s: result focusable" % where)
	_expect(not screen.card().visible, "%s: no card" % where)
	var sb: Node = screen.scoreboard()
	await_board(sb)
	if outcome == "convicted":
		_board(sb, where, MODE_BAR, "Senado", "54", " / 81", "quórum 54", 54.0 / 81.0)
		_expect(sb.accessibility_name == "Senado: 54 de 81 votos; quórum 54", "%s: Senate name (%s)" % [where, sb.accessibility_name])
	else:
		_board(sb, where, MODE_BAR, "Senado", "[< 54]", " / 81", "quórum 54 · valor exato [a definir]", 54.0 / 81.0 * BELOW_RATIO)
		_expect(sb.accessibility_name == "Senado: [votos a definir] de 81; quórum 54", "%s: Senate name (%s)" % [where, sb.accessibility_name])
	# Acquittal effects reach the HUD (Capital ≥ 20, Legitimidade +10), never as numbers.
	_expect(screen.hud().values() == _hud_values(), "%s: HUD shows Game's meters after the result" % where)
	_check_tree(screen, where)


## The Scoreboard as api.md §5 says for that moment.
func _board(sb: Node, where: String, mode: int, chamber: String, count: String, total: String, quorum: String, fill: float) -> void:
	_expect(sb.visible and sb.mode() == mode, "%s: scoreboard mode %d (got %d)" % [where, mode, sb.mode()])
	_expect(sb.chamber_text() == chamber, "%s: name '%s' (got '%s')" % [where, chamber, sb.chamber_text()])
	_expect(sb.count_text() == count, "%s: count '%s' (got '%s')" % [where, count, sb.count_text()])
	_expect(sb.total_text() == total, "%s: total '%s' (got '%s')" % [where, total, sb.total_text()])
	_expect(sb.quorum_text() == quorum, "%s: quorum '%s' (got '%s')" % [where, quorum, sb.quorum_text()])
	_expect(is_equal_approx(sb.fill_ratio(), fill) and is_equal_approx(sb.shown_fill(), fill), "%s: fill %.3f (got %.3f / %.3f)" % [where, fill, sb.fill_ratio(), sb.shown_fill()])
	var bar := sb.get_node(^"Bar") as Control
	_expect(bar.visible == (mode == MODE_BAR), "%s: bar visible only in BAR mode" % where)
	for c: Color in sb.colors_used():
		_expect(not _green_or_red(c), "%s: scoreboard color %s is green or red (D-156)" % [where, c.to_html()])
	for a in [sb.accessibility_name]:
		for id in METER_IDS:
			_expect(not String(a).contains(Tokens.METER_NAMES[id]), "%s: scoreboard name mentions a meter" % where)


## Settings live, Esc (D-167) and the pause, on the phase-2 card.
func _settings_and_keys(screen: Node, tag: String) -> void:
	var card: Node = screen.card()
	_settings.set_value(&"high_contrast", true)
	_settings.set_value(&"reduce_motion", true)
	_settings.set_value(&"drag_limit", 0.25)
	await _frames(2)
	_expect(card.high_contrast and card.reduce_motion and is_equal_approx(card.drag_limit, 0.25), "%s: settings reach the card live" % tag)
	_expect(screen.scoreboard().high_contrast and screen.scoreboard().reduce_motion, "%s: settings reach the scoreboard" % tag)
	_expect(screen.hud().high_contrast and screen.footer().high_contrast, "%s: settings reach HUD and footer" % tag)
	_expect(_backdrop() == Tokens.HC_BG, "%s: high contrast scene background is black" % tag)
	_settings.set_value(&"high_contrast", false)
	_settings.set_value(&"reduce_motion", false)
	_settings.set_value(&"drag_limit", 0.40)
	await _frames(2)
	_expect(not card.high_contrast and is_equal_approx(card.drag_limit, 0.40), "%s: settings back" % tag)
	_expect(_backdrop() == Tokens.CRISIS_BG, "%s: scene background back to #1C2529" % tag)
	# D-167: Esc hides a revealed option first; then it opens the pause.
	card.grab_focus()
	_key(KEY_RIGHT)
	await _frames(2)
	_expect(card.is_revealed(), "%s: arrow reveals an option" % tag)
	_check_tree(screen, tag + " option revealed")
	_key(KEY_ESCAPE)
	await _frames(2)
	_expect(not card.is_revealed() and not _main.is_paused(), "%s: Esc hides the option, no pause" % tag)
	_key(KEY_ESCAPE)
	await _frames(2)
	_expect(_main.is_paused() and paused, "%s: Esc again opens the pause" % tag)
	_main.close_pause()
	await _frames(2)
	screen.footer().pause_button().pressed.emit()
	await _frames(2)
	_expect(_main.is_paused(), "%s: footer pause button opens the pause" % tag)
	_main.close_pause()
	await _frames(2)
	_expect(not paused and screen.stage() == "phase", "%s: back to the card after the pause" % tag)


# --- The app -------------------------------------------------------------------------------

func _close_app() -> void:
	if _main:
		_main.queue_free()
		_main = null
		paused = false
		await process_frame


## A fresh Main on the real Game, showing the screen of Game's state.
func _open_app(settle: bool = true) -> void:
	await _close_app()
	_main = (load(MAIN_SCENE) as PackedScene).instantiate() as Control
	_main.start_screen = &""
	root.add_child(_main)
	_main.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	_main.size = Vector2(Tokens.VIEWPORT)
	await process_frame
	_main.go_to(_main.screen_for_state(_game.current_state()))
	if settle:
		await _settle()


## F-07: the app closes and reopens ("Continuar" → the saved point).
func _restart_app(tag: String) -> Node:
	var before: Dictionary = _game.impeachment_view()
	var meters_before := _hud_values()
	_game.flow = null
	_expect(_game.resume(), "%s: resume()" % tag)
	await _open_app()
	var screen: Node = _main.current_screen()
	var v: Dictionary = _game.impeachment_view()
	_expect(_main.current_id() == &"impeachment", "%s: reopens on the scene" % tag)
	_expect(String(v["stage"]) == String(before["stage"]) and int(v["phase"]) == int(before["phase"]), "%s: same stage and phase" % tag)
	_expect(int(v["support"]) == int(before["support"]), "%s: same support" % tag)
	if v.has("card"):
		_expect(v["card"]["sides"] == before["card"]["sides"], "%s: same option sides" % tag)
	await _until(func() -> bool: return not screen.is_locked())
	_expect(_hud_values() == meters_before, "%s: nothing replayed on the meters" % tag)
	_expect(screen.hud().values() == meters_before, "%s: HUD at the saved values" % tag)
	_expect(not screen.scoreboard().is_animating(), "%s: no A-16 on restart" % tag)
	return screen


## Seeded runs with the careful policy until the scene opens (not automatic). -1 = none.
func _reach_scene(from_seed: int) -> int:
	for s in range(from_seed, from_seed + MAX_SEEDS):
		_game.new_run(s)
		var guard := 0
		while _game.current_state() != &"impeachment" and _game.current_state() != &"final" and guard < 1000:
			guard += 1
			_act()
		if _game.current_state() == &"impeachment" and not bool(_game.flow.run.impeachment["automatic"]):
			return s
	return -1


func _act() -> void:
	match _game.current_state():
		&"calibration":
			_game.answer_calibration(1)
		&"year_intro":
			_game.continue_from_year()
		&"events":
			_game.continue_from_event()
		&"card":
			_game.choose(_careful_pick())
		&"consequence":
			_game.continue_from_consequence()
		&"learning":
			_game.continue_from_learning()


## test_playthrough's careful policy: keep the lowest meter high.
func _careful_pick() -> int:
	var run: Object = _game.flow.run
	var card: Dictionary = _data.cards[run.current_card["id"]]
	var side_a := int(run.current_card["side_a"])
	var scores := {}
	for side in [-1, 1]:
		var opt: Dictionary = card[CardRules.option_key(side, side_a)]
		var m: Dictionary = run.meters.duplicate()
		MeterRules.apply_effects(m, _game.flow._ints(opt["effects"]), _game.flow._multiplier(), _data.balance, _order)
		scores[side] = m.values().min() * 1000 + m.values().reduce(func(a, v): return a + v, 0)
	return -1 if scores[-1] > scores[1] else 1


## The side whose test passes (want_pass) or fails, from the rules and the meters now.
func _scene_side(want_pass: bool) -> int:
	var imp: Dictionary = _game.flow.run.impeachment
	var card: Dictionary = _data.impeachment_cards[int(imp["phase"]) - 1]
	var a_passes := ImpeachmentRules.test_passes(card["option_a"]["test"], _game.flow.run.meters)
	var b_passes := ImpeachmentRules.test_passes(card["option_b"]["test"], _game.flow.run.meters)
	var take_a := (a_passes or not b_passes) if want_pass else not a_passes
	return int(imp["side_a"]) if take_a else -int(imp["side_a"])


func _hud_values() -> Dictionary:
	var out := {}
	for m: Dictionary in _game.hud():
		out[String(m["id"])] = int(m["value"])
	return out


# --- Helpers ---------------------------------------------------------------------------------

## Visible texts and accessibility names: no side words; no meter value shown as a number.
func _check_tree(node: Node, where: String) -> void:
	var meters := _hud_values()
	var host := _main.find_child("ScreenHost", true, false) as Control
	var frame := host.get_global_rect()
	for n in _all(node):
		if not (n is Control) or not (n as Control).is_visible_in_tree():
			continue
		var c := n as Control
		var shown := ""
		if c is Label:
			shown = (c as Label).text
		elif c is Button:
			shown = (c as Button).text
		for t in [shown, c.accessibility_name, c.accessibility_description]:
			var low := String(t).to_lower()
			for w in SIDE_WORDS:
				if low.contains(w):
					_expect(false, "%s: side word '%s' in %s" % [where, w, c.name])
			for id in METER_IDS:
				var name: String = Tokens.METER_NAMES[id]
				if String(t).contains("%s %d" % [name, meters[id]]) or String(t).contains("%s: %d" % [name, meters[id]]):
					_expect(false, "%s: %s shows the value of %s" % [where, c.name, name])
		if c is Label and c.name != &"CardTitle" and c.name != &"OptionLabel":
			var r := c.get_global_rect()
			if r.size.x > 0.0 and (r.position.x < frame.position.x - 0.5 or r.end.x > frame.end.x + 0.5):
				_expect(false, "%s: %s outside the column (%s)" % [where, c.name, r])
		if c is BaseButton:
			_expect(c.size.x >= Tokens.TOUCH_MIN - 0.5 and c.size.y >= Tokens.TOUCH_MIN - 0.5, "%s: %s smaller than 48" % [where, c.name])
	# HUD names: "Dignidade, faixa 3 de 5", never the number (D-156).
	var band_name := RegEx.create_from_string("^[^0-9]+, faixa [1-5] de 5$")
	for m: Control in (node.find_child("Hud", true, false) as Control).get_children():
		if m.has_method(&"band"):
			_expect(band_name.search(m.accessibility_name) != null, "%s: meter name without number (%s)" % [where, m.accessibility_name])


func _green_or_red(c: Color) -> bool:
	if c.s < 0.3 or c.v < 0.2:
		return false
	return c.h < 0.06 or c.h > 0.94 or (c.h > 0.2 and c.h < 0.45)


func await_board(sb: Node) -> void:
	if sb.is_animating():
		sb.finish_animation()


func _left_screen(screen: Node) -> bool:
	return not is_instance_valid(screen) or not screen.is_inside_tree() or screen.stage() == "leaving"


func _backdrop() -> Color:
	var box := _bg().get_theme_stylebox(&"panel") as StyleBoxFlat
	return box.bg_color if box else Color()


func _bg() -> PanelContainer:
	return _main.find_child("Bg", true, false) as PanelContainer


func _until(cond: Callable, timeout: float = 8.0) -> bool:
	var t0 := Time.get_ticks_msec()
	while not cond.call():
		if Time.get_ticks_msec() - t0 > int(timeout * 1000.0):
			return false
		await process_frame
	return true


func _settle() -> void:
	await process_frame
	var guard := 0
	while _main.is_busy() and guard < 2000:
		guard += 1
		await process_frame
	await process_frame
	await process_frame


func _frames(n: int) -> void:
	for i in n:
		await process_frame


func _key(code: Key) -> void:
	var down := InputEventKey.new()
	down.keycode = code
	down.physical_keycode = code
	down.pressed = true
	root.push_input(down)
	var up := down.duplicate() as InputEventKey
	up.pressed = false
	root.push_input(up)


## A tap at a canvas position (the headless window is not 390 × 844: map through the stretch).
func _click(pos: Vector2) -> void:
	var at := root.get_final_transform() * pos
	for pressed in [true, false]:
		var b := InputEventMouseButton.new()
		b.button_index = MOUSE_BUTTON_LEFT
		b.pressed = pressed
		b.position = at
		b.global_position = at
		root.push_input(b)


func _tap_middle(c: Control) -> void:
	_click(c.get_global_rect().get_center())


func _texts(node: Node) -> PackedStringArray:
	var out: PackedStringArray = []
	for n in _all(node):
		if n is Label and (n as Label).is_visible_in_tree():
			out.append((n as Label).text)
	return out


func _all(node: Node) -> Array[Node]:
	var out: Array[Node] = [node]
	for child in node.get_children():
		out.append_array(_all(child))
	return out


func _expect(cond: bool, what: String) -> void:
	if not cond:
		_failures.append(what)


func _finish(test_name: String) -> void:
	if _failures.is_empty():
		print("%s: OK" % test_name)
		quit(0)
	else:
		for x in _failures.slice(0, 60):
			printerr("FAIL: " + x)
		quit(1)
