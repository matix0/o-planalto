extends Node
## The single saved run (gdd/sistemas/10_estado_partida.md §3.5, §5): `user://save.json`,
## JSON with `format_version` (RunState.FORMAT_VERSION). Settings live in the Settings
## autoload, never here. Game decides when to save and delete.
## Atomic write (V-008): the run goes to `save.json.tmp`, which then replaces `save.json`;
## a crash mid-write leaves the previous save intact. On the Web, user:// lives in IndexedDB,
## synced by the engine after the write: in the Web export (Chromium, P-014) a choice survived
## closing the tab 300 ms after it; closing within ~150 ms kept the previous save.

const DEFAULT_PATH := "user://save.json"

## Where the run is saved. Tests point it to a file of their own.
var path: String = DEFAULT_PATH
## Why the last save_run() or load_run() failed ("" when it did not).
var last_error: String = ""


func has_save() -> bool:
	return FileAccess.file_exists(path) or FileAccess.file_exists(_tmp())


## Writes the run; false when the platform refuses (no space, browser without storage, …).
func save_run(run: Dictionary) -> bool:
	last_error = ""
	var tmp := _tmp()
	var f := FileAccess.open(tmp, FileAccess.WRITE)
	if f == null:
		last_error = "cannot write %s (%s)" % [tmp, error_string(FileAccess.get_open_error())]
		return false
	f.store_string(JSON.stringify(run))
	f.flush()
	var err := f.get_error()
	f.close()
	if err != OK:
		last_error = "write error (%s)" % error_string(err)
		DirAccess.remove_absolute(tmp)
		return false
	err = DirAccess.rename_absolute(tmp, path)
	if err != OK and FileAccess.file_exists(path):
		# Platforms whose rename does not replace an existing file: remove, then rename.
		DirAccess.remove_absolute(path)
		err = DirAccess.rename_absolute(tmp, path)
	if err != OK:
		last_error = "cannot replace %s (%s)" % [path, error_string(err)]
		return false
	return true


## The saved run, or {} when there is none or it cannot be used: unreadable, not JSON, or
## another format version (gdd 10 §5 — the caller deletes it and warns the player).
func load_run() -> Dictionary:
	last_error = ""
	if not has_save():
		return {}
	# A crash between the remove and the rename of the fallback leaves only the .tmp.
	var source := path if FileAccess.file_exists(path) else _tmp()
	var text := FileAccess.get_file_as_string(source)
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
	for p in [path, _tmp()]:
		if FileAccess.file_exists(p):
			DirAccess.remove_absolute(p)


func _tmp() -> String:
	return path + ".tmp"
