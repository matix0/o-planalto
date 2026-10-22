extends SceneTree
## P-018 (playtest on phones): inside every ScrollContainer, no control may stop the finger drag
## (mouse_filter STOP) over a large area, or the list will not scroll on a touchscreen (the
## "Saiba mais" bug). Buttons, links, sliders and switches keep STOP: a drag that starts on
## them is the platform norm. Also: no control both reads InputEventScreenTouch and a mouse
## click (a touch arrives as both, so it fired twice — the HUD legend bug).
## godot --headless --path jogo -s res://tests/test_touch_scroll.gd

const SCENES := ["res://scenes/main.tscn"]
const SCREENS := ["res://scenes/screens/final.tscn", "res://scenes/screens/about.tscn",
	"res://scenes/screens/settings.tscn", "res://scenes/screens/game.tscn",
	"res://scenes/screens/impeachment.tscn", "res://scenes/components/learning_sheet.tscn"]
const MAX_STOP_AREA := 48.0 * 48.0 * 4.0
var _failures: PackedStringArray = []


func _initialize() -> void:
	_run.call_deferred()


func _run() -> void:
	for path in SCREENS:
		var node: Node = (load(path) as PackedScene).instantiate()
		root.add_child(node)
		if node is Control:
			(node as Control).size = Vector2(390, 844)
		for i in 5:
			await process_frame
		for scroll in node.find_children("*", "ScrollContainer", true, false):
			_check(scroll, path)
		node.queue_free()
		await process_frame
	_scan_sources()
	if _failures.is_empty():
		print("test_touch_scroll: OK")
		quit(0)
	else:
		for f in _failures:
			printerr("FAIL: " + f)
		quit(1)


func _check(scroll: ScrollContainer, where: String) -> void:
	for n in scroll.find_children("*", "Control", true, false):
		var c := n as Control
		if c.mouse_filter != Control.MOUSE_FILTER_STOP or c is BaseButton or c is Range or c is ScrollBar:
			continue
		var area := c.size.x * c.size.y
		if area > MAX_STOP_AREA:
			_failures.append("%s: %s (%s, %dx%d) stops the drag inside %s" % [where.get_file(), c.name, c.get_class(), c.size.x, c.size.y, scroll.name])


func _scan_sources() -> void:
	for f in _files("res://scripts"):
		var text := FileAccess.get_file_as_string(f)
		if text.contains("InputEventScreenTouch") and text.contains("InputEventMouseButton") and not f.ends_with("main.gd"):
			_failures.append("%s reads both touch and mouse: a touch fires twice" % f)


func _files(dir: String) -> Array[String]:
	var out: Array[String] = []
	for d in DirAccess.get_directories_at(dir):
		out.append_array(_files(dir.path_join(d)))
	for f in DirAccess.get_files_at(dir):
		if f.ends_with(".gd"):
			out.append(dir.path_join(f))
	return out
