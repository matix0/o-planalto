extends SceneTree
## Headless: godot --headless --path jogo -s res://tests/test_final_screen.gd
## Final screen T-10 (lote F) through the real Game and Main. Seeded runs with a "careful"
## policy reach: an end of term without epilogue, one with epilogue, a catastrophe without
## a quote (D-091), one with quote and epilogue, an impeachment conviction, and the Renúncia
## after Game.abandon() (END-028). For each: the sections show/hide from the data
## (gdd 08 §5), the 8 meters show their numbers (the only screen with numbers, docs/14
## §14.09), the radar labels fit and do not overlap, no side words (D-084), no pause, Esc
## does nothing. Then: Settings live (24 px, 36 px fallback, high contrast), PC column
## (D-171), focus and keyboard scroll, "Compartilhar" toast, and "Jogar novamente" starts a
## new run (tutorial the 1st time, calibration after).
## Saves and settings go to temporary files. Classes that use autoloads (AppMain, AppScreen,
## components) are not typed here: a script run with -s cannot name them.

const MAIN_SCENE := "res://scenes/main.tscn"
const TEST_SETTINGS := "user://test_final_settings.cfg"
const SIDE_WORDS := ["esquerda", "direita", "◀", "▶"]   # ← → allowed on the option previews (D-202)
const MAX_SEED := 80
const SHARE_TEXT := "Compartilhar chega em breve."
const SCENARIOS := ["term_no_epilogue", "term_epilogue", "catastrophe_no_quote", "catastrophe_quote_epilogue", "impeachment"]

var _failures: PackedStringArray = []
var _main: Control
var _game: Node
var _saves: Node
var _settings: Node
var _data: Node
var _order: Array = []


func _initialize() -> void:
	_run.call_deferred()


func _run() -> void:
	create_timer(150.0).timeout.connect(func() -> void:
		printerr("FAIL: test_final_screen timed out")
		quit(1))
	await process_frame   # autoloads are ready after the first frame
	_game = root.get_node(^"Game")
	_saves = root.get_node(^"SaveManager")
	_settings = root.get_node(^"Settings")
	_data = root.get_node(^"GameData")
	# Scenario seeds are tuned to the fictitious fixture deck (D-139, D-194).
	_data.data_dir = "res://tests/fixtures/data/"
	_data.load_all()
	_order = Array(_data.meter_ids)
	var real_save: String = _saves.path
	_saves.path = "user://test_final_screen_%d.json" % OS.get_process_id()
	_saves.delete()
	var real_settings: String = _settings.storage_path
	_settings.storage_path = TEST_SETTINGS
	_settings.reset_defaults(false)
	_main = (load(MAIN_SCENE) as PackedScene).instantiate() as Control
	_main.start_screen = &""
	root.add_child(_main)
	# Headless windows are not 390 wide: pin Main to the phone canvas (D-170).
	_main.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	_main.size = Vector2(Tokens.VIEWPORT)
	await _frames(2)

	var seeds := _survey()
	print("  first seed per kind: ", seeds)
	for kind in SCENARIOS:
		if not seeds.has(kind):
			_expect(false, "no seed in 1..%d reaches '%s'" % [MAX_SEED, kind])
			continue
		_play(int(seeds[kind]))
		var v: Dictionary = _game.final_view()
		await _open_final()
		await _check_screen(v, "%s (seed %d, %s)" % [kind, seeds[kind], v["ending"]["id"]])
	await _renuncia()
	if seeds.has("catastrophe_quote_epilogue"):
		_play(int(seeds["catastrophe_quote_epilogue"]))
		await _open_final()
		await _settings_live()
		await _pc_column()
		await _focus_and_keys()
		await _buttons(seeds["catastrophe_quote_epilogue"])

	# Cleanup.
	if _game.current_state() != &"start" and _game.current_state() != &"final":
		_game.abandon()
	_main.queue_free()
	await process_frame
	_saves.delete()
	_saves.path = real_save
	if FileAccess.file_exists(TEST_SETTINGS):
		DirAccess.remove_absolute(ProjectSettings.globalize_path(TEST_SETTINGS))
	_settings.storage_path = real_settings
	_finish("test_final_screen")


# --- Runs ---------------------------------------------------------------------------------

## First seed of each kind of final (deterministic: fixed seeds, careful policy).
func _survey() -> Dictionary:
	var found := {}
	for s in range(1, MAX_SEED + 1):
		_play(s)
		var v: Dictionary = _game.final_view()
		var reason := String(v.get("reason", ""))
		var has_quote := String(v["ending"]["quote"]) != ""
		var has_epilogue := not (v["epilogue"] as Array).is_empty()
		var kind := ""
		if reason == "end_of_term":
			kind = "term_epilogue" if has_epilogue else "term_no_epilogue"
		elif reason == "catastrophe" and not has_quote:
			kind = "catastrophe_no_quote"
		elif reason == "catastrophe" and has_epilogue:
			kind = "catastrophe_quote_epilogue"
		elif reason == "impeachment":
			kind = "impeachment"
		if kind != "" and not found.has(kind):
			found[kind] = s
		if found.size() == SCENARIOS.size():
			break
	return found


func _play(run_seed: int) -> void:
	_game.new_run(run_seed)
	var steps := 0
	while _game.current_state() != &"final" and steps < 1000:
		steps += 1
		_act()
	_expect(_game.current_state() == &"final", "seed %d reaches the final" % run_seed)


func _act() -> void:
	match _game.current_state():
		&"calibration":
			_game.answer_calibration(1)
		&"year_intro":
			_game.continue_from_year()
		&"events":
			_game.continue_from_event()
		&"card":
			_game.choose(_pick())
		&"consequence":
			_game.continue_from_consequence()
		&"learning":
			_game.continue_from_learning()
		&"impeachment":
			if _game.impeachment_view()["stage"] == "phase":
				_game.choose_impeachment(1)
			else:
				_game.continue_impeachment()


## "Careful" (as test_playthrough): keep the lowest meter high.
func _pick() -> int:
	var run: RunState = _game.flow.run
	var card: Dictionary = _data.cards[run.current_card["id"]]
	var side_a := int(run.current_card["side_a"])
	var best_side := 1
	var best := -INF
	for side in [-1, 1]:
		var opt: Dictionary = card[CardRules.option_key(side, side_a)]
		var m: Dictionary = run.meters.duplicate()
		MeterRules.apply_effects(m, _game.flow._ints(opt["effects"]), _game.flow._multiplier(), _data.balance, _order)
		var score: float = m.values().min() * 1000 + m.values().reduce(func(a, x): return a + x, 0)
		if score > best:
			best = score
			best_side = side
	return best_side


# --- Screen checks ------------------------------------------------------------------------

func _open_final(fade := 0.0) -> void:
	_main.go_to(&"final", {"fade_time": fade})
	await _settle()


func _check_screen(v: Dictionary, what: String) -> void:
	_expect(_main.current_id() == &"final", "%s: Main shows the final screen (got %s)" % [what, _main.current_id()])
	var s: Control = _main.current_screen()
	var e: Dictionary = v["ending"]
	_eq(_text(s, "CategoryLabel"), e["category_label"], what + ": category tag")
	_eq(_text(s, "EndingName"), e["name"], what + ": ending name")
	_eq(_text(s, "EndingDesc"), v["description"], what + ": short description [a definir]")
	var quote: Control = s.get_node(^"%QuoteBlock")
	_eq(quote.visible, String(e["quote"]) != "", what + ": quote block only with a verified quote (D-091)")
	if quote.visible:
		_eq(quote.quote_text(), "“%s”" % e["quote"], what + ": quote between typographic quotes")
		_expect(quote.author_text().begins_with("— ") and quote.author_text().length() > 2, what + ": “— author” line")
	var epilogue: Control = s.get_node(^"%Epilogue")
	_eq(epilogue.visible, not (v["epilogue"] as Array).is_empty(), what + ": epilogue only with queued events (gdd 08 §5)")
	var rows: Array = s.get_node(^"%EpilogueList").get_children()
	_eq(rows.size(), (v["epilogue"] as Array).size(), what + ": one row per epilogue event")
	for i in mini(rows.size(), (v["epilogue"] as Array).size()):
		_eq(_row_label(rows[i], 0).text, v["epilogue"][i], what + ": epilogue row %d" % i)
	var radar: Control = s.get_node(^"%Radar")
	_expect(_same_floats(radar.said, v["axis"]["said"]) and _same_floats(radar.governed, v["axis"]["governed"]), what + ": radar tracks = final_view().axis")
	_eq(_text(s, "AxisText"), v["axis"]["text"], what + ": dominant axis text (gdd 04 §3.3)")
	_expect(radar.chart().accessibility_name == "Radar ideológico" and radar.chart().accessibility_description != "", what + ": radar name + text description")
	_check_radar(radar, what)
	var meter_rows: Array = s.get_node(^"%MeterList").get_children()
	_eq(meter_rows.size(), 8, what + ": 8 meter rows")
	var meters: Array = v["meters"]
	for i in mini(meter_rows.size(), meters.size()):
		var row: Control = meter_rows[i]
		var m: Dictionary = meters[i]
		var icon: Control = row.get_child(0)
		_eq(icon.meter_id, m["id"], what + ": row %d icon" % i)
		_eq(icon.value, m["value"], what + ": row %d icon level" % i)
		_expect(not icon.show_number and not (icon.get_node(^"Number") as Control).visible, what + ": no second number under the well")
		_eq(_row_label(row, 0).text, m["name"], what + ": row %d name" % i)
		var number := row.get_node(^"Value") as Label
		_eq(number.text, str(m["value"]), what + ": row %d shows the number (docs/14 §14.09)" % i)
		_eq(row.accessibility_name, "%s, %d" % [m["name"], m["value"]], what + ": row %d reads name + number (a validar)" % i)
	_eq(_text(s, "RevealText"), v["reveal_text"], what + ": reveal text (GDD §9.2)")
	_eq(_text(s, "ClosingPhrase"), v["closing_phrase"], what + ": closing phrase")
	_check_tree(s, what)
	_expect(not s.allows_pause(), what + ": no pause on the final screen")
	_esc()
	await _frames(2)
	_expect(not _main.is_paused() and _main.current_id() == &"final", what + ": Esc does nothing (a validar)")


## Names fit around the chart (inside it, not on the ring, not on each other) and the tracks
## stay within the radius.
func _check_radar(radar: Control, what: String) -> void:
	var chart: Control = radar.chart()
	var r: float = radar.radius()
	var c: Vector2 = radar.center()
	_expect(r >= 40.0 and r <= 80.0, "%s: radar radius %s within 40-80" % [what, r])
	var rects: Array[Rect2] = []
	for label: Label in radar.pole_labels():
		rects.append(Rect2(label.position, label.size))
	for i in rects.size():
		var rect := rects[i]
		_expect(rect.position.x >= -0.5 and rect.end.x <= chart.size.x + 0.5 and rect.position.y >= -0.5 and rect.end.y <= chart.size.y + 0.5,
			"%s: radar label %d inside the chart (%s in %s)" % [what, i, rect, chart.size])
		var nearest := Vector2(clampf(c.x, rect.position.x, rect.end.x), clampf(c.y, rect.position.y, rect.end.y))
		_expect(nearest.distance_to(c) >= r + 1.0, "%s: radar label %d off the ring" % [what, i])
		for j in range(i + 1, rects.size()):
			_expect(not rect.intersects(rects[j]), "%s: radar labels %d and %d overlap" % [what, i, j])
	for track in [radar.said, radar.governed]:
		for p: Vector2 in radar.points_for(track):
			_expect(p.distance_to(c) <= r + 0.5, "%s: track point inside the radius" % what)


func _renuncia() -> void:
	_game.new_run(5)
	var guard := 0
	while not (_game.current_state() == &"card" and _game.flow.run.year == 2) and _game.current_state() != &"final" and guard < 400:
		guard += 1
		_act()
	var queued: Array = _game.flow.run.event_queue.map(func(ev): return ev["text"])
	_game.abandon()
	var v: Dictionary = _game.final_view()
	_eq([v["ending"]["id"], v["reason"]], ["END-028", "exit"], "Game.abandon() mid-run → Renúncia")
	_expect((v["epilogue"] as Array).size() >= queued.size(), "Renúncia: queued events in the epilogue")
	await _open_final(_main.FINAL_FADE)   # A-26 timing used by Main after the pause
	await _check_screen(v, "Renúncia (seed 5)")
	var s: Control = _main.current_screen()
	_eq(_text(s, "CategoryLabel"), "Saída", "Renúncia: category Saída")
	_expect((s.get_node(^"%QuoteBlock") as Control).visible, "Renúncia: Jânio Quadros quote shown")


func _settings_live() -> void:
	var s: Control = _main.current_screen()
	var radar: Control = s.get_node(^"%Radar")
	var name_label: Label = s.get_node(^"%EndingName")
	var r18: float = radar.radius()
	_eq(r18, 80.0, "18 px: radius 80 (C-13)")
	_settings.set_value(&"text_step", 24)
	await _frames(4)
	_eq(name_label.get_theme_font_size(&"font_size"), Tokens.type_size("TitleL", 24), "24 px: theme applied live")
	_expect(radar.radius() < r18 and not radar.is_keyed(), "24 px: radius shrinks (got %s), names still around (D14)" % radar.radius())
	_check_radar(radar, "24 px")
	_check_tree(s, "24 px")
	_settings.set_value(&"text_step", 36)
	await _frames(4)
	_expect(radar.is_keyed(), "36 px: names do not fit → numbered spokes + list (PROPOSTA, D14)")
	var key: Array = radar.key_labels()
	_expect(key.size() == 8 and (key[0] as Label).is_visible_in_tree() and (key[0] as Label).text == "1. " + radar.pole_name(0), "36 px: list under the chart")
	_check_radar(radar, "36 px")
	_check_tree(s, "36 px")
	_settings.set_value(&"text_step", 18)
	await _frames(4)
	_expect(not radar.is_keyed() and radar.radius() == r18, "back to 18 px")
	_settings.set_value(&"high_contrast", true)
	await _frames(3)
	var icons: Array = s.meter_icons()
	_expect(icons.size() == 8 and icons.all(func(i): return i.high_contrast), "high contrast reaches the meter icons")
	_eq(radar.said_color(), Tokens.TEXT, "high contrast: 'disse' track in white (pattern, not color)")
	_settings.set_value(&"high_contrast", false)
	await _frames(3)
	_expect(icons.all(func(i): return not i.high_contrast), "high contrast off again")
	_eq(radar.said_color(), Radar.SAID_COLOR, "'disse' track gold #FFD54F (P-017, D-199)")
	_eq(radar.governed_color(), Radar.GOVERNED_COLOR, "'governou' track cyan #80DEEA (P-017)")
	_expect(radar.bars().size() == 4, "4 promise × practice bars under the radar (P-017)")


func _pc_column() -> void:
	var s: Control = _main.current_screen()
	var column: Control = s.get_node(^"%Column")
	_eq(column.size.x, 342.0, "phone: column 342 (390 − 2 × 24)")
	_main.size = Vector2(1500, 844)
	await _frames(3)
	_eq(column.size.x, 382.0, "PC: column 382 inside the 430 column (D-171, T-16.3)")
	_eq((s.get_node(^"%Radar") as Control).radius(), 80.0, "PC: radius 80")
	_check_tree(s, "PC")
	_main.size = Vector2(Tokens.VIEWPORT)
	await _frames(3)
	_eq(column.size.x, 342.0, "phone again")


func _focus_and_keys() -> void:
	_key(KEY_SHIFT)   # keyboard mode in Main: the initial focus shows its ring
	await _frames(1)
	await _open_final()
	var s: Control = _main.current_screen()
	var scroll: ScrollContainer = s.scroll()
	var b: Array = s.buttons()
	_expect(root.gui_get_focus_owner() == scroll, "focus starts on the Scroll (T10a)")
	_key(KEY_PAGEDOWN)
	await _frames(2)
	_expect(scroll.scroll_vertical > 0 and root.gui_get_focus_owner() == scroll, "Page Down scrolls, focus stays (got %d)" % scroll.scroll_vertical)
	_key(KEY_END)
	await _frames(2)
	var bottom := scroll.scroll_vertical
	_key(KEY_UP)
	await _frames(2)
	_expect(scroll.scroll_vertical < bottom, "arrow up scrolls")
	_key(KEY_HOME)
	await _frames(2)
	_eq(scroll.scroll_vertical, 0, "Home → top")
	_expect(s.scroll_ring_visible(), "keyboard: ring on the Scroll")
	_key(KEY_TAB)
	await _frames(3)
	_expect(root.gui_get_focus_owner() == b[0] and not s.scroll_ring_visible(), "Tab → Jogar novamente (ring leaves the Scroll)")
	_expect(scroll.scroll_vertical > 0, "follow focus scrolls to the button")
	_key(KEY_TAB)
	await _frames(2)
	_expect(root.gui_get_focus_owner() == b[1], "Tab → Compartilhar")


func _buttons(run_seed: int) -> void:
	var s: Control = _main.current_screen()
	var b: Array = s.buttons()
	_eq([b[0].text, b[1].text], ["Jogar novamente", "Compartilhar"], "button texts")
	_eq([b[0].theme_type_variation, b[1].theme_type_variation], [&"Primary", &"Secondary"], "C-15 styles")
	b[1].pressed.emit()
	await _frames(3)
	_expect(_main.toast().is_showing() and _main.toast().message() == SHARE_TEXT, "Compartilhar → toast [a definir]")
	_main.toast().hide_now()
	# First time: tutorial (Settings.tutorial_seen = false).
	b[0].pressed.emit()
	await _settle()
	_eq(_game.current_state(), &"calibration", "Jogar novamente → new run (calibration)")
	_eq(_main.current_id(), &"tutorial", "Jogar novamente → tutorial the first time")
	# After the tutorial was seen: calibration.
	_settings.set_value(&"tutorial_seen", true)
	_play(run_seed)
	await _open_final()
	(_main.current_screen().buttons()[0] as Button).pressed.emit()
	await _settle()
	_eq(_game.current_state(), &"calibration", "new run again")
	_eq(_main.current_id(), &"calibration", "Jogar novamente → calibration when the tutorial was seen")


# --- Helpers ------------------------------------------------------------------------------

func _text(screen: Node, unique: String) -> String:
	return (screen.get_node(NodePath("%" + unique)) as Label).text


func _row_label(row: Node, index: int) -> Label:
	var labels := row.get_children().filter(func(n): return n is Label)
	return labels[index] if index < labels.size() else Label.new()


func _same_floats(a: Variant, b: Variant) -> bool:
	if not (a is Array and b is Array) or (a as Array).size() != (b as Array).size():
		return false
	for i in (a as Array).size():
		if not is_equal_approx(float(a[i]), float(b[i])):
			return false
	return true


## D-084 (no side words) in texts and names, 48 px buttons, nothing wider than the column.
func _check_tree(node: Node, where: String) -> void:
	var host := _main.find_child("ScreenHost", true, false) as Control
	var frame := host.get_global_rect()
	for n in _all(node):
		if not (n is Control) or not (n as Control).is_visible_in_tree():
			continue
		var c := n as Control
		var r := c.get_global_rect()
		if r.position.x < frame.position.x - 0.5 or r.end.x > frame.end.x + 0.5:
			_expect(false, "%s: %s outside the column (%s, column %s)" % [where, c.name, r, frame])
		var shown := ""
		if c is Label:
			shown = (c as Label).text
		elif c is Button:
			shown = (c as Button).text
		for w in SIDE_WORDS:
			if (shown + " " + c.accessibility_name + " " + c.accessibility_description).to_lower().contains(w):
				_expect(false, "%s: side word '%s' in %s" % [where, w, c.name])
		if c is BaseButton:
			_expect(c.size.x >= Tokens.TOUCH_MIN - 0.5 and c.size.y >= Tokens.TOUCH_MIN - 0.5, "%s: %s is %s (< 48)" % [where, c.name, c.size])


func _all(node: Node) -> Array[Node]:
	var out: Array[Node] = [node]
	for child in node.get_children():
		out.append_array(_all(child))
	return out


## Waits for Main's transition (time based: headless frames are not 60 per second).
func _settle() -> void:
	var start := Time.get_ticks_msec()
	await process_frame
	while _main.is_busy() and Time.get_ticks_msec() - start < 5000:
		await process_frame
	_expect(not _main.is_busy(), "transition finished")
	await _frames(3)


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


func _eq(got: Variant, want: Variant, what: String) -> void:
	if typeof(got) == TYPE_FLOAT or typeof(want) == TYPE_FLOAT:
		if is_equal_approx(float(got), float(want)):
			return
	elif got == want:
		return
	_failures.append("%s (got %s, want %s)" % [what, str(got), str(want)])


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
