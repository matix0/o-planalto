extends SceneTree
## Headless: godot --headless --path jogo -s res://tests/test_shell.gd
## App shell (lote C): Main with a fake Game. Navigation title → tutorial →
## calibration (placeholder) → pause → settings → back → abandon → title →
## settings → about → placeholder; confirm modal (variant A) and pause open/close;
## Esc rule (D-167); toasts (C-21); live theme; PC column (D-171) and safe area;
## no side words (D-084); 48 px targets; icon-only buttons have a name.
## Settings go to a temporary file; the real user://settings.cfg is not written.

const MAIN_SCENE := "res://scenes/main.tscn"
const TEST_SETTINGS := "user://test_shell_settings.cfg"
const SIDE_WORDS := ["esquerda", "direita", "◀", "▶", "←", "→"]
const TUTORIAL_TEXTS := [
	"Você é o Presidente. Cada carta traz um problema. Arraste para um lado ou para o outro para decidir.",
	"No topo estão os 8 medidores do país. Se um deles zerar, seu mandato acaba na hora.",
	"Depois de decidir, pontos mostram quais medidores mudaram. Toda escolha tem custo.",
	"Depois de cada decisão, a Carta de Aprendizado explica o que está por trás. Toque em 'saiba mais' para ver dados e fontes.",
]


## Same API as the Game autoload contract, without touching user:// saves.
class FakeGame extends Node:
	signal state_changed(state: StringName)
	signal toast_requested(kind: StringName)
	var save := false
	var readable := true
	var state: StringName = &"start"
	var calls: PackedStringArray = []

	func has_save() -> bool:
		return save

	func new_run(_seed: int = -1) -> void:
		calls.append("new_run")
		save = true
		state = &"calibration"
		state_changed.emit(state)

	func resume() -> bool:
		calls.append("resume")
		if not readable:
			save = false
			return false
		state = &"card"
		return true

	func abandon() -> void:
		calls.append("abandon")
		state = &"start" if state == &"calibration" else &"final"
		save = false
		state_changed.emit(state)

	func current_state() -> StringName:
		return state


var _failures: PackedStringArray = []
## Untyped on purpose: scripts that use autoloads cannot be referenced
## statically from a `-s` script (autoload names are not globals yet when it compiles).
var _main: Control
var _fake: FakeGame
var _settings: Node


func _initialize() -> void:
	_run.call_deferred()


func _run() -> void:
	# Watchdog: a broken await must fail the run, not hang it.
	create_timer(120.0).timeout.connect(func() -> void:
		printerr("FAIL: test_shell timed out")
		quit(1))
	_settings = root.get_node(^"Settings")
	var real_path: String = _settings.storage_path
	var real_existed := FileAccess.file_exists(real_path)
	var real_mtime := FileAccess.get_modified_time(real_path) if real_existed else 0
	_settings.storage_path = TEST_SETTINGS
	_settings.reset_defaults(false)

	_fake = FakeGame.new()
	root.add_child(_fake)
	_main = (load(MAIN_SCENE) as PackedScene).instantiate() as Control
	if _main == null or not _main.has_method(&"go_to"):
		_expect(false, "main.tscn did not load as the app shell")
		_finish("test_shell")
		return
	_main.game = _fake
	_main.force_placeholder = [&"calibration", &"game", &"impeachment", &"final"]   # fake Game: shell only
	root.add_child(_main)
	# Headless windows are not 390 wide: pin Main to the phone canvas (D-170).
	_main.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	_main.size = Vector2(Tokens.VIEWPORT)
	await _settle()

	await _title_checks()
	await _new_term_and_tutorial()
	await _pause_checks()
	await _abandon_checks()
	await _settings_checks()
	await _about_checks()
	await _placeholder_and_esc_rule()
	await _layout_checks()

	# Cleanup.
	paused = false
	_main.queue_free()
	_fake.queue_free()
	await process_frame
	if FileAccess.file_exists(TEST_SETTINGS):
		DirAccess.remove_absolute(ProjectSettings.globalize_path(TEST_SETTINGS))
	_settings.storage_path = real_path
	_expect(FileAccess.file_exists(real_path) == real_existed, "real settings file existence unchanged")
	if real_existed:
		_expect(FileAccess.get_modified_time(real_path) == real_mtime, "real settings file not rewritten")
	_finish("test_shell")


# --- Steps --------------------------------------------------------------------

func _title_checks() -> void:
	_expect(_main.current_id() == &"title", "starts on title (got %s)" % _main.current_id())
	var title: Node = _main.current_screen()
	var b: Array = title.buttons()
	_expect(not b[0].visible, "T-01.1: Continuar hidden without save")
	_expect(b[1].theme_type_variation == &"Primary", "T-01.1: Novo mandato is Primary")
	_expect(_focus() == b[1], "T-01.1: focus on Novo mandato")
	_check_tree(title, "title")
	var warnings := title.find_child("Warnings", true, false) as Control
	_expect(warnings != null and warnings.accessibility_name == "Avisos de conteúdo: Violência policial, Racismo, Genocídio, Ditadura e tortura, Nazifascismo, Políticos reais. O jogo fala de fome e morte sem eufemismo.", "C-18 group name")
	_expect(warnings != null and warnings.focus_mode == Control.FOCUS_NONE, "C-18 not focusable")
	# Esc on the title: no pause there (gdd 10 §3.3).
	_esc()
	await _frames(2)
	_expect(not _main.is_paused(), "no pause on title")
	# With a save: Continuar primary, Novo mandato secondary (T-01.2).
	_fake.save = true
	title.refresh(true)
	await _frames(2)
	_expect(b[0].visible and b[0].theme_type_variation == &"Primary", "T-01.2: Continuar Primary")
	_expect(b[1].theme_type_variation == &"Secondary", "T-01.2: Novo mandato Secondary")
	_expect(_focus() == b[0], "T-01.2: focus on Continuar")
	_check_tree(title, "title with save")
	# Unreadable save (T-01.4): toast on top, Continuar disappears.
	_fake.readable = false
	b[0].pressed.emit()
	await _frames(2)
	_expect(_main.toast().is_showing(), "T-01.4: toast shown")
	_expect(_main.toast().message() == "Não foi possível continuar o mandato", "T-01.4: toast text")
	_expect(not b[0].visible, "T-01.4: Continuar hidden after unreadable save")
	_expect(_main.current_id() == &"title", "T-01.4: stays on title")
	# save_failed from Game (C-21, T-14.1).
	_fake.toast_requested.emit(&"save_failed")
	await _frames(1)
	_expect(_main.toast().message() == _main.SAVE_FAILED_TEXT, "C-21: save_failed text")
	_main.toast().hide_now()


func _new_term_and_tutorial() -> void:
	var title: Node = _main.current_screen()
	var b: Array = title.buttons()
	_fake.save = true
	_fake.readable = true
	title.refresh(true)
	await _frames(2)
	# Novo mandato with a save → confirm modal, variant A (cancel is the primary).
	b[1].grab_focus()
	b[1].pressed.emit()
	await _frames(3)
	var modal: Control = _main.modal()
	_expect(modal.is_open(), "T-01.3: modal open")
	var mb: Array = modal.buttons()
	_expect(mb[0].theme_type_variation == &"Primary" and mb[0].text == modal.DEFAULT_CANCEL, "C-14 variant A: cancel is primary")
	_expect(_focus() == mb[0], "C-14: initial focus on cancel")
	_check_tree(modal, "modal")
	# Focus is trapped in the modal (loop; side keys stay).
	_key(KEY_RIGHT)
	await _frames(1)
	_expect(_focus() == mb[0], "side key keeps the focus in the modal")
	_key(KEY_DOWN)
	await _frames(1)
	_expect(_focus() == mb[1], "down goes to confirm")
	_key(KEY_DOWN)
	await _frames(1)
	_expect(_focus() == mb[0], "focus loops back to cancel")
	_esc()
	await _frames(2)
	_expect(not modal.is_open(), "Esc cancels the modal")
	_expect(not _fake.calls.has("new_run"), "cancel keeps the save")
	_expect(_focus() == b[1], "focus back on Novo mandato")
	b[1].pressed.emit()
	await _frames(2)
	modal.confirm()
	await _settle()
	_expect(_fake.calls.has("new_run"), "confirm starts a new run")
	_expect(_main.current_id() == &"tutorial", "first run goes to the tutorial (got %s)" % _main.current_id())
	# Tutorial: 4 steps with progress n/4 before the segments.
	var tut: Node = _main.current_screen()
	_expect(not tut.allows_pause(), "no pause in the tutorial")
	for i in 4:
		await _frames(3)
		_expect(tut.step() == i + 1, "tutorial step %d" % (i + 1))
		_expect(tut.coach_text() == TUTORIAL_TEXTS[i], "tutorial text %d (docs/16 Parte B)" % (i + 1))
		var p: Control = tut.progress()
		_expect(p.count_text() == "%d/4" % (i + 1), "progress %d/4" % (i + 1))
		_expect(p.accessibility_name == "Passo %d de 4" % (i + 1), "progress name step %d" % (i + 1))
		_expect(p.get_child(0).name == "Count", "C-19: n/N before the segments")
		_expect(tut.spotlight_rect().size.x > 0.0 and tut.spotlight_rect().size.y > 0.0, "spotlight on step %d" % (i + 1))
		_check_tree(tut, "tutorial step %d" % (i + 1))
		var adv := tut.find_child("AdvanceButton", true, false) as Button
		_expect(_focus() == adv, "focus on advance (step %d)" % (i + 1))
		adv.pressed.emit()
		await _frames(2)
		if i < 3:
			while tut.get("_changing"):
				await process_frame
	await _settle()
	_expect(_settings.tutorial_seen, "tutorial_seen saved")
	_expect(_main.current_id() == &"calibration", "tutorial ends in calibration (got %s)" % _main.current_id())
	var ph: Node = _main.current_screen()
	var labels := _texts(ph)
	_expect(labels.has("Em construção") and labels.has("Tela: calibration"), "calibration placeholder")


func _pause_checks() -> void:
	_expect(_main.current_screen().allows_pause(), "calibration allows pause")
	var pause_events: Array[bool] = []
	_main.pause_changed.connect(func(open: bool) -> void: pause_events.append(open))
	_esc()
	await _frames(3)
	var pm: Control = _main.pause_menu()
	_expect(_main.is_paused() and paused, "Esc opens the pause and pauses the tree")
	_expect(pause_events.size() == 1 and pause_events[0], "pause_changed(true)")
	var pb: Array = pm.buttons()
	_expect(_focus() == pb[0], "T-11: focus on Continuar")
	_expect(pb[0].theme_type_variation == &"Primary" and pb[1].theme_type_variation == &"Secondary", "T-11 button styles")
	_check_tree(pm, "pause")
	_esc()
	await _frames(2)
	_expect(not _main.is_paused() and not paused, "Esc in the menu = Continuar")
	# Pause → Configurações → back reopens the pause.
	_main.open_pause()
	await _frames(2)
	pb[1].pressed.emit()
	await _settle()
	_expect(_main.current_id() == &"settings" and not paused, "pause → settings (unpaused)")
	var ids: Array = _main.stack_ids()
	_expect(ids.size() == 2 and ids[0] == &"calibration" and ids[1] == &"settings", "settings pushed over calibration (%s)" % [ids])
	_esc()
	await _settle()
	await _frames(2)
	_expect(_main.current_id() == &"calibration", "settings closes back to calibration")
	_expect(_main.is_paused(), "pause menu reopened after settings")
	pb[0].pressed.emit()
	await _frames(2)
	_expect(not _main.is_paused() and not paused, "Continuar closes the pause")


func _abandon_checks() -> void:
	var pm: Control = _main.pause_menu()
	var pb: Array = pm.buttons()
	_main.open_pause()
	await _frames(2)
	pb[2].pressed.emit()
	await _frames(2)
	var modal: Control = _main.modal()
	_expect(modal.is_open() and pm.is_covered(), "T-11.2: confirm over the covered pause")
	_expect(modal.title_text() == _main.ABANDON_TITLE, "abandon modal title [a definir]")
	_esc()
	await _frames(2)
	_expect(not modal.is_open() and pm.is_open() and not pm.is_covered(), "cancel returns to the pause")
	_expect(_focus() == pb[2], "focus back on Abandonar mandato")
	pb[2].pressed.emit()
	await _frames(2)
	modal.confirm()
	await _settle()
	_expect(_fake.calls.has("abandon"), "Game.abandon() called")
	_expect(not paused and not _main.is_paused(), "unpaused after abandon")
	_expect(_main.current_id() == &"title", "abandon in calibration → title (got %s)" % _main.current_id())


func _settings_checks() -> void:
	var title: Node = _main.current_screen()
	var b: Array = title.buttons()
	b[2].grab_focus()
	b[2].pressed.emit()
	await _settle()
	_expect(_main.current_id() == &"settings", "title → settings")
	var st: Node = _main.current_screen()
	var close := st.find_child("CloseButton", true, false) as Button
	_expect(_focus() == close, "T-12: focus on close")
	_expect(close.accessibility_name != "", "close has an accessibility name")
	_check_tree(st, "settings default")
	var size_sel: Node = st.find_child("TextSize", true, false)
	_expect(size_sel.selected_step() == 18, "selector shows 18 by default")
	var opts: Array = size_sel.buttons()
	_expect(opts.size() == 4 and opts[1].button_pressed, "4 options, 18 marked")
	opts[3].button_pressed = true
	await _frames(2)
	_expect(_settings.text_step == 24, "selector sets 24")
	_expect(_main.theme.get_font_size(&"font_size", &"Body") == Tokens.type_size("Body", 24), "theme rebuilt at 24")
	var rm: Node = st.find_child("ReduceMotion", true, false)
	var hc: Node = st.find_child("HighContrast", true, false)
	rm.switch().button_pressed = true
	hc.switch().button_pressed = true
	await _frames(2)
	_expect(_settings.reduce_motion and _settings.high_contrast, "switches set the settings")
	var bg := _main.find_child("Bg", true, false) as PanelContainer
	var bg_box := bg.get_theme_stylebox(&"panel") as StyleBoxFlat
	_expect(bg_box != null and bg_box.bg_color == Tokens.HC_BG, "high contrast background is black")
	var sens: Node = st.find_child("Sensitivity", true, false)
	_expect(sens.slider().accessibility_name == "Sensibilidade do arraste: 40%", "slider name 40%")
	sens.slider().value = 0.25
	await _frames(1)
	_expect(is_equal_approx(_settings.drag_limit, 0.25), "slider sets drag_limit 0.25")
	_expect(sens.slider().accessibility_name == "Sensibilidade do arraste: 25%", "slider name 25%")
	await _frames(2)
	_check_tree(st, "settings 24 px + toggles")
	# Arrow keys move the selection inside the size group.
	opts[3].grab_focus()
	await _frames(1)
	_key(KEY_LEFT)
	await _frames(2)
	_expect(_settings.text_step == 20, "arrow key selects 20")
	_settings.set_value(&"text_step", 18)
	_settings.set_value(&"reduce_motion", false)
	_settings.set_value(&"high_contrast", false)
	_settings.set_value(&"drag_limit", 0.40)
	await _frames(1)
	_expect(size_sel.selected_step() == 18, "selector follows settings")
	_esc()
	await _settle()
	await _frames(2)
	_expect(_main.current_id() == &"title", "Esc closes settings")
	_expect(_focus() == b[2], "focus back on Configurações")


func _about_checks() -> void:
	# D-198: "Sobre" left the title; credits open from Configurações.
	var title: Node = _main.current_screen()
	var b: Array = title.buttons()
	_expect(b.size() == 3 and not title.get_node("%AboutButton").visible, "no Sobre on the title (D-198)")
	b[2].pressed.emit()
	await _settle()
	var credits: Button = _main.current_screen().find_child("CreditsButton", true, false)
	_expect(credits != null, "Configurações → Créditos e licenças")
	credits.grab_focus()
	credits.pressed.emit()
	await _settle()
	_expect(_main.current_id() == &"about", "settings → about")
	var ab: Node = _main.current_screen()
	var texts := _texts(ab)
	for t in ["Idealização", "Mateus", "Professor Alisson", "Godot 4.7", "Poppins e Inter — Google Fonts, licença OFL"]:
		_expect(texts.has(t), "about shows '%s'" % t)
	_expect(texts.has("Copyright 2020 The Inter Project Authors (https://github.com/rsms/inter)"), "Inter OFL notice")
	_expect(texts.has("Copyright 2020 The Poppins Project Authors (https://github.com/itfoundry/Poppins)"), "Poppins OFL notice")
	# D-188: the real asset list (every file of assets/ in a group, no Kenney) and the Godot notice.
	var groups: Array = ab.ASSETS
	for g: Dictionary in groups:
		_expect(texts.has(g["text"]), "about lists '%s'" % g["text"])
	for f in ab.asset_files():
		_expect(ab.asset_group(f) >= 0, "asset %s is in the about list" % f)
	_expect(ab.asset_files().size() >= 20, "asset_files sees the assets")
	for t in texts:
		_expect(not t.contains("Kenney") and not t.contains("a definir"), "about without '%s'" % t.left(40))
	var folds: Array = ab.folds()
	_expect(folds.size() == 4 and folds.all(func(f): return f.folded), "OFL and Godot texts folded")
	var third_party: String = ab.third_party_text()
	_expect(third_party.contains("The FreeType Project — FTL") and third_party.contains("Mbed TLS — Apache-2.0"), "third-party components listed")
	folds[2].folded = false
	folds[3].folded = false
	await _frames(2)
	var open_texts := _texts(ab)
	_expect(open_texts.has(Engine.get_license_text().strip_edges()), "Godot MIT notice (Engine.get_license_text)")
	_expect(open_texts.has(third_party), "third-party list shown when unfolded")
	folds[2].folded = true
	folds[3].folded = true
	var close := ab.find_child("CloseButton", true, false) as Button
	_expect(_focus() == close, "T-13: focus on close")
	_check_tree(ab, "about")
	# Larger text and an open license still fit the column (no horizontal overflow).
	_settings.set_value(&"text_step", 24)
	folds[0].folded = false
	folds[2].folded = false
	await _frames(3)
	_check_tree(ab, "about 24 px")
	folds[0].folded = true
	folds[2].folded = true
	_settings.set_value(&"text_step", 18)
	await _frames(2)
	close.pressed.emit()
	await _settle()
	await _frames(2)
	_expect(_main.current_id() == &"settings", "about closes to settings")
	_main.current_screen().close()
	await _settle()
	_expect(_main.current_id() == &"title", "settings closes to title")


func _placeholder_and_esc_rule() -> void:
	_expect(_main.screen_for_state(&"card") == &"game" and _main.screen_for_state(&"final") == &"final" and _main.screen_for_state(&"start") == &"title", "screen_for_state")
	_main.go_to(&"game")
	await _settle()
	var ph: Node = _main.current_screen()
	_expect(_texts(ph).has("Tela: game"), "missing game screen → placeholder")
	# D-167: a control that uses Esc keeps the pause closed.
	var consumer := Control.new()
	consumer.focus_mode = Control.FOCUS_ALL
	var used := [0]
	consumer.gui_input.connect(func(e: InputEvent) -> void:
		if e.is_action_pressed(&"ui_cancel"):
			used[0] += 1
			consumer.accept_event())
	ph.add_child(consumer)
	consumer.grab_focus()
	await _frames(1)
	_esc()
	await _frames(2)
	_expect(used[0] == 1 and not _main.is_paused(), "D-167: Esc used by the screen does not pause")
	consumer.queue_free()
	await _frames(1)
	_esc()
	await _frames(2)
	_expect(_main.is_paused(), "D-167: unused Esc opens the pause")
	_main.close_pause()
	await _frames(1)
	_main.go_to(&"final")
	await _settle()
	_expect(_texts(_main.current_screen()).has("Tela: final"), "missing final screen → placeholder")
	_esc()
	await _frames(2)
	_expect(not _main.is_paused(), "no pause on the final screen")
	_main.go_to(&"no_such_screen")
	await _settle()
	_expect(_main.current_screen() != null and _texts(_main.current_screen()).has("Tela: no_such_screen"), "unknown id → placeholder")
	var home: Button = _main.current_screen().find_child("HomeButton", true, false)
	home.pressed.emit()
	await _settle()
	_expect(_main.current_id() == &"title", "placeholder → title")


func _layout_checks() -> void:
	# PC: 1500×844 canvas → column 430 centered (D-171).
	_main.size = Vector2(1500, 844)
	await _frames(2)
	_expect(is_equal_approx(_main.column_width(), 430.0), "PC column 430 (got %s)" % _main.column_width())
	var host := _main.find_child("ScreenHost", true, false) as Control
	_expect(is_equal_approx(host.size.x, 430.0) and is_equal_approx(host.global_position.x, 535.0), "column centered (x %s)" % host.global_position.x)
	_main.size = Vector2(390, 844)
	await _frames(2)
	_expect(is_equal_approx(_main.column_width(), 390.0), "phone column 390")
	# Safe area reaches the screen margins (T-01: safe + esp-24).
	_main.debug_safe_insets = Vector4(0, 48, 0, 32)
	_main.refresh_layout()
	await _frames(2)
	var sa: MarginContainer = _main.current_screen().find_child("SafeArea", true, false)
	_expect(sa.get_theme_constant(&"margin_top") == 72 and sa.get_theme_constant(&"margin_bottom") == 56, "safe area + esp-24 on the title")
	_main.debug_safe_insets = Vector4(-1, 0, 0, 0)
	_main.refresh_layout()
	await _frames(1)


# --- Helpers ------------------------------------------------------------------

func _settle() -> void:
	var guard := 0
	await process_frame
	while _main.is_busy() and guard < 600:
		guard += 1
		await process_frame
	_expect(guard < 600, "transition finished")
	await process_frame
	await process_frame


func _frames(n: int) -> void:
	for i in n:
		await process_frame


func _esc() -> void:
	_key(KEY_ESCAPE)


func _key(code: Key) -> void:
	var down := InputEventKey.new()
	down.keycode = code
	down.physical_keycode = code
	down.pressed = true
	root.push_input(down)
	var up := down.duplicate() as InputEventKey
	up.pressed = false
	root.push_input(up)


func _focus() -> Control:
	return root.gui_get_focus_owner()


## Visible texts (Label, Button, FoldableContainer title) under a node.
func _texts(node: Node) -> PackedStringArray:
	var out: PackedStringArray = []
	for n in _all(node):
		if n is Label and (n as Label).is_visible_in_tree():
			out.append((n as Label).text)
		elif n is Button and (n as Button).is_visible_in_tree():
			out.append((n as Button).text)
		elif n is FoldableContainer and (n as FoldableContainer).is_visible_in_tree():
			out.append((n as FoldableContainer).title)
	return out


## D-084 (no side words), 48 px targets, names on icon-only buttons, and
## nothing wider than its frame — the screen column, or Main for overlays
## (an overflowing column shifts the whole layout). The tutorial Dim covers
## the window on purpose.
func _check_tree(node: Node, where: String) -> void:
	var host := _main.find_child("ScreenHost", true, false) as Control
	var frame: Rect2 = host.get_global_rect() if host.is_ancestor_of(node) else _main.get_global_rect()
	for n in _all(node):
		if not (n is Control) or not (n as Control).is_visible_in_tree():
			continue
		var c := n as Control
		var r := c.get_global_rect()
		if c.name != &"Dim" and (r.position.x < frame.position.x - 0.5 or r.end.x > frame.end.x + 0.5):
			_expect(false, "%s: %s outside its frame (%s, frame %s)" % [where, c.name, r, frame])
		var shown := ""
		if c is Label:
			shown = (c as Label).text
		elif c is Button:
			shown = (c as Button).text
		elif c is FoldableContainer:
			shown = (c as FoldableContainer).title
		for w in SIDE_WORDS:
			if shown.to_lower().contains(w) or c.accessibility_name.to_lower().contains(w):
				_expect(false, "%s: side word '%s' in %s" % [where, w, c.name])
		if c is BaseButton:
			_expect(c.size.x >= Tokens.TOUCH_MIN - 0.5 and c.size.y >= Tokens.TOUCH_MIN - 0.5, "%s: %s is %s (< 48)" % [where, c.name, c.size])
			if c is Button and (c as Button).text == "" and not (c is CheckButton):
				_expect(c.accessibility_name != "", "%s: icon button %s has no name" % [where, c.name])
		if c is HSlider:
			_expect(c.size.y >= Tokens.TOUCH_MIN - 0.5, "%s: slider %s < 48 tall" % [where, c.name])


func _all(node: Node) -> Array[Node]:
	var out: Array[Node] = [node]
	for child in node.get_children():
		out.append_array(_all(child))
	return out


func _expect(cond: bool, what: String) -> void:
	if not cond:
		_failures.append(what)


func _finish(name: String) -> void:
	if _failures.is_empty():
		print("%s: OK" % name)
		quit(0)
	else:
		for x in _failures:
			printerr("FAIL: " + x)
		quit(1)
