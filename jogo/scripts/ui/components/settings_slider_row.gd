class_name SettingsSliderRow
extends VBoxContainer
## C-20 — sensibilidade do arraste: HSlider 25–40 % (D-146, D-158; T-12.1).
## Trilho 4 px #78909C; parte cheia e polegar 24 brancos com anel 2 px #263238;
## alvo de 48 px de altura. Escala embaixo: "25%" e "40% (padrão)".
## O passo do slider é [a definir] (C-20): SENSITIVITY_STEP.

signal value_changed(fraction: float)

const TITLE := "Sensibilidade do arraste"
const SENSITIVITY_STEP := 0.01      # [a definir] — passo do slider (C-20)
const MIN_LABEL := "25%"
const MAX_LABEL := "40% (padrão)"
const GRABBER := 24
const GRABBER_RASTER_SCALE := 3.0   # crisp on hi-dpi; drawn at 24×24 canvas units

@onready var _title: Label = %Title
@onready var _slider: HSlider = %Slider
@onready var _min_label: Label = %MinLabel
@onready var _max_label: Label = %MaxLabel

static var _grabber_tex: Texture2D


func _ready() -> void:
	_title.text = TITLE
	_min_label.text = MIN_LABEL
	_max_label.text = MAX_LABEL
	_slider.min_value = Tokens.DRAG_LIMIT_MIN
	_slider.max_value = Tokens.DRAG_LIMIT_DEFAULT
	_slider.step = SENSITIVITY_STEP
	_slider.custom_minimum_size.y = Tokens.TOUCH_MIN
	_slider.set_value_no_signal(Settings.drag_limit)
	_slider.value_changed.connect(_on_slider_changed)
	_apply_styles()
	_update_name()


func _notification(what: int) -> void:
	if what == NOTIFICATION_THEME_CHANGED and is_node_ready():
		_apply_styles()


func set_fraction(v: float) -> void:
	_slider.set_value_no_signal(v)
	_update_name()


func fraction() -> float:
	return _slider.value


func percent() -> int:
	return int(round(_slider.value * 100.0))


func slider() -> HSlider:
	return _slider


func _on_slider_changed(v: float) -> void:
	_update_name()
	value_changed.emit(v)


func _update_name() -> void:
	_slider.accessibility_name = "%s: %d%%" % [TITLE, percent()]


func _apply_styles() -> void:
	var track := StyleBoxFlat.new()
	track.bg_color = Tokens.INACTIVE
	track.set_corner_radius_all(Tokens.ESP_2)
	track.content_margin_top = Tokens.ESP_2
	track.content_margin_bottom = Tokens.ESP_2
	track.anti_aliasing = true
	if Settings.high_contrast:
		track.set_border_width_all(1)
		track.border_color = Tokens.TEXT
	var fill := track.duplicate() as StyleBoxFlat
	fill.bg_color = Tokens.TEXT
	_slider.add_theme_stylebox_override(&"slider", track)
	_slider.add_theme_stylebox_override(&"grabber_area", fill)
	_slider.add_theme_stylebox_override(&"grabber_area_highlight", fill)
	var tex := _grabber()
	for icon in [&"grabber", &"grabber_highlight", &"grabber_disabled"]:
		_slider.add_theme_icon_override(icon, tex)


static func _grabber() -> Texture2D:
	if _grabber_tex:
		return _grabber_tex
	var r := GRABBER / 2.0
	var svg := "<svg xmlns='http://www.w3.org/2000/svg' width='%d' height='%d'><circle cx='%s' cy='%s' r='%s' fill='#FFFFFF' stroke='#263238' stroke-width='2'/></svg>" % [GRABBER, GRABBER, r, r, r - 1.0]
	var img := Image.new()
	if img.load_svg_from_string(svg, GRABBER_RASTER_SCALE) != OK:
		img = Image.create_empty(GRABBER, GRABBER, false, Image.FORMAT_RGBA8)
		img.fill(Tokens.TEXT)
	var tex := ImageTexture.create_from_image(img)
	tex.set_size_override(Vector2i(GRABBER, GRABBER))
	_grabber_tex = tex
	return tex
