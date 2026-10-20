extends SceneTree
## Screenshots of the UI kit gallery (Lote B). Not part of run_all.sh: it
## needs a display. On a copy of jogo/ (.claude/rules/isolamento.md):
##   godot --headless --path <copy> --import
##   SHOT_DIR=/abs/dir xvfb-run -a -s "-screen 0 1280x1024x24" godot --path <copy> \
##     --rendering-driver opengl3 --resolution 390x844 -s res://tests/shot_ui_kit.gd
## Saves <SHOT_DIR>/<page>.png (390×844) for every gallery page, plus the
## card → HUD timeline (A-06 to A-10) after a real drag on T-06.1:
## anim_0_drag (finger beyond the limit), anim_1 … anim_4 at ~120, 350, 650
## and 1300 ms after the release. SHOT_PAGES=a,b limits the pages.

const TIMELINE_MS: Array[int] = [120, 350, 650, 1300]

var _out := ""


func _initialize() -> void:
	_run.call_deferred()


func _run() -> void:
	_out = OS.get_environment("SHOT_DIR")
	if _out == "":
		_out = ProjectSettings.globalize_path("user://shots/ui_kit")
	DirAccess.make_dir_recursive_absolute(_out)
	var gallery: Control = load("res://scenes/dev/gallery.tscn").instantiate()
	gallery.show_nav = false
	root.add_child(gallery)
	var only := OS.get_environment("SHOT_PAGES")
	for page: StringName in gallery.pages():
		if only != "" and not only.split(",").has(String(page)):
			continue
		gallery.show_page(page)
		for i in 6:
			await process_frame
		await _shot(String(page))
	if only == "" or only.split(",").has("anim"):
		await _timeline(gallery)
	quit(0)


func _timeline(gallery: Control) -> void:
	gallery.show_page(&"t06_1")
	for i in 6:
		await process_frame
	var card: SwipeCard = gallery.current_refs().card
	var c := card.card_rect().get_center()
	card.handle_pointer(_button(c, true))
	for i in range(1, 11):
		card.handle_pointer(_motion(c - Vector2(i * 13, 0)))
	for i in 3:
		await process_frame
	await _shot("anim_0_drag")
	var start := Time.get_ticks_msec()
	card.handle_pointer(_button(c - Vector2(130, 0), false))
	for i in TIMELINE_MS.size():
		while Time.get_ticks_msec() - start < TIMELINE_MS[i]:
			await process_frame
		await _shot("anim_%d_%dms" % [i + 1, Time.get_ticks_msec() - start])


func _shot(name: String) -> void:
	await RenderingServer.frame_post_draw
	var err := root.get_texture().get_image().save_png(_out.path_join(name + ".png"))
	print("shot %s: %s" % [name, "ok" if err == OK else error_string(err)])


func _button(pos: Vector2, pressed: bool) -> InputEventMouseButton:
	var e := InputEventMouseButton.new()
	e.button_index = MOUSE_BUTTON_LEFT
	e.pressed = pressed
	e.position = pos
	return e


func _motion(pos: Vector2) -> InputEventMouseMotion:
	var e := InputEventMouseMotion.new()
	e.position = pos
	e.button_mask = MOUSE_BUTTON_MASK_LEFT
	return e
