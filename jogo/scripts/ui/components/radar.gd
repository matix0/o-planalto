class_name Radar
extends VBoxContainer
## C-13 — ideological radar of the final screen (docs/14 §14.09; 14A C-13;
## gdd/sistemas/04_eixo.md §3-4; boards Final, C08-C14, T10a).
## 4 axes × 2 poles = 8 spokes; opposite poles sit opposite (§3.1). Each spoke shows only
## the pole its axis leaned to (radius = |position| / 10 × r); the other pole stays at the
## center. "o que você disse" (calibration): dashed 6/4, 2 px, Caption color (#B0BEC5; white
## in high contrast). "como você governou" (chosen options): solid white 2.5 px + 10% white
## fill. Grid (rings r and r/2, 4 axes): #455A64, 1 px, decorative. Different patterns, not
## color alone. The 8 pole names (Caption) sit around the chart; the radius starts at 80 and
## shrinks until they fit the width (Final.dc.html; 66 at 24 px), never under 40. When they
## do not fit even at 40 (36 px text, D14) the spokes get numbers and the names go to a
## numbered list under the chart — PROPOSTA, a validar (D14).
## Children: Chart (drawn through its `draw` signal, pole labels placed by code), Key
## (fallback list), Legend (two samples + labels). No own animation (enters with A-26).

const RADIUS_MAX := 80
const RADIUS_MIN := 40
const LABEL_GAP := Tokens.ESP_8      # name ↔ ring on the vertical and horizontal spokes
const DIAG_GAP := 6.0                # name ↔ tip of a diagonal spoke (Final.dc.html)
const DIAG := 0.7071                 # cos 45°
const SAID_WIDTH := 2.0
const GOVERNED_WIDTH := 2.5
const GRID_WIDTH := 1.0
const DASH := 6.0
const DASH_GAP := 4.0
const FILL_ALPHA := 0.10
const RING_POINTS := 96
const SCALE := 10.0                  # positions go from −10 to +10 (gdd 04 §4)
const A11Y_NAME := "Radar ideológico"   # T-10.1 board
## PROPOSTA (C-13: "descrição textual dos 4 eixos para o leitor: [a definir]").
const A11Y_AXIS := "%s: disse %s; governou %s."
const A11Y_POLE := "%s, %s de 10"
const A11Y_NONE := "sem posição"
## PROPOSTA (D14): numbered spokes + list when the names do not fit around the chart.
const KEY_FORMAT := "%d. %s"
## Spoke k: [angle in degrees (y down), axis index (Eco, Dip, Soc, Est), pole sign].
const SPOKES := [
	[-90.0, 2, -1],    # Conservadorismo
	[-45.0, 3, 1],     # Liberdade
	[0.0, 0, 1],       # Mercado
	[45.0, 1, 1],      # Globalismo
	[90.0, 2, 1],      # Progressismo
	[135.0, 3, -1],    # Autoritarismo
	[180.0, 0, -1],    # Coletivismo
	[-135.0, 1, -1],   # Nacionalismo
]

## Positions [Eco, Dip, Soc, Est], −10..+10.
var said: Array = [0.0, 0.0, 0.0, 0.0]
var governed: Array = [0.0, 0.0, 0.0, 0.0]
## [[pole −, pole +] × 4] and the axis names (AxisRules by default; set_data() replaces).
var poles: Array = AxisRules.POLES.duplicate(true)
var names: Array = Array(AxisRules.NAMES)

var _radius: float = RADIUS_MAX
var _center := Vector2.ZERO
var _keyed := false
var _layout_queued := false
var _pole_labels: Array[Label] = []
var _key_labels: Array[Label] = []

@onready var _chart: Control = %Chart
@onready var _key: VBoxContainer = %Key
@onready var _said_sample: Control = %SaidSample
@onready var _governed_sample: Control = %GovernedSample
@onready var _said_label: Label = %SaidLabel
@onready var _governed_label: Label = %GovernedLabel


func _ready() -> void:
	for k in SPOKES.size():
		var pole := Label.new()
		pole.theme_type_variation = &"Caption"
		pole.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_chart.add_child(pole)
		_pole_labels.append(pole)
		var entry := Label.new()
		entry.theme_type_variation = &"Caption"
		entry.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		_key.add_child(entry)
		_key_labels.append(entry)
	# Legend text in white like the board (Caption size); the sample carries the pattern.
	_said_label.add_theme_color_override(&"font_color", Tokens.TEXT)
	_governed_label.add_theme_color_override(&"font_color", Tokens.TEXT)
	_chart.accessibility_name = A11Y_NAME
	_chart.draw.connect(_draw_chart)
	_said_sample.draw.connect(_draw_said_sample)
	_governed_sample.draw.connect(_draw_governed_sample)
	_chart.resized.connect(_queue_layout)
	_apply_texts()
	_queue_layout()


func _notification(what: int) -> void:
	if what == NOTIFICATION_THEME_CHANGED and is_node_ready():
		_queue_layout()
		_said_sample.queue_redraw()
		_governed_sample.queue_redraw()


## Takes Game.final_view().axis: {said, governed, names, poles, ...}.
func set_data(axis: Dictionary) -> void:
	said = _four(axis.get("said"))
	governed = _four(axis.get("governed"))
	var p: Variant = axis.get("poles")
	if p is Array and (p as Array).size() == 4:
		poles = (p as Array).duplicate(true)
	var n: Variant = axis.get("names")
	if n is Array and (n as Array).size() == 4:
		names = (n as Array).duplicate()
	if is_node_ready():
		_apply_texts()
		_queue_layout()


func set_traces(new_said: Array, new_governed: Array) -> void:
	set_data({"said": new_said, "governed": new_governed})


func radius() -> float:
	return _radius


func center() -> Vector2:
	return _center


## True when the names did not fit around the chart (numbered spokes + list).
func is_keyed() -> bool:
	return _keyed


func chart() -> Control:
	return _chart


func pole_labels() -> Array[Label]:
	return _pole_labels


func key_labels() -> Array[Label]:
	return _key_labels


## Pole shown at spoke k ("Conservadorismo" …).
func pole_name(k: int) -> String:
	var spoke: Array = SPOKES[k]
	var pair: Array = poles[int(spoke[1])]
	return String(pair[0] if int(spoke[2]) < 0 else pair[1])


## Text for the screen reader (accessibility_description of the chart).
func describe() -> String:
	var parts: PackedStringArray = []
	for i in names.size():
		parts.append(A11Y_AXIS % [names[i], _pole_text(i, float(said[i])), _pole_text(i, float(governed[i]))])
	return " ".join(parts)


## Chart coordinates of a track (8 points, spoke order; the center for the other pole).
func points_for(values: Array) -> PackedVector2Array:
	var out := PackedVector2Array()
	for spoke: Array in SPOKES:
		var pos := float(values[int(spoke[1])])
		var rr := 0.0
		if pos * float(spoke[2]) > 0.0:
			rr = minf(absf(pos), SCALE) / SCALE * _radius
		out.append(_center + _dir(float(spoke[0])) * rr)
	return out


# --- Layout ---------------------------------------------------------------------------------

func _queue_layout() -> void:
	if _layout_queued:
		return
	_layout_queued = true
	_layout.call_deferred()


func _layout() -> void:
	_layout_queued = false
	if not is_inside_tree():
		return
	var width := _chart.size.x
	if width <= 0.0:
		return
	_set_pole_texts(false)
	var w := _widths()
	var r := _fit(w, width)
	_keyed = r < 0
	if _keyed:
		_set_pole_texts(true)
		w = _widths()
		r = maxi(_fit(w, width), RADIUS_MIN)
	_key.visible = _keyed
	_radius = r
	var h := 0.0
	for label in _pole_labels:
		h = maxf(h, label.size.y)
	var dg := r * DIAG
	var left := _left_need(w, r)
	var right := _right_need(w, r)
	var cx := roundf(left + (width - left - right) * 0.5)
	# From 24 px the line boxes of the top / bottom names reach those of the diagonal names
	# (the radius shrank, the lines grew): move them out until they clear (+1 px).
	var overlap := h + dg + DIAG_GAP - r - LABEL_GAP + 1.0
	var top_shift := maxf(0.0, overlap) if float(w[0]) * 0.5 > dg + DIAG_GAP else 0.0
	var bottom_shift := maxf(0.0, overlap) if float(w[4]) * 0.5 > dg + DIAG_GAP else 0.0
	var cy := roundf(h + LABEL_GAP + r + top_shift)
	_center = Vector2(cx, cy)
	var at := [
		Vector2(cx - w[0] * 0.5, cy - r - LABEL_GAP - h - top_shift),
		Vector2(cx + dg + DIAG_GAP, cy - dg - DIAG_GAP - h),
		Vector2(cx + r + LABEL_GAP, cy - h * 0.5),
		Vector2(cx + dg + DIAG_GAP, cy + dg + DIAG_GAP),
		Vector2(cx - w[4] * 0.5, cy + r + LABEL_GAP + bottom_shift),
		Vector2(cx - dg - DIAG_GAP - w[5], cy + dg + DIAG_GAP),
		Vector2(cx - r - LABEL_GAP - w[6], cy - h * 0.5),
		Vector2(cx - dg - DIAG_GAP - w[7], cy - dg - DIAG_GAP - h),
	]
	for k in _pole_labels.size():
		var p: Vector2 = at[k]
		p.x = clampf(p.x, 0.0, maxf(0.0, width - w[k]))
		_pole_labels[k].position = p.round()
	var total := ceilf(2.0 * h + 2.0 * LABEL_GAP + 2.0 * r + top_shift + bottom_shift)
	if not is_equal_approx(_chart.custom_minimum_size.y, total):
		_chart.custom_minimum_size = Vector2(0.0, total)
	_chart.queue_redraw()


## Largest integer radius (80 → 40) for which the names fit the width, or −1.
func _fit(w: Array, width: float) -> int:
	for r in range(RADIUS_MAX, RADIUS_MIN - 1, -1):
		var left := _left_need(w, r)
		var right := _right_need(w, r)
		if left + right > width:
			continue
		var cx := left + (width - left - right) * 0.5
		var half := maxf(float(w[0]), float(w[4])) * 0.5
		if cx - half >= 0.0 and cx + half <= width:
			return r
	return -1


func _left_need(w: Array, r: float) -> float:
	return maxf(float(w[6]) + LABEL_GAP + r, maxf(float(w[7]), float(w[5])) + DIAG_GAP + r * DIAG)


func _right_need(w: Array, r: float) -> float:
	return maxf(float(w[2]) + LABEL_GAP + r, maxf(float(w[1]), float(w[3])) + DIAG_GAP + r * DIAG)


func _widths() -> Array:
	var w := []
	for label in _pole_labels:
		label.reset_size()
		w.append(label.size.x)
	return w


func _set_pole_texts(numbered: bool) -> void:
	for k in _pole_labels.size():
		_pole_labels[k].text = str(k + 1) if numbered else pole_name(k)


func _apply_texts() -> void:
	for k in _key_labels.size():
		_key_labels[k].text = KEY_FORMAT % [k + 1, pole_name(k)]
	_set_pole_texts(_keyed)
	_chart.accessibility_description = describe()


# --- Drawing --------------------------------------------------------------------------------

func _draw_chart() -> void:
	var c := _center
	var r := _radius
	_chart.draw_arc(c, r, 0.0, TAU, RING_POINTS, Tokens.PRESSED, GRID_WIDTH, true)
	_chart.draw_arc(c, roundf(r * 0.5), 0.0, TAU, RING_POINTS, Tokens.PRESSED, GRID_WIDTH, true)
	for k in 4:   # spokes k and k + 4 are opposite: one line per axis
		var d := _dir(float(SPOKES[k][0])) * r
		_chart.draw_line(c - d, c + d, Tokens.PRESSED, GRID_WIDTH, true)
	var dash_color := said_color()
	for seg: Array in segments(points_for(said)):
		_dashed(_chart, seg[0], seg[1], dash_color, SAID_WIDTH)
	var gov := points_for(governed)
	_fill(gov)
	for seg: Array in segments(gov):
		_chart.draw_line(seg[0], seg[1], Tokens.TEXT, GOVERNED_WIDTH, true)
		for p: Vector2 in seg:   # round caps and joins (stroke-linejoin: round on the board)
			_chart.draw_circle(p, GOVERNED_WIDTH * 0.5, Tokens.TEXT, true, -1.0, true)


func _draw_said_sample() -> void:
	var y := _said_sample.size.y * 0.5
	_dashed(_said_sample, Vector2(1.0, y), Vector2(_said_sample.size.x - 1.0, y), said_color(), SAID_WIDTH)


func _draw_governed_sample() -> void:
	var y := _governed_sample.size.y * 0.5
	_governed_sample.draw_line(Vector2(1.0, y), Vector2(_governed_sample.size.x - 1.0, y), Tokens.TEXT, GOVERNED_WIDTH, true)


## Triangle fan from the center: the shape is star-shaped around it, so this is exact
## (and needs no triangulation of a polygon that passes through the center).
func _fill(points: PackedVector2Array) -> void:
	var verts := PackedVector2Array([_center]) + points
	var indices := PackedInt32Array()
	var n := points.size()
	for k in n:
		var k1 := (k + 1) % n
		if points[k].distance_to(_center) > 0.01 and points[k1].distance_to(_center) > 0.01:
			indices.append_array(PackedInt32Array([0, k + 1, k1 + 1]))
	if indices.is_empty():
		return
	var colors := PackedColorArray()
	colors.resize(verts.size())
	colors.fill(Color(Tokens.TEXT, FILL_ALPHA))
	RenderingServer.canvas_item_add_triangle_array(_chart.get_canvas_item(), indices, verts, colors)


## Edges of the closed track, each drawn once: a spoke whose neighbours sit at the center is
## an "out and back" edge pair (the SVG polygon of the board). Drawn twice, the two dash
## phases fill each other's gaps and the dashed track looks solid, so duplicates go; a spoke
## edge runs from the center outward so its dashes start at the center.
func segments(points: PackedVector2Array) -> Array:
	var out := []
	var n := points.size()
	for k in n:
		var a := points[k]
		var b := points[(k + 1) % n]
		if a.distance_to(b) <= 0.01:
			continue
		if b.distance_to(_center) <= 0.01:
			var swap := a
			a = b
			b = swap
		var seen := false
		for s: Array in out:
			var s0: Vector2 = s[0]
			var s1: Vector2 = s[1]
			if (s0.distance_to(a) <= 0.01 and s1.distance_to(b) <= 0.01) or (s0.distance_to(b) <= 0.01 and s1.distance_to(a) <= 0.01):
				seen = true
				break
		if not seen:
			out.append([a, b])
	return out


## Dashed line, 6 on / 4 off, starting with a dash at `a`.
static func _dashed(item: CanvasItem, a: Vector2, b: Vector2, color: Color, width: float) -> void:
	var length := a.distance_to(b)
	var t := 0.0
	while t < length - 0.001:
		var end := minf(t + DASH, length)
		item.draw_line(a.lerp(b, t / length), a.lerp(b, end / length), color, width, true)
		t = end + DASH_GAP


func said_color() -> Color:
	if has_theme_color(&"font_color", &"Caption"):
		return get_theme_color(&"font_color", &"Caption")
	return Tokens.TEXT2


static func _dir(degrees: float) -> Vector2:
	var a := deg_to_rad(degrees)
	return Vector2(cos(a), sin(a))


static func _four(v: Variant) -> Array:
	var out := [0.0, 0.0, 0.0, 0.0]
	if v is Array:
		for i in mini((v as Array).size(), 4):
			out[i] = clampf(float(v[i]), -SCALE, SCALE)
	return out


func _pole_text(i: int, pos: float) -> String:
	if is_zero_approx(pos):
		return A11Y_NONE
	var pair: Array = poles[i]
	var amount := ("%.1f" % absf(pos)).replace(".", ",").trim_suffix(",0")
	return A11Y_POLE % [String(pair[0] if pos < 0.0 else pair[1]), amount]
