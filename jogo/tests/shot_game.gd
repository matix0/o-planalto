extends SceneTree
## Screenshots of the game screens (lote D). Not part of run_all.sh. Run on a copy:
##   xvfb-run -a -s "-screen 0 1280x1024x24" $G --path <copy> --rendering-driver opengl3 \
##     --resolution 390x844 -s res://tests/shot_game.gd -- --out=<abs dir>
## Real Game, seed 2, side +1 everywhere (reaches the events of Year 2); safe area 48 / 32
## as on the boards; settings and the save go to temporary files.

const MAIN_SCENE := "res://scenes/main.tscn"
const TEST_SETTINGS := "user://shot_game_settings.cfg"
const TEST_SAVE := "user://shot_game_save.json"
const RUN_SEED := 2

var _out := ""
var _main: Control
var _game: Node
var _settings: Node
var _saves: Node


func _initialize() -> void:
	_run.call_deferred()


func _run() -> void:
	for a in OS.get_cmdline_user_args():
		if a.begins_with("--out="):
			_out = a.trim_prefix("--out=")
	if _out == "":
		_out = ProjectSettings.globalize_path("user://shots")
	DirAccess.make_dir_recursive_absolute(_out)
	await process_frame
	_settings = root.get_node(^"Settings")
	_game = root.get_node(^"Game")
	_saves = root.get_node(^"SaveManager")
	var real_settings: String = _settings.storage_path
	var real_save: String = _saves.path
	_settings.storage_path = TEST_SETTINGS
	_settings.reset_defaults(false)
	_saves.path = TEST_SAVE
	_game.new_run(RUN_SEED)
	_main = (load(MAIN_SCENE) as PackedScene).instantiate() as Control
	_main.start_screen = &""
	_main.debug_safe_insets = Vector4(0, 48, 0, 32)
	root.add_child(_main)
	await _frames(2)
	_main.go_to(&"calibration")
	await _settle()
	await _shots()
	paused = false
	_saves.delete()
	_saves.path = real_save
	if FileAccess.file_exists(TEST_SETTINGS):
		DirAccess.remove_absolute(ProjectSettings.globalize_path(TEST_SETTINGS))
	_settings.storage_path = real_settings
	print("shots saved in ", _out)
	quit(0)


func _shots() -> void:
	var cal: Node = _main.current_screen()
	await _frames(20)
	await _shot("t03_1_calibration")
	_reveal(cal.card(), 1)
	await _frames(12)
	await _shot("t03_2_calibration_revealed")
	_choose(cal.card(), 1)
	for i in 5:
		await _wait(func() -> bool: return cal.footer().display_text() == "%d/6" % (i + 2) or _main.current_id() != &"calibration", 4.0)
		await _frames(2)
		if _main.current_id() == &"calibration":
			_choose(cal.card(), 1)
	await _wait(func() -> bool: return _step() == &"year", 6.0)
	var screen: Node = _main.current_screen()
	await _wait(func() -> bool: return screen.year_card().find_child("Card", true, false).modulate.a > 0.99, 2.0)
	await _frozen_shot("t04_1_year1")
	# T-04.5-like: the same card with a Capture warning (made-up view; Year 4 is rare here).
	screen.year_card().show_year({"year": 4, "phase": "Desfecho", "title": "Ano 4",
		"capture_warning": [{"id": "security", "name": "Segurança"}],
		"capture_warning_text": "[aviso curto de Captura — a definir]"}, {"security": 88}, false)
	await create_timer(0.25).timeout
	await _frozen_shot("t04_5_like_capture")
	await _wait(func() -> bool: return _step() == &"card", 6.0)
	await create_timer(0.4).timeout
	await _shot("t06_1_card")
	screen.card().preview_drag(1, 0.40)
	await _frames(6)
	await _shot("t06_2_drag")
	screen.card().reset()
	await _frames(3)
	_choose(screen.card(), 1)
	await create_timer(0.36).timeout
	await _frozen_shot("t07_1_effects_mid")
	await _wait(func() -> bool: return _step() == &"consequence", 6.0)
	await create_timer(0.3).timeout
	await _shot("t07_3_consequence")
	screen.consequence().continue_now()
	await create_timer(0.45).timeout
	await _shot("t08_1_learning")
	screen.sheet().more().folded = false
	await create_timer(0.35).timeout
	await _shot("t08_2_learning_more")
	screen.sheet().continue_button().pressed.emit()
	# Play on (side +1) to the events of Year 2.
	var guard := 0
	while _step() != &"events" and guard < 60:
		guard += 1
		match _step():
			&"card":
				await create_timer(0.3).timeout
				_choose(screen.card(), 1)
				await _wait(func() -> bool: return _step() != &"card" and _step() != &"resolving", 6.0)
			&"consequence":
				screen.consequence().continue_now()
				await _frames(2)
			&"learning":
				await create_timer(0.35).timeout
				screen.sheet().continue_button().pressed.emit()
				await _wait(func() -> bool: return _step() != &"learning", 3.0)
			&"year":
				await _wait(func() -> bool: return screen.year_card().find_child("Card", true, false).modulate.a > 0.99 and not screen.sheet().visible, 2.0)
				await _frozen_shot("t04_2_year%d" % int(_game.year_view().get("year", 0)))
				await _wait(func() -> bool: return _step() != &"year", 6.0)
			_:
				await _frames(2)
	await _wait(func() -> bool: return screen.event_notice().is_waiting(), 6.0)
	await create_timer(0.2).timeout
	await _shot("t05_1_event")
	screen.event_notice().continue_now()
	# T-15: 24 px + high contrast on the next card, then dragging and the learning card.
	await _wait(func() -> bool: return _step() == &"card", 6.0)
	_settings.set_value(&"text_step", 24)
	_settings.set_value(&"high_contrast", true)
	await create_timer(0.4).timeout
	await _shot("t15_24px_hc_card")
	screen.card().preview_drag(-1, 0.40)
	await _frames(6)
	await _shot("t15_24px_hc_drag")
	screen.card().reset()
	await _frames(3)
	_choose(screen.card(), 1)
	await _wait(func() -> bool: return _step() == &"consequence", 6.0)
	await create_timer(0.3).timeout
	await _shot("t15_24px_hc_consequence")
	screen.consequence().continue_now()
	await create_timer(0.45).timeout
	screen.sheet().more().folded = false
	await create_timer(0.35).timeout
	await _shot("t15_4_24px_hc_learning_more")
	var scroll: ScrollContainer = screen.sheet().scroll()
	scroll.scroll_vertical = 10000
	await _frames(6)
	await _shot("t15_4_24px_hc_learning_end")
	_settings.set_value(&"text_step", 36)
	_settings.set_value(&"high_contrast", false)
	screen.sheet().continue_button().pressed.emit()
	await _wait(func() -> bool: return _step() == &"card", 6.0)
	await create_timer(0.4).timeout
	await _shot("t15_6_36px_card")


# --- Helpers ---------------------------------------------------------------------------------

func _step() -> StringName:
	var s: Node = _main.current_screen()
	return s.step() if s and s.has_method(&"step") else &""


func _reveal(card: Control, side: int) -> void:
	var e := InputEventAction.new()
	e.action = &"ui_right" if side > 0 else &"ui_left"
	e.pressed = true
	card.handle_key(e)


func _choose(card: Control, side: int) -> void:
	_reveal(card, side)
	var e := InputEventAction.new()
	e.action = &"ui_accept"
	e.pressed = true
	card.handle_key(e)


## Freezes the screen (tree paused: tweens stop) for an exact mid-animation frame.
func _frozen_shot(name: String) -> void:
	paused = true
	await _shot(name)
	paused = false


func _shot(name: String) -> void:
	await _frames(3)
	await RenderingServer.frame_post_draw
	var img := root.get_texture().get_image()
	var path := _out.path_join(name + ".png")
	img.save_png(path)
	print("shot ", path, " ", img.get_size())


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
	await _frames(3)


func _frames(n: int) -> void:
	for i in n:
		await process_frame
