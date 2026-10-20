class_name MeterIcon
extends VBoxContainer
## C-01 — meter icon (docs/14 §14.03, §14.10; D-156, D-161, D-162).
## A 32 px well that fills bottom-up in the band color [em revisão — TA],
## a glyph with a dark halo, the previous level as a striped trail while it
## fills, an effect dot above it (C-08, no direction), a pulse when the band
## changes and a shatter at 0. During the game it never shows the number;
## `show_number` is only for the final screen (T-10).

signal animation_finished(meter_id: String)

const PX_PER_POINT := 0.32          # 32 px well / 100 points
const FILL_TIME := 0.4              # A-07, 300-500 ms
const TRAIL_FADE := 0.15            # A-08
const BAND_COLOR_TIME := 0.25       # A-09
const PULSE_TIME := 0.2             # A-09, 1.0 → 1.1 → 1.0
const PULSE_SCALE := 1.1
const SHATTER_TIME := 0.6           # A-15, 500-800 ms
const SHORT_FADE := 0.15            # "Reduzir movimento" keeps short fades

@export var meter_id: String = "dignity":
	set(v):
		meter_id = v
		if is_node_ready():
			_apply_glyph()
			_update_accessibility()

@export var show_number: bool = false:
	set(v):
		show_number = v
		if is_node_ready():
			_number.visible = v

var value: int = 50
var high_contrast: bool = false:
	set(v):
		high_contrast = v
		if is_node_ready():
			_apply_contrast()

var _tween: Tween
var _trail_tween: Tween
var _fx_tween: Tween

@onready var _dot: EffectDot = $DotSlot/EffectDot
@onready var _well: TextureProgressBar = $Well
@onready var _trail: TextureRect = $Well/Trail
@onready var _glyph: TextureRect = $Well/Glyph
@onready var _edge: Panel = $Well/Edge
@onready var _broken: TextureRect = $Well/Broken
@onready var _number: Label = $Number

static var _textures: Dictionary = {}


func _ready() -> void:
	_well.offset_transform_enabled = true
	_well.offset_transform_pivot_ratio = Vector2(0.5, 0.5)
	_well.texture_progress = rounded_texture(Color.WHITE)
	_trail.texture = stripe_texture()
	_trail.visible = false
	_broken.visible = false
	_number.visible = show_number
	var edge := StyleBoxFlat.new()
	edge.draw_center = false
	edge.set_border_width_all(2)
	edge.border_color = Tokens.TEXT
	edge.set_corner_radius_all(Tokens.RADIUS_8)
	_edge.add_theme_stylebox_override(&"panel", edge)
	_apply_glyph()
	_apply_contrast()
	set_value(value)


## Shows a value with no animation (start of a screen, resume, gallery).
func set_value(v: int) -> void:
	_kill()
	value = clampi(v, 0, 100)
	_well.value = value
	_well.tint_progress = Tokens.band_color(value)
	_well.offset_transform_scale = Vector2.ONE
	_well.offset_transform_position = Vector2.ZERO
	_trail.visible = false
	_broken.visible = value == 0
	_broken.modulate.a = 1.0
	_dot.show_static(EffectDot.Kind.NONE)
	_number.text = str(value)
	_update_accessibility()


## Frozen state for static frames and the gallery: trail from `previous`,
## a dot, and the pulse peak.
func show_state(v: int, previous: int = -1, dot: StringName = &"", pulse: bool = false) -> void:
	set_value(v)
	if previous >= 0 and previous != v:
		_place_trail(previous, v)
		_trail.modulate.a = 1.0
		_trail.visible = true
	_dot.show_static(EffectDot.kind_from(dot))
	if pulse:
		_well.offset_transform_scale = Vector2.ONE * PULSE_SCALE


## A-07 to A-10 (and A-15 at 0): animates old → new. Timing comes from Hud
## (repo timing or the prompt's, divergence D16).
func animate_change(old_value: int, new_value: int, dot: StringName, reduce_motion: bool,
		dot_delay: float = 0.1, dot_lifetime: float = 0.5, fill_delay: float = 0.1) -> void:
	_kill()
	old_value = clampi(old_value, 0, 100)
	new_value = clampi(new_value, 0, 100)
	value = new_value
	_number.text = str(new_value)
	_well.value = old_value
	_well.tint_progress = Tokens.band_color(old_value)
	_well.offset_transform_scale = Vector2.ONE
	_broken.visible = false
	_dot.play(EffectDot.kind_from(dot), dot_delay, dot_lifetime, reduce_motion)
	if old_value != new_value:
		_place_trail(old_value, new_value)
		_trail.modulate.a = 1.0
		_trail.visible = true
	var band_changed := Tokens.band_of(old_value) != Tokens.band_of(new_value)
	var fx_time := 0.0
	_tween = create_tween()
	_tween.tween_interval(fill_delay)
	_tween.tween_property(_well, "value", float(new_value), FILL_TIME) \
		.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	_tween.tween_callback(_fade_trail)
	if new_value == 0:
		_tween.tween_callback(_shatter.bind(reduce_motion))
		fx_time = SHATTER_TIME if not reduce_motion else SHORT_FADE
	elif band_changed:
		_tween.tween_callback(_band_change.bind(new_value, reduce_motion))
		fx_time = BAND_COLOR_TIME
	var finished_at := maxf(fill_delay + FILL_TIME + fx_time, dot_delay + dot_lifetime)
	_tween.tween_interval(finished_at - (fill_delay + FILL_TIME))
	_tween.tween_callback(_on_done)


func band() -> int:
	return Tokens.band_of(value)


func _on_done() -> void:
	_update_accessibility()
	animation_finished.emit(meter_id)


func _fade_trail() -> void:
	if _trail_tween and _trail_tween.is_valid():
		_trail_tween.kill()
	_trail_tween = create_tween()
	_trail_tween.tween_property(_trail, "modulate:a", 0.0, TRAIL_FADE)
	_trail_tween.tween_callback(func() -> void: _trail.visible = false)


## A-09: new band color in 250 ms + pulse 1.0 → 1.1 → 1.0 in 200 ms.
## Reduce motion: color only (docs/14 §14.10.3).
func _band_change(new_value: int, reduce_motion: bool) -> void:
	if _fx_tween and _fx_tween.is_valid():
		_fx_tween.kill()
	_fx_tween = create_tween().set_parallel(true)
	_fx_tween.tween_property(_well, "tint_progress", Tokens.band_color(new_value), BAND_COLOR_TIME)
	if not reduce_motion:
		_fx_tween.tween_property(_well, "offset_transform_scale", Vector2.ONE * PULSE_SCALE, PULSE_TIME * 0.5) \
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
		_fx_tween.chain().tween_property(_well, "offset_transform_scale", Vector2.ONE, PULSE_TIME * 0.5) \
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)


## A-15: the icon shatters at 0; reduce motion shows the empty, broken icon
## with a short fade.
func _shatter(reduce_motion: bool) -> void:
	if _fx_tween and _fx_tween.is_valid():
		_fx_tween.kill()
	_broken.visible = true
	_broken.modulate.a = 0.0
	_fx_tween = create_tween()
	_fx_tween.tween_property(_broken, "modulate:a", 1.0, SHORT_FADE)
	if not reduce_motion:
		for i in 6:
			_fx_tween.tween_property(_well, "offset_transform_position", Vector2(2.0 if i % 2 == 0 else -2.0, 0.0), 0.05)
		_fx_tween.tween_property(_well, "offset_transform_position", Vector2.ZERO, 0.05)


func _place_trail(a: int, b: int) -> void:
	var top_value := maxi(a, b)
	var h := maxf(absf(a - b) * PX_PER_POINT, Tokens.ESP_2)
	var y := clampf(Tokens.METER_ICON - top_value * PX_PER_POINT, 0.0, Tokens.METER_ICON - h)
	_trail.position = Vector2(0, y)
	_trail.size = Vector2(Tokens.METER_ICON, h)


func _apply_glyph() -> void:
	var path := "res://assets/icons/meter_%s.svg" % meter_id
	if ResourceLoader.exists(path):
		_glyph.texture = load(path)


func _apply_contrast() -> void:
	_well.texture_under = rounded_texture(Tokens.HC_BG if high_contrast else Tokens.CARD)
	_edge.visible = high_contrast


func _update_accessibility() -> void:
	# D-156: "Dignidade, faixa 2 de 5" — never the number during the game.
	var meter_name := String(Tokens.METER_NAMES.get(meter_id, meter_id))
	accessibility_name = "%s, faixa %d de 5" % [meter_name, Tokens.band_of(value)]


func _kill() -> void:
	for t: Tween in [_tween, _trail_tween, _fx_tween]:
		if t and t.is_valid():
			t.kill()


## 32×32 square with radius-8 corners, anti-aliased, cached per color.
static func rounded_texture(color: Color) -> Texture2D:
	var key := "well_" + color.to_html()
	if _textures.has(key):
		return _textures[key]
	var n := Tokens.METER_ICON
	var r := float(Tokens.RADIUS_8)
	var img := Image.create(n, n, false, Image.FORMAT_RGBA8)
	for y in n:
		for x in n:
			var qx := maxf(absf(x + 0.5 - n * 0.5) - (n * 0.5 - r), 0.0)
			var qy := maxf(absf(y + 0.5 - n * 0.5) - (n * 0.5 - r), 0.0)
			var d := sqrt(qx * qx + qy * qy) - r
			img.set_pixel(x, y, Color(color, color.a * clampf(0.5 - d, 0.0, 1.0)))
	var tex := ImageTexture.create_from_image(img)
	_textures[key] = tex
	return tex


## Trail stripes (D-161): white / #263238 at 135°, tileable 6×6.
static func stripe_texture() -> Texture2D:
	if _textures.has("trail"):
		return _textures["trail"]
	var img := Image.create(6, 6, false, Image.FORMAT_RGBA8)
	for y in 6:
		for x in 6:
			img.set_pixel(x, y, Tokens.TEXT if (x + y) % 6 < 3 else Tokens.BG)
	var tex := ImageTexture.create_from_image(img)
	_textures["trail"] = tex
	return tex
