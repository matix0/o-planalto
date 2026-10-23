extends SceneTree
## Headless: godot --headless --path jogo -s res://tests/test_game_screen.gd
## Lote D with the real Game (seeded run, saves in a temporary file): calibration (T-03) →
## year card (T-04) → cards (T-06) → effects (T-07) → consequence (T-07.3) → learning card
## (T-08) → Year 2 → event notice (T-05) → card; Esc rule (D-167), tap outside (D-145), pause
## button during the consequence, live settings, P1 at 150%; resumed run shows the
## consequence read-only without replaying effects (gdd 10 §5); through the title's "Continuar",
## a run closed on an event notice or in the calibration comes back where it was; a meter at 0
## through the screens ends on the final screen (P-014 etapa 6). No side words (D-084) and
## no meter numbers in visible text. LearningSheet / ConsequenceLine / YearCard / EventNotice
## API checks on standalone instances.
## Untyped references on purpose: scripts that use autoloads cannot be named statically from
## a `-s` script (autoload names are not globals yet when it compiles).

const MAIN_SCENE := "res://scenes/main.tscn"
const SHEET_SCENE := "res://scenes/components/learning_sheet.tscn"
const LINE_SCENE := "res://scenes/components/consequence_line.tscn"
const YEAR_SCENE := "res://scenes/components/year_card.tscn"
const EVENT_SCENE := "res://scenes/components/event_notice.tscn"
const TEST_SETTINGS := "user://test_game_screen_settings.cfg"
const TEST_SAVE := "user://test_game_screen_save.json"
## Calibration and cards always on side +1: this seed reaches the events of Year 2 after
## 7 cards (fictitious data, D-135).
const RUN_SEED := 2
const SIDE_WORDS := ["esquerda", "direita", "◀", "▶"]   # ← → allowed on the option previews (D-202)
const TIME_SCALE := 4.0

var _failures: PackedStringArray = []
var _main: Control
var _game: Node
var _settings: Node
var _saves: Node
var _real_settings_path := ""
var _real_save_path := ""
var _cards_played := 0


func _initialize() -> void:
	_run.call_deferred()


func _run() -> void:
	create_timer(240.0, true, false, true).timeout.connect(func() -> void:
		printerr("FAIL: test_game_screen timed out (%s)" % ", ".join(_failures))
		quit(1))
	await process_frame
	# Scenario seeds and events are tuned to the fictitious fixture deck (D-139, D-194).
	var gdata: Node = root.get_node(^"GameData")
	gdata.data_dir = "res://tests/fixtures/data/"
	gdata.load_all()
	# Headless windows are 64×64: GUI picking (the pause button click) needs the phone canvas.
	root.size = Vector2i(Tokens.VIEWPORT)
	await process_frame
	_settings = root.get_node(^"Settings")
	_game = root.get_node(^"Game")
	_saves = root.get_node(^"SaveManager")
	_real_settings_path = _settings.storage_path
	_settings.storage_path = TEST_SETTINGS
	_settings.reset_defaults(false)
	_real_save_path = _saves.path
	_saves.path = TEST_SAVE
	Engine.time_scale = TIME_SCALE

	await _component_checks()

	_game.new_run(RUN_SEED)
	await _new_main()
	_main.go_to(&"calibration")
	await _settle()
	await _calibration_checks()
	await _year_card_checks(1, "Lua de Mel")
	await _first_card_checks()
	await _play_until_year(2)
	await _year_card_checks(2, "Realidade Bate")
	await _event_checks()
	await _settings_checks()
	await _resume_checks()
	await _meter_zero_checks()
	await _resume_in_calibration_checks()

	# Cleanup.
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
	_finish("test_game_screen")


# --- Steps -----------------------------------------------------------------------------------

func _calibration_checks() -> void:
	_expect(_main.current_id() == &"calibration", "starts on calibration (got %s)" % _main.current_id())
	var screen: Node = _main.current_screen()
	var card: Control = screen.card()
	var footer: Control = screen.footer()
	_expect(screen.allows_pause(), "T-03: pause allowed")
	_expect(not Array(_texts(screen)).any(func(t: String) -> bool: return t.contains("HUD")), "T-03: no HUD box during the calibration (D-183)")
	for i in 6:
		var view: Dictionary = _game.calibration_view()
		_expect(footer.display_text() == "Alinhamento · %d/6" % (i + 1), "C-19 progress %d/6 (got %s)" % [i + 1, footer.display_text()])
		_expect(card.accessibility_name == "Pergunta %d de 6: %s" % [i + 1, view.question], "T-03.1 card name %d" % (i + 1))
		_expect(_texts(card).has(String(view.question)), "T-03.1 question on the card face")
		_check_texts(screen, "calibration %d" % (i + 1))
		if i == 0:
			# D-167: Esc cancels a revealed answer first, then opens the pause.
			_reveal(card, 1)
			_expect(card.is_revealed(), "T-03.2 keyboard reveals an answer")
			_check_texts(screen, "calibration revealed")
			_expect(_main.handle_cancel() and not card.is_revealed() and not _main.is_paused(), "D-167: 1st Esc cancels the answer")
			_expect(_main.handle_cancel() and _main.is_paused(), "D-167: 2nd Esc opens the pause")
			_main.close_pause()
			await _frames(2)
			# D-145: a tap outside the card cancels a revealed answer.
			_reveal(card, -1)
			_click(Vector2(195, 30))
			await _frames(2)
			_expect(not card.is_revealed(), "D-145: tap outside cancels the answer")
		_choose(card, 1)
		if i < 5:
			_expect(await _wait(func() -> bool: return footer.display_text() == "Alinhamento · %d/6" % (i + 2), 5.0), "next question %d" % (i + 2))
	_expect(await _wait(func() -> bool: return _main.current_id() == &"game" and not _main.is_busy(), 6.0), "A-23: after 6 answers → game screen")


func _year_card_checks(year: int, phase: String) -> void:
	_expect(await _wait(func() -> bool: return _screen_step() == &"year", 6.0), "Year %d: year card step" % year)
	var screen: Node = _main.current_screen()
	var yc: Control = screen.year_card()
	_expect(yc.visible, "C-16 visible (Year %d)" % year)
	var texts: PackedStringArray = yc.display_texts()
	_expect(texts.has("Ano %d" % year) and texts.has(phase), "C-16 texts Ano %d · %s (got %s)" % [year, phase, texts])
	_expect(not screen.speaker().visible and not screen.card().visible, "T-04: no speaker, no card under the year card")
	_check_texts(screen, "year card %d" % year)
	_expect(await _wait(func() -> bool: return _screen_step() == &"card" or _screen_step() == &"events", 6.0), "Year %d: the card or the events follow by themselves" % year)


func _first_card_checks() -> void:
	var screen: Node = _main.current_screen()
	var view: Dictionary = _game.card_view()
	var card: Control = screen.card()
	_expect(screen.step() == &"card" and card.visible, "T-06.1 card shown")
	_expect(screen.speaker().speaker_name() == String(view.speaker), "C-03 speaker name")
	_expect(screen.problem_label().text == String(view.problem), "T-06.1 problem text")
	_expect(screen.footer().display_text() == String(view.footer), "C-07 footer %s" % view.footer)
	_expect(card.accessibility_name == "Carta: %s" % view.title, "card accessible name")
	_expect(_values(screen.hud()) == _game_values(), "HUD shows the Game values")
	_check_texts(screen, "T-06.1")
	var ring := card.find_child("FocusRing", true, false) as Control
	_expect(not card.has_focus() and not ring.visible, "touch/mouse so far: the card rests without the focus ring")
	# Keyboard (D-156): an arrow focuses the card and reveals that half; D-167 on the card.
	_key(KEY_LEFT)
	await _frames(2)
	_expect(card.has_focus() and card.is_revealed() and card.revealed_side() == -1, "arrow key focuses the card and reveals")
	_check_texts(screen, "T-06.9 revealed")
	_expect(_main.handle_cancel() and not card.is_revealed(), "D-167: Esc cancels the revealed half")
	_reveal(card, 1)
	_click(Vector2(195, 40))
	await _frames(2)
	_expect(not card.is_revealed(), "D-145: tap on the HUD cancels the revealed half")
	# Decision → effects → consequence (T-07).
	var before := _game_values()
	_choose(card, 1)
	_cards_played += 1
	await _frames(2)
	_expect(screen.step() == &"resolving", "T-06.5: resolving after the release")
	_expect(screen.is_hud_busy() or before == _game_values(), "T-07.1: HUD animating the effects")
	_check_texts(screen, "T-07.1")
	_expect(await _wait(func() -> bool: return _screen_step() == &"consequence", 6.0), "T-07.3 consequence after the HUD")
	var cview: Dictionary = _game.consequence_view()
	var line: Control = screen.consequence()
	_expect(line.visible and line.is_waiting(), "T-07.3 waits for the tap")
	_expect(line.text() == String(cview.text), "T-07.3 text from the Game")
	_expect(line.accessibility_name == String(cview.text), "T-07.3 accessible name = sentence")
	_expect(not card.visible, "card hidden after A-06")
	_expect(_values(screen.hud()) == _game_values(), "T-07: HUD ends on the Game values")
	_check_texts(screen, "T-07.3")
	# The pause button keeps its click; the tap anywhere else continues.
	var pause_btn: Control = screen.footer().pause_button()
	_click(pause_btn.get_global_rect().get_center())
	await _frames(3)
	_expect(_main.is_paused(), "pause button works during the consequence")
	_expect(line.is_waiting(), "the pause click does not continue")
	_main.close_pause()
	await _frames(3)
	_click(Vector2(195, 420))
	_expect(await _wait(func() -> bool: return _screen_step() == &"learning", 3.0), "T-07.3 tap anywhere → learning card")
	var sheet: Control = screen.sheet()
	var lview: Dictionary = _game.learning_view()
	_expect(sheet.is_open() and sheet.more().folded, "T-08.1 sheet open, Saiba mais folded")
	var stexts := _texts(sheet)
	_expect(stexts.has("Carta de Aprendizado") and stexts.has(String(lview.title)), "T-08.1 caption and title")
	_expect(stexts.has(String(lview.concept)), "T-08.1 concept")
	_expect(not stexts.has(String(lview.lived)), "T-08.1 lived text hidden while folded")
	_expect(sheet.find_child("Sheet", true, false).accessibility_name == "Carta de Aprendizado: %s" % lview.title, "T-08.1 sheet name")
	_check_texts(screen, "T-08.1")
	sheet.more().folded = false
	await _frames(3)
	stexts = _texts(sheet)
	_expect(stexts.has(String(lview.lived)) and stexts.has("Dados reais") and stexts.has("Fonte"), "T-08.2 Saiba mais open")
	_check_texts(screen, "T-08.2")
	# Esc on the sheet: not used by the sheet (a validar) → the pause opens over it.
	_expect(_main.handle_cancel() and _main.is_paused(), "Esc on the learning card opens the pause")
	_main.close_pause()
	await _frames(2)
	sheet.continue_button().pressed.emit()
	_expect(await _wait(func() -> bool: return _screen_step() == &"card", 3.0), "T-08 Continuar → next card")
	_expect(_game.current_state() == &"card", "Game moved to the next card")
	await _frames(2)
	_expect(not line.visible or line.modulate.a < 1.0, "consequence leaves with the next card")


## Plays cards (side +1) through the UI until the year card of `year`.
func _play_until_year(year: int) -> void:
	var guard := 0
	while guard < 40:
		guard += 1
		var step := _screen_step()
		if step == &"year" or (_game.current_state() == &"year_intro" and _game.year_view().get("year", 0) == year):
			return
		match step:
			&"card":
				_choose(_main.current_screen().card(), 1)
				_cards_played += 1
				await _wait(func() -> bool: return _screen_step() != &"resolving" and _screen_step() != &"card", 6.0)
			&"consequence":
				_main.current_screen().consequence().continue_now()
				await _frames(2)
			&"learning":
				_main.current_screen().sheet().continue_button().pressed.emit()
				await _wait(func() -> bool: return _screen_step() != &"learning", 3.0)
			_:
				await _frames(2)
	_expect(false, "reached Year %d (step %s, state %s)" % [year, _screen_step(), _game.current_state()])


func _event_checks() -> void:
	_expect(await _wait(func() -> bool: return _screen_step() == &"events", 6.0), "T-05: events after the Year 2 card (seed %d)" % RUN_SEED)
	var screen: Node = _main.current_screen()
	var notice: Control = screen.event_notice()
	var view: Dictionary = _game.event_view()
	_expect(notice.visible, "C-17 visible")
	_expect(notice.display_texts()[0] == String(view.text), "C-17 event text")
	_expect(screen.footer().display_text() == "Ano 2 · Realidade Bate", "T-05 footer Ano · Fase (got %s)" % screen.footer().display_text())
	_expect(await _wait(func() -> bool: return notice.is_waiting(), 4.0), "C-17 waits for the tap after the HUD")
	_expect(_values(screen.hud()) == _game_values(), "T-05: HUD shows the event changes")
	_check_texts(screen, "T-05.1")
	# Closed on the notice, back through "Continuar": same event, waiting, effects not replayed.
	var before: Dictionary = _game_values()
	await _close_and_continue()
	screen = _main.current_screen()
	notice = screen.event_notice()
	_expect(_main.current_id() == &"game" and _screen_step() == &"events", "Continuar → the event notice (got %s/%s)" % [_main.current_id(), _screen_step()])
	_expect(notice.display_texts()[0] == String(view.text), "resumed event: same text")
	_expect(await _wait(func() -> bool: return notice.is_waiting(), 4.0), "resumed event waits for the tap")
	_expect(_game_values() == before and _values(screen.hud()) == before, "resumed event: effects not replayed")
	_click(Vector2(195, 420))
	_expect(await _wait(func() -> bool: return _screen_step() != &"events" or _game.event_view().get("index", 0) > int(view.index), 3.0), "tap → next event or card")
	_expect(await _wait(func() -> bool: return _screen_step() == &"card", 6.0), "events → the cards of the turn")


func _settings_checks() -> void:
	var screen: Node = _main.current_screen()
	var card: Control = screen.card()
	_settings.set_value(&"drag_limit", 0.25)
	_settings.set_value(&"reduce_motion", true)
	_settings.set_value(&"high_contrast", true)
	await _frames(2)
	_expect(is_equal_approx(card.drag_limit, 0.25), "drag limit live (D-158)")
	_expect(card.reduce_motion and screen.sheet().reduce_motion, "reduce motion live")
	_expect(card.high_contrast and screen.hud().high_contrast, "high contrast live (P2)")
	_settings.set_value(&"text_step", 150)
	await _frames(3)
	var portrait := screen.speaker().find_child("Portrait", true, false) as Control
	_expect(portrait != null and not portrait.visible, "P1 (150%): no portrait")
	var scroll := screen.find_child("ProblemScroll", true, false) as ScrollContainer
	_expect(scroll.custom_minimum_size.y == 4 * Tokens.type_line("Body", 150), "P1: problem keeps 4 lines and scrolls")
	var ftext := screen.footer().find_child("ProgressText", true, false) as Label
	_expect(ftext.max_lines_visible == 3, "P1: the footer may take 3 lines (the 'n/7' is not cut)")
	_expect(ftext.size.y >= ftext.get_line_count() * Tokens.type_line("Footer", 150) - 1, "P1: the footer label is tall enough for its lines (V-048; h %.0f, %d lines)" % [ftext.size.y, ftext.get_line_count()])
	_check_texts(screen, "P1")
	_settings.reset_defaults(false)
	await _frames(3)
	_expect(portrait.visible, "portrait back at 18 px")
	_expect(ftext.max_lines_visible == 2, "footer back to 2 lines (D21)")


## Closes the app on a decided card and reopens it: consequence read-only, no replay.
func _resume_checks() -> void:
	var screen: Node = _main.current_screen()
	_expect(screen.step() == &"card", "a card to decide before the resume test")
	_choose(screen.card(), 1)
	_expect(await _wait(func() -> bool: return _screen_step() == &"consequence", 6.0), "consequence before closing")
	var text: String = screen.consequence().text()
	# "Close the app": drop the shell, reload the save.
	_main.queue_free()
	_main = null
	await _frames(2)
	_expect(_game.resume(), "Game.resume() reads the save")
	_expect(_game.current_state() == &"consequence" and bool(_game.consequence_view().readonly), "resumed consequence is read-only")
	await _new_main()
	_main.go_to(&"game", {"resume": true})
	await _settle()
	screen = _main.current_screen()
	var line: Control = screen.consequence()
	_expect(screen.step() == &"consequence", "resume → consequence (F-07)")
	_expect(not screen.is_hud_busy(), "no effect replay on resume")
	_expect(_values(screen.hud()) == _game_values(), "resumed HUD = saved values")
	_expect(line.text() == text and line.is_waiting(), "same sentence, waiting for the tap")
	var cfooter := String(_game.consequence_view().get("footer", ""))
	_expect(cfooter.begins_with("Ano ") and screen.footer().display_text() == cfooter, "resumed consequence keeps the footer 'Ano · Fase · n/7'")
	_expect(_texts(line).has("Você já leu esta carta"), "T-08.3 reread tag on the consequence")
	_check_texts(screen, "resume")
	_key(KEY_ENTER)
	_expect(await _wait(func() -> bool: return _screen_step() == &"learning", 3.0), "Enter continues the consequence")


## Meter at 0 through the screens: the choice ends the run on the final screen (D-184).
func _meter_zero_checks() -> void:
	_expect(await _advance_to(&"card"), "a card for the meter-at-0 test (step %s)" % _screen_step())
	var cur: Dictionary = _game.flow.run.current_card
	var card_data: Dictionary = root.get_node(^"GameData").cards[cur["id"]]
	var pick := 0
	var meter := ""
	for side in [1, -1]:
		var opt: Dictionary = card_data[CardRules.option_key(side, int(cur["side_a"]))]
		for m in opt["effects"]:
			if m != "political_capital" and int(opt["effects"][m]) < 0:
				meter = String(m)
				break
		if meter != "":
			pick = side
			break
	_expect(pick != 0, "the card has a loss that can take a meter to 0")
	if pick == 0:
		return
	_game.flow.run.meters[meter] = 1
	_choose(_main.current_screen().card(), pick)
	_expect(await _wait(func() -> bool: return _main.current_id() == &"final" and not _main.is_busy(), 8.0),
		"meter at 0 → final screen (got %s)" % _main.current_id())
	var v: Dictionary = _game.final_view()
	_expect(String(v.get("reason", "")) == "catastrophe" and String(v.get("meter", "")) == meter,
		"catastrophe of %s (got %s / %s)" % [meter, v.get("reason", ""), v.get("meter", "")])
	var ending: Dictionary = v.get("ending", {})
	_expect(String(ending.get("id", "")) == String(root.get_node(^"GameData").meter_info[meter]["zero_ending"]), "the ending of %s at 0" % meter)
	_expect(_texts(_main.current_screen()).has(String(ending.get("name", "?"))), "T-10 shows the ending name")
	_expect(not _saves.has_save(), "the save is deleted on the final screen")


## Closed in the calibration, back through "Continuar": same question, same progress.
func _resume_in_calibration_checks() -> void:
	_game.new_run(RUN_SEED)
	_main.go_to(&"calibration")
	await _settle()
	var screen: Node = _main.current_screen()
	for i in 2:
		_choose(screen.card(), 1)
		var want := "Alinhamento · %d/6" % (i + 2)
		_expect(await _wait(func() -> bool: return screen.footer().display_text() == want, 5.0), "calibration at %s before closing" % want)
	var question := String(_game.calibration_view().question)
	await _close_and_continue()
	screen = _main.current_screen()
	_expect(_main.current_id() == &"calibration", "Continuar → calibration (got %s)" % _main.current_id())
	_expect(screen.footer().display_text() == "Alinhamento · 3/6", "resumed calibration at 3/6 (got %s)" % screen.footer().display_text())
	_expect(_texts(screen.card()).has(question), "resumed calibration: same question")


## "Closes the app" (only the save is left) and opens it on the title; "Continuar".
func _close_and_continue() -> void:
	_main.queue_free()
	_main = null
	await _frames(2)
	await _new_main()
	_main.go_to(&"title")
	await _settle()
	var b: Array = _main.current_screen().buttons()
	_expect((b[0] as Control).visible, "T-01: 'Continuar' with a save")
	b[0].pressed.emit()
	await _settle()


## Moves the run on (sheet, consequence, year card, events) until the screen shows `step`.
func _advance_to(step: StringName) -> bool:
	for i in 40:
		var now := _screen_step()
		if now == step:
			return true
		var screen: Node = _main.current_screen()
		match now:
			&"learning":
				screen.sheet().continue_button().pressed.emit()
			&"consequence":
				screen.consequence().continue_now()
			&"year":
				if screen.year_card().is_waiting_tap():
					_key(KEY_ENTER)
			&"events":
				if screen.event_notice().is_waiting():
					_click(Vector2(195, 420))
		await _wait(func() -> bool: return _screen_step() != now, 3.0)
	return _screen_step() == step


## Components alone (API used by lote E).
func _component_checks() -> void:
	var host := Control.new()
	host.size = Vector2(390, 844)
	host.mouse_filter = Control.MOUSE_FILTER_IGNORE   # taps must reach _unhandled_input
	host.theme = ThemeBuilder.build(18, false)
	root.add_child(host)
	var sheet: Control = (load(SHEET_SCENE) as PackedScene).instantiate()
	host.add_child(sheet)
	var line: Control = (load(LINE_SCENE) as PackedScene).instantiate()
	host.add_child(line)
	await _frames(2)
	var opened: Array = []
	var got: Array = []
	sheet.link_opener = func(url: String) -> void: opened.append(url)
	sheet.continued.connect(func() -> void: got.append("sheet"))
	var view := {"id": "APR-T", "title": "Título", "concept": "Conceito.", "impact": "Frase.",
		"lived": "Vivido.", "data": "", "source": {"label": "Fonte X", "url": "https://example.org/x"},
		"technique": "Técnica Y", "readonly": true}
	sheet.open(view)
	await _frames(3)
	var texts := _texts(sheet)
	_expect(texts.has("“Frase.”"), "C-09 impact quoted")
	_expect(texts.has("Você já leu esta carta"), "C-09 reread tag when read-only")
	_expect(texts.has("Técnica Y"), "C-09 technique shown (gdd 09)")
	sheet.more().folded = false
	await _frames(3)
	texts = _texts(sheet)
	_expect(not texts.has("Dados reais"), "D-091: no data block without data")
	_expect(sheet.source_link().is_visible_in_tree() and sheet.source_link().accessibility_name == "Fonte: Fonte X (abre o navegador)", "C-09 source link name")
	sheet.source_link().pressed.emit()
	_expect(opened == ["https://example.org/x"], "C-09 source opens the URL")
	_expect(sheet.continue_button().focus_next != NodePath(""), "C-09 focus chain")
	sheet.continue_button().pressed.emit()
	_expect(got == ["sheet"], "C-09 continued")
	sheet.close()
	await _wait(func() -> bool: return not sheet.visible, 2.0)
	_expect(not sheet.visible and not sheet.is_open(), "C-09 close() hides")
	# Long text at 125%: the sheet stops at the maximum height and scrolls; Continuar stays.
	host.theme = ThemeBuilder.build(125, false)
	var long := view.duplicate(true)
	long["concept"] = "Texto longo de teste. ".repeat(40)
	long["readonly"] = false
	sheet.open(long)
	await _frames(4)
	var panel := sheet.find_child("Sheet", true, false) as Control
	_expect(sheet.is_scrolling(), "T-15.4: long text scrolls")
	_expect(panel.size.y <= 844 - 24 + 0.5, "T-15.4: sheet within the maximum height")
	_expect(sheet.continue_button().get_global_rect().end.y <= 844.5, "T-15.4: Continuar visible")
	sheet.hide_now()
	# ConsequenceLine: tap = press + release while waiting; the press before does not count.
	var taps: Array = []
	line.continued.connect(func() -> void: taps.append(1))
	_click_press(Vector2(100, 600))
	line.show_text("Frase de consequência.", false)
	_click_release(Vector2(100, 600))
	await _frames(1)
	_expect(taps.is_empty(), "a release whose press came before show_text() does not continue")
	_click(Vector2(100, 600))
	await _frames(1)
	_expect(taps == [1] and not line.is_waiting(), "tap continues once")
	_click(Vector2(100, 600))
	await _frames(1)
	_expect(taps == [1], "no second continue")
	line.hide_now()
	# YearCard: Capture warning names the meter, never a number (gdd 02 §3.4).
	var yc: Control = (load(YEAR_SCENE) as PackedScene).instantiate()
	host.add_child(yc)
	await _frames(1)
	var held: Array = []
	yc.held.connect(func() -> void: held.append(1))
	yc.show_year({"year": 4, "phase": "Desfecho", "title": "Ano 4",
		"capture_warning": [{"id": "security", "name": "Segurança"}],
		"capture_warning_text": "Cuidado: poder demais também derruba um governo."}, {"security": 88}, false)
	await _frames(2)
	var yt: PackedStringArray = yc.display_texts()
	_expect(yt.has("Ano 4") and yt.has("Desfecho") and yt.has("Segurança") and yt.has("Cuidado: poder demais também derruba um governo."), "C-16 capture warning texts")
	for t in _texts(yc):
		_expect(not t.contains("88"), "C-16 never shows the meter number")
	_expect(not await _wait(func() -> bool: return held.size() == 1, 1.0), "C-16 with the Captura warning waits for a tap (D-184)")
	_expect(yc.is_waiting_tap(), "C-16 waiting for the tap")
	_key(KEY_ENTER)
	_expect(await _wait(func() -> bool: return held.size() == 1, 2.0), "C-16 held after the tap (D-184)")
	# EventNotice: counter only with several events; P5 off.
	var ev: Control = (load(EVENT_SCENE) as PackedScene).instantiate()
	host.add_child(ev)
	await _frames(1)
	ev.show_event({"index": 2, "total": 3, "text": "Evento.", "origin_title": "Carta de origem"}, true)
	await _frames(2)
	var et: PackedStringArray = ev.display_texts()
	_expect(et.has("2 de 3"), "C-17 n de N [a definir]")
	_expect(not et.has("Carta de origem"), "C-17 origin hidden (P5 off)")
	host.queue_free()
	await _frames(1)


# --- Helpers ---------------------------------------------------------------------------------

func _new_main() -> void:
	_main = (load(MAIN_SCENE) as PackedScene).instantiate() as Control
	_main.start_screen = &""
	root.add_child(_main)
	_main.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	_main.size = Vector2(Tokens.VIEWPORT)
	await _frames(2)


func _screen_step() -> StringName:
	if _main == null:
		return &""
	var s: Node = _main.current_screen()
	return s.step() if s and s.has_method(&"step") else &""


func _reveal(card: Control, side: int) -> void:
	var e := InputEventAction.new()
	e.action = &"ui_right" if side > 0 else &"ui_left"
	e.pressed = true
	card.handle_key(e)


## Keyboard decision: arrow reveals that half, Enter confirms (D-156).
func _choose(card: Control, side: int) -> void:
	_reveal(card, side)
	var e := InputEventAction.new()
	e.action = &"ui_accept"
	e.pressed = true
	card.handle_key(e)


func _click(pos: Vector2) -> void:
	_click_press(pos)
	_click_release(pos)


func _click_press(pos: Vector2) -> void:
	var e := InputEventMouseButton.new()
	e.button_index = MOUSE_BUTTON_LEFT
	e.position = pos
	e.global_position = pos
	e.pressed = true
	root.push_input(e)


func _click_release(pos: Vector2) -> void:
	var e := InputEventMouseButton.new()
	e.button_index = MOUSE_BUTTON_LEFT
	e.position = pos
	e.global_position = pos
	e.pressed = false
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


func _values(hud: Node) -> Dictionary:
	return hud.values()


func _game_values() -> Dictionary:
	var out := {}
	for m in _game.hud():
		out[String(m.id)] = int(m.value)
	return out


## No side words (D-084) and no meter number (docs/14 §14.05) in any visible text.
func _check_texts(node: Node, where: String) -> void:
	var values := _game_values()
	var footer_text := ""
	if node.has_method(&"footer"):
		footer_text = node.footer().display_text()
	for t in _texts(node):
		var low := t.to_lower()
		for w in SIDE_WORDS:
			_expect(not low.contains(w), "%s: side word '%s' in '%s'" % [where, w, t])
		if t == footer_text:
			continue
		var cleaned := _strip_ids(t)
		for id in values:
			var rx := RegEx.create_from_string("(?<![\\d/])%d(?![\\d/])" % int(values[id]))
			_expect(rx.search(cleaned) == null, "%s: meter value %d (%s) in '%s'" % [where, values[id], id, t])
	for n in _all(node):
		if n is Label and String((n as Label).name) == "Number":
			_expect(not (n as Label).is_visible_in_tree(), "%s: meter number label visible" % where)


## Card / learning ids ("THEM-004", "APR-204") and "n de N" are not meter values.
func _strip_ids(t: String) -> String:
	var rx := RegEx.create_from_string("[A-Z]+-\\d+|\\d+ de \\d+|Ano \\d")
	return rx.sub(t, "", true)


func _texts(node: Node) -> PackedStringArray:
	var out: PackedStringArray = []
	for n in _all(node):
		if n is Label and (n as Label).is_visible_in_tree():
			out.append((n as Label).text)
		elif n is LinkButton and (n as LinkButton).is_visible_in_tree():
			out.append((n as LinkButton).text)
		elif n is Button and (n as Button).is_visible_in_tree():
			out.append((n as Button).text)
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


func _settle() -> void:
	await process_frame
	var guard := 0
	while _main.is_busy() and guard < 2000:
		guard += 1
		await process_frame
	_expect(guard < 2000, "transition finished")
	await _frames(2)


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
		for x in _failures:
			printerr("FAIL: " + x)
		quit(1)
