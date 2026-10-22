class_name Hud
extends HBoxContainer
## C-02 — HUD with the 8 meters (docs/14 §14.03; gdd/GDD.md §6.1.1):
## Sociais (Dignidade, Consciência, Soberania, Segurança, Integridade) |
## Poder (Caixa, Capital Político, Legitimidade). 336×52, no numbers.
## apply_changes() plays the Animações timeline (A-07 fill, A-08 trail,
## A-09 band change, A-10 dots) and emits changes_finished.

signal changes_finished

const ORDER: Array[String] = [
	"dignity", "awareness", "sovereignty", "security", "integrity",
	"treasury", "political_capital", "legitimacy",
]
## Divergence D16: docs/14 §14.10.1 starts the dots 100 ms after release
## (repo timing, used); the prompt starts them at the end of the card exit
## and keeps them until the fill ends. Flip to test the prompt's version.
const DOTS_FOLLOW_PROMPT := false
const DOT_DELAY_REPO := 0.1          # A-10: 100 ms after release
const DOT_LIFETIME_REPO := 0.5       # A-10: 400-600 ms
const CARD_EXIT_TIME := 0.3          # A-06: 250-350 ms
const SMALL_DOT_MAX := 10            # docs/14 §14.05: up to 10 = small
const LEGEND_SECONDS := 4.0          # legend strip under the HUD (P-017)

var high_contrast: bool = false:
	set(v):
		high_contrast = v
		if is_node_ready():
			for m in meters():
				m.high_contrast = v
			_divider_line.color = Tokens.TEXT if v else Tokens.INACTIVE

var _pending := 0
var _legend: PanelContainer
var _legend_text: Label
var _legend_id := ""
var _legend_by_hover := false
var _legend_timer: SceneTreeTimer

@onready var _divider_line: ColorRect = $MeterDivider/Line


const METER_CELL := 40.0   # 8 × 40 + 16 divider = 336: the cells touch, no dead gap to tap (P-018)


func _ready() -> void:
	_divider_line.color = Tokens.INACTIVE
	add_theme_constant_override(&"separation", 0)
	for m in meters():
		m.custom_minimum_size.x = METER_CELL
	for m in meters():
		m.animation_finished.connect(_on_meter_done)
		m.tapped.connect(show_legend)
		m.hovered.connect(func(id: String) -> void:
			if _legend_id != id:
				show_legend(id, true))
	_build_legend()


## Strip under the HUD with the name and role of a meter (tap on mobile, click on PC; hover
## also shows the tooltip). A 2nd tap on the same meter closes it (P-017).
func show_legend(id: String, from_hover: bool = false) -> void:
	# A click on a legend the mouse just opened keeps it (hover, then click, must not close it).
	if _legend.visible and _legend_id == id and not from_hover and not _legend_by_hover:
		hide_legend()
		return
	_legend_by_hover = from_hover
	_legend_id = id
	_legend_text.text = "%s — %s" % [Tokens.METER_NAMES.get(id, id), Tokens.METER_INFO.get(id, "")]
	_legend.add_theme_stylebox_override(&"panel", _legend_box(Tokens.METER_COLORS.get(id, Tokens.TEXT)))
	# Fixed width first, so the wrapped text gets its real height (with width 0 the label wrapped
	# one word per line and the strip grew 1200 px tall, an invisible wall over the screen).
	var pad := Tokens.ESP_12 * 2 + Tokens.ESP_4
	_legend_text.custom_minimum_size.x = maxf(0.0, size.x - pad)
	_fit_legend()
	_fit_legend.call_deferred()   # again once the label has wrapped at its real width
	_legend.global_position = global_position + Vector2(0, size.y + Tokens.ESP_4)
	_legend.visible = true
	_legend_text.accessibility_live = AccessibilityServer.LIVE_POLITE
	var timer := get_tree().create_timer(LEGEND_SECONDS)
	_legend_timer = timer
	timer.timeout.connect(func() -> void:
		if _legend_timer == timer:
			hide_legend())


func _fit_legend() -> void:
	_legend.size = Vector2(size.x, 0)
	_legend.reset_size()
	_legend.size = Vector2(size.x, _legend_text.get_combined_minimum_size().y + Tokens.ESP_8 * 2)


func hide_legend() -> void:
	_legend.visible = false
	_legend_id = ""


func legend_text() -> String:
	return _legend_text.text if _legend.visible else ""


func _build_legend() -> void:
	_legend = PanelContainer.new()
	_legend.name = "Legend"
	_legend.visible = false
	_legend.mouse_filter = Control.MOUSE_FILTER_STOP
	_legend.gui_input.connect(func(e: InputEvent) -> void:
		if e is InputEventMouseButton and e.pressed:   # touch arrives as an emulated click
			hide_legend())
	_legend_text = Label.new()
	_legend_text.theme_type_variation = &"Caption"
	_legend_text.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_legend_text.add_theme_color_override(&"font_color", Tokens.TEXT)
	_legend.add_child(_legend_text)
	# Under a plain Control, not straight under this HBoxContainer: the container kept resizing the
	# strip (it grew to the screen height and blocked every tap below the HUD).
	var host := Control.new()
	host.name = "LegendHost"
	host.top_level = true
	host.mouse_filter = Control.MOUSE_FILTER_IGNORE
	host.z_index = 10
	add_child(host)
	host.add_child(_legend)


func _legend_box(accent: Color) -> StyleBoxFlat:
	var box := StyleBoxFlat.new()
	box.bg_color = Tokens.HC_BG if high_contrast else Tokens.CARD
	box.border_color = accent
	box.border_width_left = Tokens.ESP_4
	box.set_corner_radius_all(Tokens.RADIUS_8)
	box.content_margin_left = Tokens.ESP_12
	box.content_margin_right = Tokens.ESP_12
	box.content_margin_top = Tokens.ESP_8
	box.content_margin_bottom = Tokens.ESP_8
	return box


func meters() -> Array[MeterIcon]:
	var out: Array[MeterIcon] = []
	for child in get_children():
		if child is MeterIcon:
			out.append(child)
	return out


func meter(id: String) -> MeterIcon:
	for m in meters():
		if m.meter_id == id:
			return m
	return null


## values: {meter_id: int}. No animation.
func set_values(values: Dictionary) -> void:
	for id in values:
		var m := meter(String(id))
		if m:
			m.set_value(int(values[id]))


## Frozen frame: previous levels (trail), dots and one pulsing meter.
func show_state(values: Dictionary, previous: Dictionary = {}, dots: Dictionary = {}, pulse_id: String = "") -> void:
	for m in meters():
		var v := int(values.get(m.meter_id, m.value))
		m.show_state(v, int(previous.get(m.meter_id, -1)), StringName(dots.get(m.meter_id, "")), m.meter_id == pulse_id)


## changes: [{id, old, new, (delta), (dot: &"small"|&"big")}] for the meters
## that changed. Starts right after the card is released.
func apply_changes(changes: Array, reduce_motion: bool = false) -> void:
	var dot_delay := CARD_EXIT_TIME if DOTS_FOLLOW_PROMPT else DOT_DELAY_REPO
	var lifetime := MeterIcon.FILL_TIME if DOTS_FOLLOW_PROMPT else DOT_LIFETIME_REPO
	var fill_delay := dot_delay
	_pending = 0
	for c: Dictionary in changes:
		var m := meter(String(c.get("id", "")))
		if m == null:
			continue
		var old_v := int(c.get("old", m.value))
		var new_v := int(c.get("new", old_v + int(c.get("delta", 0))))
		var dot := StringName(c.get("dot", ""))
		if dot == &"" and new_v != old_v:
			dot = &"small" if absi(new_v - old_v) <= SMALL_DOT_MAX else &"big"
		_pending += 1
		m.animate_change(old_v, new_v, dot, reduce_motion, dot_delay, lifetime, fill_delay)
	if _pending == 0:
		changes_finished.emit.call_deferred()


func values() -> Dictionary:
	var out := {}
	for m in meters():
		out[m.meter_id] = m.value
	return out


func _on_meter_done(_id: String) -> void:
	_pending -= 1
	if _pending == 0:
		changes_finished.emit()
