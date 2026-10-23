extends SceneTree
## Headless: godot --headless --path jogo -s res://tests/test_settings.gd
## Settings autoload: defaults, validation/clamping, `changed` signal and a
## ConfigFile round-trip in a temporary file — the real user://settings.cfg is
## never written (checked by existence and modification time).

const TEST_PATH := "user://test_settings_tmp.cfg"

var _failures: PackedStringArray = []


func _initialize() -> void:
	_run.call_deferred()


func _run() -> void:
	var settings: Node = root.get_node(^"Settings")
	var real_path: String = settings.storage_path
	var real_existed := FileAccess.file_exists(real_path)
	var real_mtime := FileAccess.get_modified_time(real_path) if real_existed else 0
	settings.storage_path = TEST_PATH
	_remove(TEST_PATH)

	# Defaults (D-207 text 100%, D-146/D-158 drag 0.40).
	settings.reset_defaults(false)
	_expect(settings.text_step == 100, "default text_step 100")
	_expect(settings.reduce_motion == false, "default reduce_motion off")
	_expect(settings.high_contrast == false, "default high_contrast off")
	_expect(is_equal_approx(settings.drag_limit, 0.40), "default drag_limit 0.40")
	_expect(settings.tutorial_seen == false, "default tutorial_seen off")
	_expect(settings.drag_limit_percent() == 40, "drag_limit_percent 40")
	_expect(not FileAccess.file_exists(TEST_PATH), "reset_defaults(false) does not write")

	# Validation and clamping.
	var seen: Array[StringName] = []
	settings.changed.connect(func(k: StringName) -> void: seen.append(k))
	settings.set_value(&"text_step", 17)
	_expect(settings.text_step == 100, "invalid step falls back to 100")
	for step in [125, 150, 100]:
		settings.set_value(&"text_step", step)
		_expect(settings.text_step == step, "scale %d%% accepted" % step)
	# Values saved by earlier builds (px steps) move to the nearest scale (D-207).
	for pair in [[16, 100], [18, 100], [20, 100], [24, 125], [36, 150]]:
		settings.set_value(&"text_step", 100)
		settings.set_value(&"text_step", pair[0])
		_expect(settings.text_step == pair[1], "legacy %d px -> %d%%" % [pair[0], pair[1]])
	settings.set_value(&"text_step", "big")
	_expect(settings.text_step == 100, "non-number step -> 100")
	settings.set_value(&"drag_limit", 0.1)
	_expect(is_equal_approx(settings.drag_limit, 0.25), "drag_limit clamped to 0.25")
	settings.set_value(&"drag_limit", 0.9)
	_expect(is_equal_approx(settings.drag_limit, 0.40), "drag_limit clamped to 0.40")
	settings.set_value(&"drag_limit", 0.33)
	_expect(is_equal_approx(settings.drag_limit, 0.33), "drag_limit 0.33 kept")
	settings.set_value(&"no_such_key", 1)
	_expect(settings.get_value(&"no_such_key") == null, "unknown key ignored")

	# Signal: emitted once per real change, not for the same value.
	seen.clear()
	settings.set_value(&"reduce_motion", true)
	settings.set_value(&"reduce_motion", true)
	_expect(seen.size() == 1 and seen[0] == &"reduce_motion", "changed emitted once (%s)" % [seen])

	# Round-trip through the temporary file.
	settings.set_value(&"text_step", 125)
	settings.set_value(&"high_contrast", true)
	settings.set_value(&"drag_limit", 0.3)
	settings.set_value(&"tutorial_seen", true)
	_expect(FileAccess.file_exists(TEST_PATH), "set_value writes the file")
	settings.reset_defaults(false)
	_expect(settings.text_step == 100 and not settings.high_contrast, "memory reset")
	settings.load_settings()
	_expect(settings.text_step == 125, "round-trip text_step")
	_expect(settings.reduce_motion == true, "round-trip reduce_motion")
	_expect(settings.high_contrast == true, "round-trip high_contrast")
	_expect(is_equal_approx(settings.drag_limit, 0.3), "round-trip drag_limit")
	_expect(settings.tutorial_seen == true, "round-trip tutorial_seen")

	# A tampered file is sanitized; a corrupt one falls back to defaults.
	var cfg := ConfigFile.new()
	cfg.set_value("settings", "text_step", 99)
	cfg.set_value("settings", "drag_limit", -3.0)
	cfg.set_value("settings", "high_contrast", "yes")
	cfg.save(TEST_PATH)
	settings.load_settings()
	_expect(settings.text_step == 100, "tampered step -> 100")
	_expect(is_equal_approx(settings.drag_limit, 0.25), "tampered drag -> 0.25")
	_expect(settings.high_contrast == false, "tampered bool -> default")
	var f := FileAccess.open(TEST_PATH, FileAccess.WRITE)
	f.store_string("[[[ not a config")
	f.close()
	settings.load_settings()
	_expect(settings.text_step == 100 and settings.tutorial_seen == false, "corrupt file -> defaults")

	# Clean up; the real file was not touched.
	_remove(TEST_PATH)
	settings.storage_path = real_path
	_expect(FileAccess.file_exists(real_path) == real_existed, "real settings file existence unchanged")
	if real_existed:
		_expect(FileAccess.get_modified_time(real_path) == real_mtime, "real settings file not rewritten")
	_finish("test_settings")


func _remove(path: String) -> void:
	if FileAccess.file_exists(path):
		DirAccess.remove_absolute(ProjectSettings.globalize_path(path))


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
