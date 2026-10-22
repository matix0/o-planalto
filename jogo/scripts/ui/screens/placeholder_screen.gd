extends AppScreen
## Stand-in for screens that do not exist yet (wave 2: calibration, game, final).
## Shows the screen id and "Em construção"; the pause works on "calibration"
## and "game" so the shell can be tried end to end.

const BUILDING := "Em construção"
const PAUSABLE_IDS: Array[StringName] = [&"calibration", &"game", &"impeachment"]

@onready var _safe_area: MarginContainer = %SafeArea
@onready var _title: Label = %Title
@onready var _id_label: Label = %IdLabel
@onready var _home: Button = %HomeButton


func _ready() -> void:
	_title.text = BUILDING
	_home.pressed.connect(func() -> void: request.emit(&"title", {}))


func enter(params: Dictionary = {}) -> void:
	_id_label.text = "Tela: %s" % screen_id
	if not params.get("returned", false):
		focus_first(_home)


func allows_pause() -> bool:
	return PAUSABLE_IDS.has(screen_id)


func _apply_safe_area() -> void:
	fit_margins(_safe_area, Tokens.ESP_24, Tokens.ESP_24)
