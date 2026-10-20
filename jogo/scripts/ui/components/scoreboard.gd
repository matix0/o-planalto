class_name Scoreboard
extends VBoxContainer
## C-11 — vote scoreboard of the impeachment scene (docs/14 §14.08; gdd/sistemas/03_impeachment.md
## §3.3; wireframes C-11, T-09, Tela). Name + big number "votos / total", a 16 px white bar over a
## dark hatched track, a fixed white quorum line and the caption "quórum N". It is read by the
## position and the number, never by color: no green, no red (D-156).
##
## Modes: HIDDEN (phases 1 and 5, `{}`) · TARGET (only "— / total" and the quorum: the Senate
## before the result, D-168; committee and chamber before the choice only with PROPOSTA P8) · BAR.
## Numbers come from Game (`scoreboard` in impeachment_view, api.md §5): a null the repo does not
## define shows "[a definir]". Texts are drawn (baseline-aligned, like the wireframe); the board
## is not focusable and the screen reader gets the numbers from accessibility_name.

signal entered   # A-16 finished (fade, then the bar from its old value to the new one)

enum Mode { HIDDEN, TARGET, BAR }

const P8_TARGET_ONLY := false     # PROPOSTA P8 — committee and chamber only with the target before the choice
const KIND_NAMES := {"committee": "Comissão especial", "chamber": "Câmara", "senate": "Senado"}
const UNKNOWN := "[a definir]"
const UNKNOWN_COUNT := "[—]"                            # committee count [a definir] (C-11)
const UNKNOWN_TOTAL := "[nº de membros — a definir]"    # committee size (C-11)
const NO_COUNT := "—"                                   # before the vote (D-168)
const BELOW_COUNT := "[< %d]"                           # a vote the government wins (T-09.7)
const EXACT_TBD := " · valor exato [a definir]"         # T-09.7
const BELOW_RATIO := 0.675        # count unknown, below the quorum: fill = quorum × ratio (T-09.7 draws 45% of 81) — a definir
const COMMITTEE_QUORUM_AT := 0.5  # committee quorum line position [a definir] (C-11)
const UNKNOWN_LINE_ALPHA := 0.6   # line drawn dimmed while its position is [a definir] (C-11)
const BAR_HEIGHT := float(Tokens.ESP_16)
const BAR_GAP := float(Tokens.ESP_4)        # C-11: bar margin-top 4 (+ separation 4)
const BAR_RADIUS := Tokens.ESP_4
const LINE_SIZE := Vector2(3, 28)           # quorum line, 6 px over and under the bar
const LINE_HALO := 1                        # 1 px halo in the scene background color
const HATCH_PERIOD := 6.0                   # #78909C 2 / 4 at 135° (C-11)
const HATCH_STRIPE := 2.0
const FADE_TIME := 0.3                      # A-16 (a validar)
const BAR_TIME := 0.6                       # A-16: bar to its value (a validar)
const SHORT_FADE := 0.15                    # Reduzir movimento: fades only

var reduce_motion: bool = false
var high_contrast: bool = false:
	set(v):
		high_contrast = v
		if is_node_ready():
			_apply_colors()

var _board: Dictionary = {}
var _mode: Mode = Mode.HIDDEN
var _count := ""
var _total := ""
var _quorum_text := ""
var _fill_target := 0.0
var _fill := 0.0
var _tween: Tween
var _chamber_par := TextParagraph.new()
var _total_par := TextParagraph.new()
var _total_below := false   # the total drawn under the number (no room on one line)
var _quorum_par := TextParagraph.new()
var _outline_box := StyleBoxFlat.new()
var _fill_box := StyleBoxFlat.new()
var _line_box := StyleBoxFlat.new()

@onready var _head: Control = $Head
@onready var _bar: Control = $Bar
@onready var _track: ColorRect = $Bar/Track
@onready var _outline: Panel = $Bar/Outline
@onready var _fill_panel: Panel = $Bar/Fill
@onready var _line: Panel = $Bar/QuorumLine
@onready var _quorum_row: Control = $QuorumRow


func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	focus_mode = Control.FOCUS_NONE
	accessibility_live = AccessibilityServer.LIVE_POLITE   # read when it enters (T-09.3, a validar)
	add_theme_constant_override(&"separation", Tokens.ESP_4)
	_head.draw.connect(_draw_head)
	_quorum_row.draw.connect(_draw_quorum)
	_head.resized.connect(_relayout)
	_bar.resized.connect(_layout_bar)
	_track.offset_transform_enabled = true   # the shader draws 45°; mirrored = 135° (C-11)
	_track.offset_transform_pivot_ratio = Vector2(0.5, 0.5)
	_track.offset_transform_scale = Vector2(-1, 1)
	_bar.custom_minimum_size.y = BAR_GAP + BAR_HEIGHT
	_outline_box.draw_center = false
	_outline_box.set_corner_radius_all(BAR_RADIUS)
	_outline_box.anti_aliasing = true
	_outline.add_theme_stylebox_override(&"panel", _outline_box)
	_fill_box.corner_radius_top_left = BAR_RADIUS
	_fill_box.corner_radius_bottom_left = BAR_RADIUS
	_fill_box.anti_aliasing = true
	_fill_panel.add_theme_stylebox_override(&"panel", _fill_box)
	_line_box.set_border_width_all(LINE_HALO)
	_line_box.set_expand_margin_all(LINE_HALO)
	_line.add_theme_stylebox_override(&"panel", _line_box)
	_apply_colors()
	show_board({})


## board: {kind, total, quorum, votes, reached} or {} (no scoreboard). `animate` plays A-16:
## a board that was hidden fades in and its bar grows from 0; a visible one only moves the bar.
func show_board(board: Dictionary, animate: bool = false) -> void:
	_kill_tween()
	var was_visible := visible and _mode != Mode.HIDDEN
	var same_kind := was_visible and String(_board.get("kind", "")) == String(board.get("kind", ""))
	var old_fill := _fill if same_kind else 0.0
	_board = board.duplicate()
	if board.is_empty():
		_mode = Mode.HIDDEN
		visible = false
		accessibility_name = ""
		_fill_target = 0.0
		_set_fill(0.0)
		if animate:
			entered.emit.call_deferred()
		return
	var reached: Variant = board.get("reached")
	var kind := String(board.get("kind", ""))
	_mode = Mode.TARGET if reached == null and (kind == "senate" or P8_TARGET_ONLY) else Mode.BAR
	_count = _make_count()
	_total = _make_total()
	_quorum_text = _make_quorum_text()
	accessibility_name = _make_a11y()
	_fill_target = _make_fill()
	_bar.visible = _mode == Mode.BAR
	visible = true
	_line.modulate.a = 1.0 if _known(board.get("quorum")) and _known(board.get("total")) else UNKNOWN_LINE_ALPHA
	_relayout()
	_layout_bar()
	if not animate:
		modulate.a = 1.0
		_set_fill(_fill_target)
		return
	_tween = create_tween()
	if reduce_motion:
		_set_fill(_fill_target)
		if not same_kind:
			modulate.a = 0.0
			_tween.tween_property(self, "modulate:a", 1.0, SHORT_FADE)
		else:
			_tween.tween_interval(SHORT_FADE)
	else:
		_set_fill(old_fill)
		if not same_kind:
			modulate.a = 0.0
			_tween.tween_property(self, "modulate:a", 1.0, FADE_TIME) \
				.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
		if _mode == Mode.BAR and not is_equal_approx(old_fill, _fill_target):
			_tween.tween_method(_set_fill, old_fill, _fill_target, BAR_TIME) \
				.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
		else:
			_tween.tween_interval(0.01)
	_tween.finished.connect(func() -> void: entered.emit())


## Jumps a running A-16 to its end (resume, reduce motion turned on, tests).
func finish_animation() -> void:
	if _tween and _tween.is_valid():
		_tween.kill()
		modulate.a = 1.0
		_set_fill(_fill_target)
		entered.emit()


func is_animating() -> bool:
	return _tween != null and _tween.is_valid() and _tween.is_running()


func mode() -> Mode:
	return _mode


func board() -> Dictionary:
	return _board.duplicate()


func chamber_text() -> String:
	return KIND_NAMES.get(String(_board.get("kind", "")), UNKNOWN) if _mode != Mode.HIDDEN else ""


func count_text() -> String:
	return _count if _mode != Mode.HIDDEN else ""


func total_text() -> String:
	return _total if _mode != Mode.HIDDEN else ""


func quorum_text() -> String:
	return _quorum_text if _mode != Mode.HIDDEN else ""


## Fraction of the bar filled at the end of the animation (0 without a bar).
func fill_ratio() -> float:
	return _fill_target


## Fraction of the bar shown right now.
func shown_fill() -> float:
	return _fill


func quorum_ratio() -> float:
	return _quorum_at()


## Every color drawn by the board (tests: never green nor red, D-156).
func colors_used() -> Array[Color]:
	var f := _style()
	return [f["num_color"], f["cap_color"], _fill_box.bg_color, _outline_box.border_color,
		_line_box.bg_color, _line_box.border_color, _hatch_color()]


# --- Texts ----------------------------------------------------------------------------------

func _make_count() -> String:
	var votes: Variant = _board.get("votes")
	if _mode == Mode.BAR and _known(votes):
		return str(int(votes))
	if String(_board.get("kind", "")) == "committee":
		return UNKNOWN_COUNT
	if _mode == Mode.BAR and _board.get("reached") == false and _known(_board.get("quorum")):
		return BELOW_COUNT % int(_board["quorum"])
	return NO_COUNT


func _make_total() -> String:
	var total: Variant = _board.get("total")
	return " / %d" % int(total) if _known(total) else " / " + UNKNOWN_TOTAL


func _make_quorum_text() -> String:
	var q: Variant = _board.get("quorum")
	var s := "quórum %d" % int(q) if _known(q) else "quórum " + UNKNOWN
	if _mode == Mode.BAR and _known(q) and not _known(_board.get("votes")) and _board.get("reached") == false:
		s += EXACT_TBD
	return s


## Screen reader (T-09.4, T-09.5, T-09.7, T-09.8 — texts a validar). Votes, never meters.
func _make_a11y() -> String:
	var name: String = KIND_NAMES.get(String(_board.get("kind", "")), UNKNOWN)
	var total: Variant = _board.get("total")
	var q: Variant = _board.get("quorum")
	var votes: Variant = _board.get("votes")
	var total_s := str(int(total)) if _known(total) else UNKNOWN_TOTAL
	var quorum_s := str(int(q)) if _known(q) else UNKNOWN
	if _known(votes):
		return "%s: %d de %s votos; quórum %s" % [name, int(votes), total_s, quorum_s]
	if _board.get("reached") == null:
		return "%s: meta de %s votos de %s" % [name, quorum_s, total_s]
	return "%s: [votos a definir] de %s; quórum %s" % [name, total_s, quorum_s]


func _make_fill() -> float:
	if _mode != Mode.BAR:
		return 0.0
	var votes: Variant = _board.get("votes")
	var total: Variant = _board.get("total")
	if _known(votes) and _known(total) and int(total) > 0:
		return clampf(float(votes) / float(total), 0.0, 1.0)
	match _board.get("reached"):
		true:
			return _quorum_at()
		false:
			return _quorum_at() * BELOW_RATIO
	return 0.0


func _quorum_at() -> float:
	var q: Variant = _board.get("quorum")
	var total: Variant = _board.get("total")
	if _known(q) and _known(total) and int(total) > 0:
		return clampf(float(q) / float(total), 0.0, 1.0)
	return COMMITTEE_QUORUM_AT


static func _known(v: Variant) -> bool:
	return v != null and (v is int or v is float)


# --- Layout and drawing ----------------------------------------------------------------------

func _notification(what: int) -> void:
	if what == NOTIFICATION_THEME_CHANGED and is_node_ready():
		_relayout()


## Fonts, sizes and colors from the Theme (Number and Caption variations).
func _style() -> Dictionary:
	var cap_font := get_theme_font(&"font", &"Caption")
	var cap_size := get_theme_font_size(&"font_size", &"Caption")
	return {
		"num_font": get_theme_font(&"font", &"Number"),
		"num_size": get_theme_font_size(&"font_size", &"Number"),
		"num_color": get_theme_color(&"font_color", &"Number"),
		"cap_font": cap_font,
		"cap_size": cap_size,
		"cap_color": get_theme_color(&"font_color", &"Caption"),
		"cap_line": cap_font.get_height(cap_size) + get_theme_constant(&"line_spacing", &"Caption"),
		"cap_spacing": get_theme_constant(&"line_spacing", &"Caption"),
	}


## Number line box = its font size ("line-height: 1" on the wireframe); the name and the total
## share its baseline.
func _number_baseline(s: Dictionary) -> float:
	var f: Font = s["num_font"]
	var size: int = s["num_size"]
	return round((float(size) - f.get_height(size)) * 0.5 + f.get_ascent(size))


func _relayout() -> void:
	if not is_node_ready() or _mode == Mode.HIDDEN:
		return
	var s := _style()
	var num_font: Font = s["num_font"]
	var cap_font: Font = s["cap_font"]
	var count_w := num_font.get_string_size(_count, HORIZONTAL_ALIGNMENT_LEFT, -1, s["num_size"]).x
	var total_w := cap_font.get_string_size(_total, HORIZONTAL_ALIGNMENT_LEFT, -1, s["cap_size"]).x
	var head_w := maxf(_head.size.x, 1.0)
	var word_w := _longest_word(chamber_text(), cap_font, s["cap_size"])
	# Name, number and total on one line; when the name would have to break words (committee
	# placeholder, 36 px, translation), the total goes under the number.
	_total_below = head_w - count_w - total_w - Tokens.ESP_12 < word_w
	var right_w := count_w if _total_below else count_w + total_w
	_chamber_par.clear()
	_chamber_par.add_string(chamber_text(), cap_font, s["cap_size"])
	_chamber_par.line_spacing = s["cap_spacing"]
	_chamber_par.width = maxf(head_w - right_w - Tokens.ESP_12, word_w)
	var base := _number_baseline(s)
	var height := maxf(float(s["num_size"]), base - _chamber_par.get_line_ascent(0) + _chamber_par.get_size().y)
	_total_par.clear()
	_total_par.add_string(_total.strip_edges(), cap_font, s["cap_size"])
	_total_par.line_spacing = s["cap_spacing"]
	_total_par.width = head_w
	_total_par.alignment = HORIZONTAL_ALIGNMENT_RIGHT
	if _total_below:
		height = maxf(height, _total_top(s) + _total_par.get_size().y)
	_head.custom_minimum_size.y = ceilf(height)
	_quorum_par.clear()
	_quorum_par.add_string(_quorum_text, cap_font, s["cap_size"])
	_quorum_par.line_spacing = s["cap_spacing"]
	_quorum_par.width = maxf(size.x, 1.0)   # wraps only when translated or at 36 px
	var lines := _quorum_par.get_line_count()
	_quorum_row.custom_minimum_size.y = ceilf(float(s["cap_line"]) * lines)
	_head.queue_redraw()
	_quorum_row.queue_redraw()


## Top of the total when it sits under the number: its baseline one Caption line lower.
func _total_top(s: Dictionary) -> float:
	return _number_baseline(s) + float(s["cap_line"]) - _total_par.get_line_ascent(0)


static func _longest_word(text: String, font: Font, size: int) -> float:
	var w := 0.0
	for word in text.split(" ", false):
		w = maxf(w, font.get_string_size(word, HORIZONTAL_ALIGNMENT_LEFT, -1, size).x)
	return ceilf(w) + 1.0


func _draw_head() -> void:
	if _mode == Mode.HIDDEN:
		return
	var s := _style()
	var base := _number_baseline(s)
	var w := _head.size.x
	var num_font: Font = s["num_font"]
	var cap_font: Font = s["cap_font"]
	var count_w := num_font.get_string_size(_count, HORIZONTAL_ALIGNMENT_LEFT, -1, s["num_size"]).x
	if _total_below:
		_head.draw_string(num_font, Vector2(w - count_w, base), _count, HORIZONTAL_ALIGNMENT_LEFT, -1, s["num_size"], s["num_color"])
		_total_par.draw(_head.get_canvas_item(), Vector2(0, _total_top(s)), s["cap_color"])
	else:
		var total_w := cap_font.get_string_size(_total, HORIZONTAL_ALIGNMENT_LEFT, -1, s["cap_size"]).x
		_head.draw_string(num_font, Vector2(w - total_w - count_w, base), _count, HORIZONTAL_ALIGNMENT_LEFT, -1, s["num_size"], s["num_color"])
		_head.draw_string(cap_font, Vector2(w - total_w, base), _total, HORIZONTAL_ALIGNMENT_LEFT, -1, s["cap_size"], s["cap_color"])
	_chamber_par.draw(_head.get_canvas_item(), Vector2(0, base - _chamber_par.get_line_ascent(0)), s["cap_color"])


## "quórum N" centered under the line (kept inside the column), or at the start without a bar.
func _draw_quorum() -> void:
	if _mode == Mode.HIDDEN:
		return
	var s := _style()
	var w := _quorum_row.size.x
	var text_w := 0.0
	for i in _quorum_par.get_line_count():
		text_w = maxf(text_w, _quorum_par.get_line_width(i))
	var x := 0.0
	if _mode == Mode.BAR:
		x = clampf(_quorum_at() * w - text_w * 0.5, 0.0, maxf(0.0, w - text_w))
	var half_leading := (float(s["cap_line"]) - (s["cap_font"] as Font).get_height(s["cap_size"])) * 0.5
	_quorum_par.draw(_quorum_row.get_canvas_item(), Vector2(x, half_leading), s["cap_color"])


func _layout_bar() -> void:
	if not is_node_ready():
		return
	var w := _bar.size.x
	var rect := Rect2(0, BAR_GAP, w, BAR_HEIGHT)
	for c: Control in [_track, _outline]:
		c.position = rect.position
		c.size = rect.size
	var mat := _track.material as ShaderMaterial
	if mat:
		mat.set_shader_parameter(&"rect_size", rect.size)
	var qx := roundf(_quorum_at() * w)
	_line.position = Vector2(qx - 1.0, BAR_GAP + (BAR_HEIGHT - LINE_SIZE.y) * 0.5)
	_line.size = LINE_SIZE
	_set_fill(_fill)


func _set_fill(v: float) -> void:
	_fill = clampf(v, 0.0, 1.0)
	if not is_node_ready():
		return
	var w := _bar.size.x * _fill
	_fill_panel.visible = w >= 1.0
	_fill_panel.position = Vector2(0, BAR_GAP)
	_fill_panel.size = Vector2(w, BAR_HEIGHT)
	var full := _fill >= 0.999
	_fill_box.corner_radius_top_right = BAR_RADIUS if full else 0
	_fill_box.corner_radius_bottom_right = BAR_RADIUS if full else 0


func _hatch_color() -> Color:
	return Tokens.INACTIVE


func _apply_colors() -> void:
	var mat := _track.material as ShaderMaterial
	if mat:
		mat.set_shader_parameter(&"stripe_color", _hatch_color())
		mat.set_shader_parameter(&"period", HATCH_PERIOD)
		mat.set_shader_parameter(&"stripe_width", HATCH_STRIPE)
		mat.set_shader_parameter(&"radius", float(BAR_RADIUS))
	_outline_box.set_border_width_all(2 if high_contrast else 1)
	_outline_box.border_color = Tokens.TEXT if high_contrast else Tokens.OUTLINE
	_fill_box.bg_color = Tokens.TEXT
	_line_box.bg_color = Tokens.TEXT
	_line_box.border_color = Tokens.HC_BG if high_contrast else Tokens.CRISIS_BG
	_head.queue_redraw()
	_quorum_row.queue_redraw()


func _kill_tween() -> void:
	if _tween and _tween.is_valid():
		_tween.kill()
	_tween = null
