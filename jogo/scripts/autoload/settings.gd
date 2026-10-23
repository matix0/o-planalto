extends Node
## Player settings (autoload `Settings`). Kept between runs in a ConfigFile;
## no game data lives here (gdd/sistemas/10_estado_partida.md §3.5).
## Sources: docs/14 §14.12.1, D-158 (drag limit), D-165 (text sizes), D-169 (36 px test step).

signal changed(key: StringName)

const DEFAULT_PATH := "user://settings.cfg"
const SECTION := "settings"
const TEXT_STEPS: Array[int] = [100, 125, 150]   # text scale in % (D-207, replaces the 16-24 px selector of D-165)
const P1_TEXT_STEP := 150                         # at the largest scale: no portrait, the problem scrolls (D-169)
## Values stored by earlier builds (px steps) → nearest scale.
const LEGACY_STEPS := {16: 100, 18: 100, 20: 100, 24: 125, 36: 150}
const DEFAULTS := {
	&"text_step": 100,
	&"reduce_motion": false,
	&"high_contrast": false,
	&"drag_limit": 0.40,
	&"tutorial_seen": false,
	&"audio": {},          # [a definir] — audio controls are not defined in the docs (14A §14A.07 #5)
}

## Where the file lives. Tests point this somewhere else before calling load_settings().
var storage_path: String = DEFAULT_PATH

var text_step: int = DEFAULTS[&"text_step"]
var reduce_motion: bool = DEFAULTS[&"reduce_motion"]
var high_contrast: bool = DEFAULTS[&"high_contrast"]
var drag_limit: float = DEFAULTS[&"drag_limit"]
var tutorial_seen: bool = DEFAULTS[&"tutorial_seen"]
var audio: Dictionary = {}


func _ready() -> void:
	load_settings()


## Validates, stores, saves and emits `changed`. Unknown keys are ignored.
func set_value(key: StringName, value: Variant) -> void:
	if not DEFAULTS.has(key):
		push_warning("Settings: unknown key %s" % key)
		return
	var clean: Variant = _sanitize(key, value)
	if get(key) == clean:
		return
	set(key, clean)
	save_settings()
	changed.emit(key)


func get_value(key: StringName) -> Variant:
	return get(key) if DEFAULTS.has(key) else null


func reset_defaults(save := true) -> void:
	for key in DEFAULTS:
		set(key, _sanitize(key, DEFAULTS[key]))
	if save:
		save_settings()
	changed.emit(&"all")


func load_settings() -> void:
	var cfg := ConfigFile.new()
	if cfg.load(storage_path) != OK:
		reset_defaults(false)
		return
	for key in DEFAULTS:
		set(key, _sanitize(key, cfg.get_value(SECTION, String(key), DEFAULTS[key])))
	changed.emit(&"all")


func save_settings() -> bool:
	var cfg := ConfigFile.new()
	for key in DEFAULTS:
		cfg.set_value(SECTION, String(key), get(key))
	var err := cfg.save(storage_path)
	if err != OK:
		push_warning("Settings: cannot save %s (%s)" % [storage_path, error_string(err)])
	return err == OK


## Drag limit as a percentage, for labels and accessibility ("40%").
func drag_limit_percent() -> int:
	return int(round(drag_limit * 100.0))


func _sanitize(key: StringName, value: Variant) -> Variant:
	match key:
		&"text_step":
			var step: int = int(value) if (value is int or value is float) else int(DEFAULTS[key])
			if TEXT_STEPS.has(step):
				return step
			return LEGACY_STEPS.get(step, DEFAULTS[key])
		&"drag_limit":
			var limit: float = float(value) if (value is int or value is float) else float(DEFAULTS[key])
			return clampf(limit, Tokens.DRAG_LIMIT_MIN, Tokens.DRAG_LIMIT_DEFAULT)
		&"audio":
			return (value as Dictionary).duplicate() if value is Dictionary else {}
		_:
			return bool(value) if (value is bool or value is int or value is float) else DEFAULTS[key]
