extends SceneTree
## Screenshots of the final screen T-10 (lote F). Not part of run_all.sh. Run on a copy:
##   xvfb-run -a -s "-screen 0 1280x3000x24" $G --path <copy> --rendering-driver opengl3 \
##     --resolution 390x844 -s res://tests/shot_final.gd -- --out=<abs dir>
##   (… --resolution 360x800 … -- --out=<dir> --only-first --tag=360; same with 430x932)
##   xvfb-run -a -s "-screen 0 1600x1000x24" $G --path <copy> --rendering-driver opengl3 \
##     --resolution 1500x844 -s res://tests/shot_final.gd -- --out=<abs dir> --pc
## Frames T-10.1 to T-10.5 use the board examples (Final.dc.html: meters, epilogue, radar and
## pattern text of each frame) with the ending name, category, quote and author from
## data/endings.json, through a fake Game. "t10_real_*" is a real seeded run (Game autoload).
## Full-page shots grow the window to the page height (stretch scale stays 1 at 390 wide).
## Settings go to a temporary file; the save goes to a temporary file.

const MAIN_SCENE := "res://scenes/main.tscn"
const TEST_SETTINGS := "user://shot_final_settings.cfg"
const TEST_SAVE := "user://shot_final_save.json"
const METERS := ["dignity", "awareness", "sovereignty", "security", "integrity", "treasury", "political_capital", "legitimacy"]
const EPI := ["Epidemia na periferia", "Jovens criam cooperativa"]
## Final.dc.html, table F (illustrative meter values and pattern texts of the boards).
const FRAMES := {
	"paralisia": {"id": "END-006", "vals": [62, 58, 47, 35, 66, 0, 41, 52], "epi": EPI, "reason": "catastrophe",
		"padrao": "Seu governo priorizou a dignidade, a educação e a soberania."},
	"desintegracao": {"id": "END-005", "vals": [48, 44, 51, 46, 0, 52, 47, 50], "epi": EPI, "reason": "catastrophe",
		"padrao": "Seu governo deixou a verdade e a educação em segundo plano."},
	"comum": {"id": "END-027", "vals": [50, 48, 52, 55, 47, 49, 51, 53], "epi": [], "reason": "end_of_term",
		"padrao": "Seu governo buscou equilíbrio entre diferentes valores."},
	"colonia": {"id": "END-003", "vals": [45, 42, 0, 50, 40, 61, 47, 52], "epi": ["Epidemia na periferia"], "reason": "catastrophe",
		"padrao": "Seu governo deixou os direitos do povo e a soberania em segundo plano."},
	"renuncia": {"id": "END-028", "vals": [44, 41, 39, 52, 43, 50, 38, 47], "epi": ["Epidemia na periferia"], "reason": "exit",
		"padrao": "Seu governo buscou equilíbrio entre diferentes valores."},
}
## T-10.1 radar example: calibration answers A / option A of 5 cards (T10a).
const SAID := [-7.5, 5.0, -5.0, 5.0]
const GOVERNED := [-8.3, 0.0, 5.0, 5.0]


class FakeGame extends Node:
	signal state_changed(state: StringName)
	signal toast_requested(kind: StringName)
	var view: Dictionary = {}
	var state: StringName = &"final"
	var calls: PackedStringArray = []

	func has_save() -> bool:
		return false

	func new_run(_seed: int = -1) -> void:
		calls.append("new_run")
		state = &"calibration"
		state_changed.emit(state)

	func resume() -> bool:
		return false

	func abandon() -> void:
		pass

	func current_state() -> StringName:
		return state

	func final_view() -> Dictionary:
		return view

	func hud() -> Array:
		return view.get("meters", [])


var _out := ""
var _tag := ""
var _main: Control
var _fake: FakeGame
var _settings: Node
var _data: Node
var _game: Node


func _initialize() -> void:
	_run.call_deferred()


func _run() -> void:
	var pc := false
	var only_first := false
	for a in OS.get_cmdline_user_args():
		if a.begins_with("--out="):
			_out = a.trim_prefix("--out=")
		elif a.begins_with("--tag="):
			_tag = a.trim_prefix("--tag=")
		elif a == "--pc":
			pc = true
		elif a == "--only-first":
			only_first = true
	if _out == "":
		_out = ProjectSettings.globalize_path("user://shots")
	DirAccess.make_dir_recursive_absolute(_out)
	create_timer(240.0).timeout.connect(func() -> void:
		printerr("FAIL: shot_final timed out")
		quit(1))
	_settings = root.get_node(^"Settings")
	_data = root.get_node(^"GameData")
	_game = root.get_node(^"Game")
	var saves := root.get_node(^"SaveManager")
	saves.path = TEST_SAVE
	var real_path: String = _settings.storage_path
	_settings.storage_path = TEST_SETTINGS
	_settings.reset_defaults(false)
	_apply_base_settings()   # -- --text=N (16-36) and --hc: base text size and high contrast (P-014 etapa 7)
	_fake = FakeGame.new()
	root.add_child(_fake)
	_main = (load(MAIN_SCENE) as PackedScene).instantiate() as Control
	_main.game = _fake
	_main.start_screen = &""
	root.add_child(_main)
	await _frames(3)
	if pc:
		await _pc_shots()
	elif only_first:
		await _show("paralisia")
		await _shot("t10_1_first_" + _tag)
	else:
		await _phone_shots()
	saves.delete()
	if FileAccess.file_exists(TEST_SETTINGS):
		DirAccess.remove_absolute(ProjectSettings.globalize_path(TEST_SETTINGS))
	_settings.storage_path = real_path
	print("shots saved in ", _out)
	quit(0)


func _phone_shots() -> void:
	await _show("paralisia")
	await _shot("t10_1_first")
	await _shot_full("t10_1_full")
	await _show("desintegracao")
	await _shot("t10_2_no_quote")
	await _show("comum")
	await _shot("t10_3_no_epilogue")
	await _show("colonia")
	await _shot("t10_4_catastrophe")
	await _show("renuncia")
	await _shot("t10_5_renuncia")
	await _show("paralisia")
	_settings.set_value(&"text_step", 125)
	await _frames(6)
	await _shot_full("t10_1_full_125")
	_settings.set_value(&"text_step", 150)
	await _frames(6)
	await _shot_full("t10_1_full_150")
	_settings.set_value(&"text_step", 100)
	_settings.set_value(&"high_contrast", true)
	await _frames(6)
	await _shot_full("t10_1_full_hc")
	_settings.set_value(&"high_contrast", false)
	await _frames(4)
	# Keyboard: focus ring on the Scroll, then Tab → "Jogar novamente" (scrolls to it).
	await _show("paralisia")
	_key(KEY_DOWN)   # keyboard mode on (Main) and one step down
	await _frames(4)
	root.gui_release_focus()   # the touch-mode focus stays hidden until it is grabbed again
	_main.give_focus(_main.current_screen().scroll())
	await _frames(6)
	await _shot("t10_1_scroll_focus")
	_key(KEY_TAB)
	await _frames(10)
	await _shot("t10_1_focus_play_again")
	_main.current_screen().buttons()[1].pressed.emit()
	await _frames(20)
	await _shot("t10_1_share_toast")
	_main.toast().hide_now()
	# A real seeded run (Game autoload), any ending.
	await _real_run(4)
	await _shot_full("t10_real_full")


func _pc_shots() -> void:
	await _show("paralisia")
	await _shot("t16_3_pc_first")
	await _shot_full("t16_3_pc_full")


## Shows a board frame through the fake Game.
func _show(frame: String) -> void:
	_fake.view = _board_view(frame)
	_main.game = _fake
	_main.go_to(&"final", {"fade_time": 0.0})
	await _settle()


func _board_view(frame: String) -> Dictionary:
	var f: Dictionary = FRAMES[frame]
	var e: Dictionary = _data.endings.get(f["id"], {})
	var meters := []
	for i in METERS.size():
		var v: int = f["vals"][i]
		meters.append({"id": METERS[i], "name": Tokens.METER_NAMES[METERS[i]], "value": v, "band": Tokens.band_of(v)})
	var dom := AxisRules.dominant(GOVERNED)
	return {
		"ending": {"id": f["id"], "name": e.get("name", "[a definir]"), "category": e.get("category", ""),
			"category_label": EndingRules.category_label(String(e.get("category", ""))),
			"quote": "" if e.get("quote") == null else e.get("quote"),
			"author": "" if e.get("author") == null else e.get("author"), "source": ""},
		"description": String(e.get("description", "")),
		"reason": f["reason"], "meter": "", "meter_name": "", "year": 3,
		"epilogue": f["epi"],
		"axis": {"said": SAID, "governed": GOVERNED, "names": Array(AxisRules.NAMES), "poles": AxisRules.POLES,
			"dominant": dom, "dominant_name": AxisRules.NAMES[dom], "dominant_pole": AxisRules.pole_for(dom, GOVERNED[dom]),
			"text": AxisRules.text_for(dom, GOVERNED[dom])},
		"meters": meters,
		"reveal_text": f["padrao"],
		"closing_phrase": AxisRules.CLOSING_PHRASE,
	}


## Plays a real run with a fixed seed (always side +1) and shows its final screen.
func _real_run(run_seed: int) -> void:
	_game.new_run(run_seed)
	var steps := 0
	while _game.current_state() != &"final" and steps < 1000:
		steps += 1
		match _game.current_state():
			&"calibration":
				_game.answer_calibration(1)
			&"year_intro":
				_game.continue_from_year()
			&"events":
				_game.continue_from_event()
			&"card":
				_game.choose(1)
			&"consequence":
				_game.continue_from_consequence()
			&"learning":
				_game.continue_from_learning()
			&"impeachment":
				if _game.impeachment_view()["stage"] == "phase":
					_game.choose_impeachment(1)
				else:
					_game.continue_impeachment()
	var v: Dictionary = _game.final_view()
	print("real run seed %d → %s (%s), epilogue %d" % [run_seed, v["ending"]["id"], v["reason"], v["epilogue"].size()])
	_main.game = _game
	_main.go_to(&"final", {"fade_time": 0.0})
	await _settle()


# --- Capture ----------------------------------------------------------------------------------

func _shot(name: String) -> void:
	await RenderingServer.frame_post_draw
	var img := root.get_texture().get_image()
	var path := _out.path_join(name + ".png")
	img.save_png(path)
	print("saved ", path, " ", img.get_size())


## Whole page: scrolls in steps and stitches the frames (the window keeps its size, so the
## stretch scale does not change). Pixel offsets = scroll × window/canvas scale.
func _shot_full(name: String) -> void:
	var screen: Control = _main.current_screen()
	var scroll: ScrollContainer = screen.scroll()
	var bar := scroll.get_v_scroll_bar()
	root.gui_release_focus()   # no focus ring repeated in every stitched frame
	scroll.scroll_vertical = 0
	await _frames(4)
	await RenderingServer.frame_post_draw
	var first := root.get_texture().get_image()
	var px_per_unit := float(first.get_height()) / _main.size.y
	var max_scroll := int(maxf(0.0, bar.max_value - bar.page))
	var out := Image.create(first.get_width(), first.get_height() + int(round(max_scroll * px_per_unit)), false, first.get_format())
	out.blit_rect(first, Rect2i(Vector2i.ZERO, first.get_size()), Vector2i.ZERO)
	var step := int(scroll.size.y) - Tokens.ESP_48
	var target := 0
	while target < max_scroll:
		target = mini(target + step, max_scroll)
		scroll.scroll_vertical = target
		await _frames(3)
		await RenderingServer.frame_post_draw
		var img := root.get_texture().get_image()
		out.blit_rect(img, Rect2i(Vector2i.ZERO, img.get_size()), Vector2i(0, int(round(scroll.scroll_vertical * px_per_unit))))
	scroll.scroll_vertical = 0
	var path := _out.path_join(name + ".png")
	out.save_png(path)
	print("saved ", path, " ", out.get_size(), " (page ", screen.get_node(^"%Page").size.y, ")")
	await _frames(2)


func _settle() -> void:
	var guard := 0
	await process_frame
	while _main.is_busy() and guard < 600:
		guard += 1
		await process_frame
	await _frames(4)


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


## Base settings from the command line: --text=16|18|20|24|36 and --hc. The variant shots of
## this script still set their own sizes; this only changes the base pages.
func _apply_base_settings() -> void:
	for a in OS.get_cmdline_user_args():
		if a.begins_with("--text="):
			_settings.set_value(&"text_step", int(a.trim_prefix("--text=")))
		elif a == "--hc":
			_settings.set_value(&"high_contrast", true)
