extends SceneTree
## Screenshots of the app shell (lote C). Not part of run_all.sh. Run on a copy:
##   xvfb-run -a -s "-screen 0 1280x1024x24" $G --path <copy> --rendering-driver opengl3 \
##     --resolution 390x844 -s res://tests/shot_shell.gd -- --out=<abs dir>
##   xvfb-run -a -s "-screen 0 1600x1000x24" $G --path <copy> --rendering-driver opengl3 \
##     --resolution 1500x844 -s res://tests/shot_shell.gd -- --out=<abs dir> --pc
## Settings go to a temporary file; a fake Game stands in for saves.

const MAIN_SCENE := "res://scenes/main.tscn"
const TEST_SETTINGS := "user://shot_shell_settings.cfg"


class FakeGame extends Node:
	signal state_changed(state: StringName)
	signal toast_requested(kind: StringName)
	var save := false
	var readable := true
	var state: StringName = &"start"

	func has_save() -> bool:
		return save

	func new_run(_seed: int = -1) -> void:
		save = true
		state = &"calibration"
		state_changed.emit(state)

	func resume() -> bool:
		if not readable:
			save = false
			return false
		state = &"card"
		return true

	func abandon() -> void:
		state = &"start" if state == &"calibration" else &"final"
		save = false

	func current_state() -> StringName:
		return state


var _out := ""
var _main: Control
var _fake: FakeGame
var _settings: Node


func _initialize() -> void:
	_run.call_deferred()


func _run() -> void:
	var pc := false
	for a in OS.get_cmdline_user_args():
		if a.begins_with("--out="):
			_out = a.trim_prefix("--out=")
		elif a == "--pc":
			pc = true
	if _out == "":
		_out = ProjectSettings.globalize_path("user://shots")
	DirAccess.make_dir_recursive_absolute(_out)
	_settings = root.get_node(^"Settings")
	var real_path: String = _settings.storage_path
	_settings.storage_path = TEST_SETTINGS
	_settings.reset_defaults(false)
	_apply_base_settings()   # -- --text=N (16-36) and --hc: base text size and high contrast (P-014 etapa 7)
	_fake = FakeGame.new()
	root.add_child(_fake)
	_main = (load(MAIN_SCENE) as PackedScene).instantiate() as Control
	_main.game = _fake
	root.add_child(_main)
	await _settle()
	if pc:
		await _pc_shots()
	else:
		await _phone_shots()
	paused = false
	if FileAccess.file_exists(TEST_SETTINGS):
		DirAccess.remove_absolute(ProjectSettings.globalize_path(TEST_SETTINGS))
	_settings.storage_path = real_path
	print("shots saved in ", _out)
	quit(0)


func _phone_shots() -> void:
	var title: Node = _main.current_screen()
	await _shot("t01_1_title_no_save")
	_fake.save = true
	title.refresh(true)
	await _shot("t01_2_title_save")
	_fake.readable = false
	title.buttons()[0].pressed.emit()
	await _frames(20)
	await _shot("t01_4_title_unreadable_toast")
	_main.toast().hide_now()
	_fake.save = true
	_fake.readable = true
	title.refresh(true)
	title.buttons()[1].grab_focus()
	title.buttons()[1].pressed.emit()
	await _frames(20)
	await _shot("t01_3_modal_a")
	_main.modal().confirm()
	await _settle()
	var tut: Node = _main.current_screen()
	for i in 4:
		await _frames(10)
		await _shot("t02_%d_tutorial" % (i + 1))
		if i < 3:
			tut.advance()
			while tut.get("_changing"):
				await process_frame
	_main.go_to(&"calibration")
	await _settle()
	_main.open_pause()
	await _frames(20)
	await _shot("t11_1_pause")
	_main.close_pause()
	_main.go_to(&"title")
	await _settle()
	_main.push(&"settings")
	await _settle()
	await _shot("t12_1_settings_default")
	_settings.set_value(&"text_step", 24)
	_settings.set_value(&"reduce_motion", true)
	_settings.set_value(&"high_contrast", true)
	_settings.set_value(&"drag_limit", 0.25)
	await _frames(10)
	await _shot("t12_1_settings_on_24px")
	var scroll := _main.current_screen().find_child("Scroll", true, false) as ScrollContainer
	scroll.scroll_vertical = 10000
	await _frames(10)
	await _shot("t12_1_settings_on_24px_end")
	_settings.reset_defaults(false)
	_main.back()
	await _settle()
	_main.push(&"about")
	await _settle()
	await _shot("t13_1_about")
	var about: Node = _main.current_screen()
	about.folds()[0].folded = false
	var about_scroll := about.find_child("Scroll", true, false) as ScrollContainer
	await _frames(5)
	about_scroll.scroll_vertical = 520
	await _frames(10)
	await _shot("t13_1_about_licenses")
	_main.go_to(&"game")
	await _settle()
	await _shot("placeholder_game")


func _pc_shots() -> void:
	await _shot("pc_t01_title")
	_main.push(&"settings")
	await _settle()
	await _shot("pc_t12_settings")
	_main.go_to(&"game")
	await _settle()
	_main.open_pause()
	await _frames(20)
	await _shot("pc_t11_pause")
	_main.close_pause()


func _shot(name: String) -> void:
	await _frames(3)
	await RenderingServer.frame_post_draw
	var img := root.get_texture().get_image()
	var path := _out.path_join(name + ".png")
	img.save_png(path)
	print("shot ", path, " ", img.get_size())


func _settle() -> void:
	await process_frame
	var guard := 0
	while _main.is_busy() and guard < 600:
		guard += 1
		await process_frame
	await _frames(3)


func _frames(n: int) -> void:
	for i in n:
		await process_frame


## Base settings from the command line: --text=16|18|20|24|36 and --hc. The variant shots of
## this script still set their own sizes; this only changes the base pages.
func _apply_base_settings() -> void:
	for a in OS.get_cmdline_user_args():
		if a.begins_with("--text="):
			_settings.set_value(&"text_step", int(a.trim_prefix("--text=")))
		elif a == "--hc":
			_settings.set_value(&"high_contrast", true)
