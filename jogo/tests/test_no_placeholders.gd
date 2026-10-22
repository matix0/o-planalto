extends SceneTree
## P-017: no wireframe marker reaches the player. Scans every string literal in the game's
## scripts and every `text = "..."` in the scenes and data for "a definir" or a "[...]" marker.
## Comments, the dev gallery and the tests are out (they document the open points).
## godot --headless --path jogo -s res://tests/test_no_placeholders.gd

const ROOTS := ["res://scripts", "res://scenes", "res://data"]
const SKIP := ["res://scripts/dev"]
var _failures: PackedStringArray = []


func _initialize() -> void:
	for r in ROOTS:
		_scan_dir(r)
	if _failures.is_empty():
		print("test_no_placeholders: OK")
		quit(0)
	else:
		for f in _failures:
			printerr("FAIL: " + f)
		quit(1)


func _scan_dir(path: String) -> void:
	if path in SKIP:
		return
	for d in DirAccess.get_directories_at(path):
		_scan_dir(path.path_join(d))
	for f in DirAccess.get_files_at(path):
		if f.get_extension() in ["gd", "tscn", "json"]:
			_scan_file(path.path_join(f))


func _scan_file(path: String) -> void:
	var lines := FileAccess.get_file_as_string(path).split("\n")
	var quoted := RegEx.create_from_string("\"((?:[^\"\\\\]|\\\\.)*)\"")
	for i in lines.size():
		var line := lines[i]
		if path.ends_with(".gd"):
			var hash := _comment_start(line)
			if hash >= 0:
				line = line.left(hash)
		elif path.ends_with(".tscn") and not line.begins_with("text = "):
			continue
		for m in quoted.search_all(line):
			var s := m.get_string(1)
			if s.containsn("a definir") or (s.begins_with("[") and s.ends_with("]") and s.length() > 2 and not s.contains("%")):
				_failures.append("%s:%d shows %s" % [path, i + 1, s])


## Index of a "#" outside a string, or -1.
static func _comment_start(line: String) -> int:
	var in_str := false
	var i := 0
	while i < line.length():
		var c := line[i]
		if c == "\\" and in_str:
			i += 2
			continue
		if c == "\"":
			in_str = not in_str
		elif c == "#" and not in_str:
			return i
		i += 1
	return -1
