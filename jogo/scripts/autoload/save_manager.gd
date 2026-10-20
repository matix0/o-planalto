extends Node
## The single saved run (gdd/sistemas/10_estado_partida.md §3.5, §5): `user://save.json`,
## JSON with `format_version` (RunState.FORMAT_VERSION). Settings live in the Settings
## autoload, never here. Game decides when to save and delete.

const DEFAULT_PATH := "user://save.json"

## Where the run is saved. Tests point it to a file of their own.
var path: String = DEFAULT_PATH
## Why the last save_run() or load_run() failed ("" when it did not).
var last_error: String = ""


func has_save() -> bool:
	return FileAccess.file_exists(path)


## Writes the run; false when the platform refuses (no space, browser without storage, …).
func save_run(run: Dictionary) -> bool:
	last_error = ""
	var f := FileAccess.open(path, FileAccess.WRITE)
	if f == null:
		last_error = "cannot write %s (%s)" % [path, error_string(FileAccess.get_open_error())]
		return false
	f.store_string(JSON.stringify(run))
	var err := f.get_error()
	f.close()
	if err != OK:
		last_error = "write error (%s)" % error_string(err)
		return false
	return true


## The saved run, or {} when there is none or it cannot be used: unreadable, not JSON, or
## another format version (gdd 10 §5 — the caller deletes it and warns the player).
func load_run() -> Dictionary:
	last_error = ""
	if not has_save():
		return {}
	var text := FileAccess.get_file_as_string(path)
	if text.is_empty():
		last_error = "empty or unreadable save"
		return {}
	var json := JSON.new()
	if json.parse(text) != OK or not json.data is Dictionary:
		last_error = "save is not a JSON object"
		return {}
	var d: Dictionary = json.data
	var version = d.get("format_version")
	if not (version is float or version is int) or int(version) != RunState.FORMAT_VERSION:
		last_error = "save format %s, expected %d" % [str(version), RunState.FORMAT_VERSION]
		return {}
	return d


func delete() -> void:
	if has_save():
		DirAccess.remove_absolute(path)
