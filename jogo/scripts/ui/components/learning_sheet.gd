class_name LearningSheet
extends Control
## C-09 — Carta de Aprendizado as a modal bottom sheet (T-08.1 to T-08.3, T-15.4;
## docs/14 §14.07; docs/18; D-090, D-091, D-160). Shared by the game screen (lote D) and the
## impeachment scene (lote E).
##
## open(view) takes Game.learning_view() — {id, title, lived, concept, data,
## source: {label, url}, impact, technique, readonly} — and shows the caption "Carta de
## Aprendizado", the title, "O conceito por trás" + concept, the impact quote and "Saiba mais"
## (folded) with "O que você acabou de vivenciar", "Dados reais" and "Fonte" (link →
## OS.shell_open). The sheet follows its content up to the maximum height (screen −
## safe_top − esp-24); past that only the text scrolls and "Continuar" stays fixed.
## "Continuar" emits `continued`; the screen calls the Game action and then close().
## The 62% scrim stops every touch behind the sheet (D-160). Tap on the scrim: [a definir]
## (does nothing). Esc: not used here (a validar) — the screen decides.
## Read-only (resumed run, gdd 10 §5): "Você já leu esta carta" above the title.

signal continued
## close() finished (the sheet is hidden).
signal closed

const RISE_TIME := 0.3            # A-12: rises from below, scrim 0 → 62%, cubic out
const RM_FADE := 0.15             # A-12 with "Reduzir movimento": fade only (sheet and scrim)
const CLOSE_TIME := 0.2           # closing is not on the boards (a validar)
const MORE_FADE := 0.2            # A-13: "Saiba mais" opens in 200 ms (a validar); RM: cut
const FADE_HEIGHT := 64           # T-15.4: gradient over the end of the scrolling text
const SCROLLBAR_WIDTH := 4        # T-15.4: 4 px bar #90A4AE
const CHEVRON_SIZE := 24          # Folha board: chevron 24
const SCRIM_TAP_CLOSES := false   # T-08.1: "Toque no fundo escurecido: [a definir]" — nothing
const KICKER_TEXT := "Carta de Aprendizado"
const CONCEPT_LABEL := "O conceito por trás"
const MORE_TITLE := "Saiba mais"
const LIVED_LABEL := "O que você acabou de vivenciar"
const DATA_LABEL := "Dados reais"
const SOURCE_LABEL := "Fonte"
const TECHNIQUE_LABEL := "Técnica de manipulação"   # gdd 09: the card names it
const REREAD_TEXT := "Você já leu esta carta"
const LINK_A11Y := "Fonte: %s (abre o navegador)"
const SHEET_A11Y := "Carta de Aprendizado: %s"
const ICON_CHEVRON := preload("res://assets/icons/chevron_down.svg")

## A-12 / A-13 without movement (set by the screen from Settings.reduce_motion).
var reduce_motion: bool = false
## Safe area in canvas units: the top one limits the height, the bottom one goes under
## "Continuar" (the sheet runs under the system home indicator, T-08).
var safe_top: float = 0.0:
	set(v):
		safe_top = v
		_queue_fit()
var safe_bottom: float = 0.0:
	set(v):
		safe_bottom = v
		if is_node_ready():
			_apply_footer_margins()
## Opens the source link (tests replace it).
var link_opener: Callable = func(url: String) -> void: OS.shell_open(url)

var _view: Dictionary = {}
var _is_open := false
var _tween: Tween
var _more_tween: Tween
var _fit_queued := false
var _chevron_down: Texture2D
var _chevron_up: Texture2D

@onready var _scrim: ColorRect = %Scrim
@onready var _sheet: PanelContainer = %Sheet
@onready var _scroll_wrap: Control = %ScrollWrap
@onready var _scroll: ScrollContainer = %Scroll
@onready var _content: MarginContainer = %Content
@onready var _reread: PanelContainer = %RereadTag
@onready var _reread_text: Label = %RereadText
@onready var _kicker: Label = %Kicker
@onready var _title: Label = %CardTitle
@onready var _concept_box: VBoxContainer = %ConceptBox
@onready var _concept_label: Label = %ConceptLabel
@onready var _concept: Label = %ConceptText
@onready var _technique_box: VBoxContainer = %TechniqueBox
@onready var _technique_label: Label = %TechniqueLabel
@onready var _technique: Label = %TechniqueText
@onready var _impact: Label = %Impact
@onready var _more: FoldableContainer = %More
@onready var _more_box: VBoxContainer = %MoreBox
@onready var _lived_box: VBoxContainer = %LivedBox
@onready var _lived_label: Label = %LivedLabel
@onready var _lived: Label = %LivedText
@onready var _data_box: VBoxContainer = %DataBox
@onready var _data_label: Label = %DataLabel
@onready var _data: Label = %DataText
@onready var _source_box: VBoxContainer = %SourceBox
@onready var _source_label: Label = %SourceLabel
@onready var _source_row: HBoxContainer = %SourceRow
@onready var _source_link: LinkButton = %SourceLink
@onready var _source_icon: TextureRect = %SourceIcon
@onready var _source_text: Label = %SourceText
@onready var _fade: TextureRect = %Fade
@onready var _footer_line: ColorRect = %FooterLine
@onready var _footer: MarginContainer = %Footer
@onready var _continue: Button = %ContinueButton


func _ready() -> void:
	visible = false
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	_scrim.mouse_filter = Control.MOUSE_FILTER_STOP
	_sheet.mouse_filter = Control.MOUSE_FILTER_STOP
	_kicker.text = KICKER_TEXT
	_concept_label.text = CONCEPT_LABEL
	_technique_label.text = TECHNIQUE_LABEL
	_lived_label.text = LIVED_LABEL
	_data_label.text = DATA_LABEL
	_source_label.text = SOURCE_LABEL
	_reread_text.text = REREAD_TEXT
	_more.title = MORE_TITLE
	_more.folded = true
	_more.focus_mode = Control.FOCUS_ALL
	# P-017 (playtest, Alisson): the open "Saiba mais" swallowed the finger drag (STOP), so on a
	# phone the sheet would not scroll down to the source link. PASS lets the drag reach Scroll.
	_more.mouse_filter = Control.MOUSE_FILTER_PASS
	_source_link.underline = LinkButton.UNDERLINE_MODE_ALWAYS
	_source_link.focus_mode = Control.FOCUS_ALL
	_chevron_down = _icon(ICON_CHEVRON, CHEVRON_SIZE, false)
	_chevron_up = _icon(ICON_CHEVRON, CHEVRON_SIZE, true)
	_sheet.offset_transform_enabled = true
	_scroll.follow_focus = true
	_scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	_more.folding_changed.connect(_on_folding_changed)
	_continue.pressed.connect(_on_continue_pressed)
	_source_link.pressed.connect(_on_source_pressed)
	_scrim.gui_input.connect(_on_scrim_input)
	_content.minimum_size_changed.connect(_queue_fit)
	_footer.minimum_size_changed.connect(_queue_fit)
	resized.connect(_on_resized)
	var bar := _scroll.get_v_scroll_bar()
	bar.value_changed.connect(_update_fade)
	bar.changed.connect(_update_fade.bind(0.0))
	_apply_footer_margins()
	_restyle()
	_link_focus()


func _notification(what: int) -> void:
	if what == NOTIFICATION_THEME_CHANGED and is_node_ready():
		_restyle()
		_queue_fit()


# --- API -------------------------------------------------------------------------------------

## Shows the sheet for `view` (Game.learning_view() or the `learning` dictionary of
## Game.impeachment_view()). Starts folded and scrolled to the top; A-12.
func open(view: Dictionary) -> void:
	_view = view.duplicate(true)
	_fill(view)
	_more.folded = true
	_more_box.modulate.a = 1.0
	_scroll.scroll_vertical = 0
	_is_open = true
	visible = true
	_layout_scrim()
	_fit()
	_kill(_tween)
	_kill(_more_tween)
	_tween = create_tween().set_parallel(true)
	_scrim.modulate.a = 0.0
	if reduce_motion:
		_sheet.offset_transform_position_ratio = Vector2.ZERO
		_sheet.modulate.a = 0.0
		_tween.tween_property(_scrim, "modulate:a", 1.0, RM_FADE)
		_tween.tween_property(_sheet, "modulate:a", 1.0, RM_FADE)
	else:
		_sheet.modulate.a = 1.0
		_sheet.offset_transform_position_ratio = Vector2(0.0, 1.0)
		_tween.tween_property(_scrim, "modulate:a", 1.0, RISE_TIME) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
		_tween.tween_property(_sheet, "offset_transform_position_ratio", Vector2.ZERO, RISE_TIME) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	_give_focus(_more)


## Slides the sheet down (fade with reduce motion), hides it and emits `closed`.
func close() -> void:
	if not _is_open:
		return
	_is_open = false
	_kill(_tween)
	_kill(_more_tween)
	var t := RM_FADE if reduce_motion else CLOSE_TIME
	_tween = create_tween().set_parallel(true)
	_tween.tween_property(_scrim, "modulate:a", 0.0, t)
	if reduce_motion:
		_tween.tween_property(_sheet, "modulate:a", 0.0, t)
	else:
		_tween.tween_property(_sheet, "offset_transform_position_ratio", Vector2(0.0, 1.0), t) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN)
	_tween.chain().tween_callback(_after_close)


## Hides at once (no animation).
func hide_now() -> void:
	_is_open = false
	_kill(_tween)
	_kill(_more_tween)
	visible = false


func is_open() -> bool:
	return _is_open


## The view last passed to open().
func view() -> Dictionary:
	return _view


## "Saiba mais" (tests and keyboard helpers).
func more() -> FoldableContainer:
	return _more


func continue_button() -> Button:
	return _continue


func source_link() -> LinkButton:
	return _source_link


## True when the text is taller than the room and scrolls under the fixed "Continuar".
func is_scrolling() -> bool:
	return _scroll.vertical_scroll_mode != ScrollContainer.SCROLL_MODE_SHOW_NEVER


## Scroll bar of the sheet (tests, captures).
func scroll() -> ScrollContainer:
	return _scroll


## Applies a gray 4 px bar to a ScrollContainer (also used by the game screen, T-15.6).
static func style_scrollbar(scroll_container: ScrollContainer, color: Color) -> void:
	var bar := scroll_container.get_v_scroll_bar()
	var track := StyleBoxEmpty.new()
	track.content_margin_left = SCROLLBAR_WIDTH * 0.5
	track.content_margin_right = SCROLLBAR_WIDTH * 0.5
	var grab := StyleBoxFlat.new()
	grab.bg_color = color
	grab.set_corner_radius_all(2)
	grab.content_margin_left = SCROLLBAR_WIDTH * 0.5
	grab.content_margin_right = SCROLLBAR_WIDTH * 0.5
	bar.add_theme_stylebox_override(&"scroll", track)
	bar.add_theme_stylebox_override(&"scroll_focus", track)
	for key in [&"grabber", &"grabber_highlight", &"grabber_pressed"]:
		bar.add_theme_stylebox_override(key, grab)


## Vertical gradient from transparent to `color` (end of a scrolling text, T-15.4/T-15.6).
static func make_fade(color: Color) -> GradientTexture2D:
	var g := Gradient.new()
	g.set_color(0, Color(color, 0.0))
	g.set_color(1, color)
	var tex := GradientTexture2D.new()
	tex.gradient = g
	tex.fill_from = Vector2(0, 0)
	tex.fill_to = Vector2(0, 1)
	tex.width = 4
	tex.height = 64
	return tex


## Rect of the whole window in `control`'s local coordinates (scrim and highlights that must
## cover the side bands on PC, beyond the ≤ 430 column).
static func viewport_rect_in(control: Control) -> Rect2:
	if not control.is_inside_tree():
		return Rect2(Vector2.ZERO, control.size)
	var vp := control.get_viewport_rect()
	var inv := control.get_global_transform().affine_inverse()
	var a := inv * vp.position
	var b := inv * vp.end
	return Rect2(a, b - a)


# --- Content ---------------------------------------------------------------------------------

func _fill(view: Dictionary) -> void:
	var title := String(view.get("title", ""))
	_title.text = title
	_concept.text = String(view.get("concept", ""))
	_concept_box.visible = _concept.text != ""
	var technique := String(view.get("technique", ""))
	_technique.text = technique
	_technique_box.visible = technique != ""
	_impact.text = _quoted(String(view.get("impact", "")))
	_impact.visible = _impact.text != ""
	_lived.text = String(view.get("lived", ""))
	_lived_box.visible = _lived.text != ""
	_data.text = String(view.get("data", ""))
	_data_box.visible = _data.text != ""   # D-091: data only with a verified source
	var source: Dictionary = view.get("source", {}) if view.get("source", {}) is Dictionary else {}
	var label := String(source.get("label", ""))
	var url := String(source.get("url", ""))
	_source_box.visible = label != "" or url != ""
	_source_row.visible = url != ""
	_source_text.visible = url == ""
	_source_link.text = label if label != "" else url
	_source_link.accessibility_name = LINK_A11Y % _source_link.text
	_source_text.text = label
	_reread.visible = bool(view.get("readonly", false))
	_sheet.accessibility_name = SHEET_A11Y % title
	_link_focus()


func _quoted(text: String) -> String:
	var t := text.strip_edges()
	if t == "" or t.begins_with("“") or t.begins_with("\""):
		return t
	return "“%s”" % t


# --- Layout ----------------------------------------------------------------------------------

func _on_resized() -> void:
	_layout_scrim()
	_queue_fit()


func _queue_fit() -> void:
	if _fit_queued or not is_node_ready():
		return
	_fit_queued = true
	_fit.call_deferred()


## Height follows the content up to the maximum; past it only the text scrolls (T-08.2).
func _fit() -> void:
	_fit_queued = false
	if not is_node_ready():
		return
	if size.x > 2.0 * Tokens.ESP_24:
		ConsequenceLine.fit_pill_label(_reread_text, size.x - 2.0 * Tokens.ESP_24)
	var max_h := maxf(0.0, size.y - safe_top - Tokens.ESP_24)
	var footer_h := _footer.get_combined_minimum_size().y + _footer_line.custom_minimum_size.y
	var content_h := _content.get_combined_minimum_size().y
	var room := maxf(0.0, max_h - footer_h)
	var scrolls := content_h > room + 0.5
	_scroll_wrap.custom_minimum_size.y = minf(content_h, room)
	_scroll.vertical_scroll_mode = ScrollContainer.SCROLL_MODE_AUTO if scrolls else ScrollContainer.SCROLL_MODE_SHOW_NEVER
	_footer_line.modulate.a = 1.0 if scrolls else 0.0
	_update_fade()


func _update_fade(_value: float = 0.0) -> void:
	if not is_node_ready():
		return
	var bar := _scroll.get_v_scroll_bar()
	_fade.visible = is_scrolling() and bar.max_value - bar.page - bar.value > 1.0


func _layout_scrim() -> void:
	var r := viewport_rect_in(self)
	_scrim.offset_left = r.position.x
	_scrim.offset_top = r.position.y
	_scrim.offset_right = r.end.x - size.x
	_scrim.offset_bottom = r.end.y - size.y


func _apply_footer_margins() -> void:
	_footer.add_theme_constant_override(&"margin_top", Tokens.ESP_16)
	_footer.add_theme_constant_override(&"margin_left", Tokens.ESP_24)
	_footer.add_theme_constant_override(&"margin_right", Tokens.ESP_24)
	_footer.add_theme_constant_override(&"margin_bottom", int(round(Tokens.ESP_16 + safe_bottom)))
	_queue_fit()


# --- Style -----------------------------------------------------------------------------------

func _restyle() -> void:
	var hc := _high_contrast()
	var sheet_bg := Tokens.HC_BG if hc else Tokens.CARD
	var edge := Tokens.TEXT if hc else Tokens.OUTLINE
	# Sheet panel from the Theme (raio-24 on top; P2 adds a white top edge), padding moved
	# inside so the text scrolls under a fixed footer.
	_sheet.remove_theme_stylebox_override(&"panel")
	var base := _sheet.get_theme_stylebox(&"panel")
	if base:
		var box := base.duplicate() as StyleBox
		box.content_margin_left = 0
		box.content_margin_right = 0
		box.content_margin_top = 0
		box.content_margin_bottom = 0
		_sheet.add_theme_stylebox_override(&"panel", box)
	# "Saiba mais": app style, then the board's look on the sheet — transparent row with a
	# 1 px line under it (2 px white in P2), chevron 24, no panel around the open content.
	AppScreen.style_foldable(_more)
	var row := StyleBoxFlat.new()
	row.draw_center = false
	row.border_width_bottom = 2 if hc else 1
	row.border_color = edge
	row.content_margin_top = Tokens.ESP_12
	row.content_margin_bottom = Tokens.ESP_12
	row.content_margin_left = 0
	row.content_margin_right = 0
	for key in [&"title_panel", &"title_hover_panel", &"title_collapsed_panel", &"title_collapsed_hover_panel"]:
		_more.add_theme_stylebox_override(key, row)
	var body := StyleBoxEmpty.new()
	body.content_margin_top = Tokens.ESP_16
	_more.add_theme_stylebox_override(&"panel", body)
	_more.add_theme_icon_override(&"folded_arrow", _chevron_down)
	_more.add_theme_icon_override(&"folded_arrow_mirrored", _chevron_down)
	_more.add_theme_icon_override(&"expanded_arrow", _chevron_up)
	_more.add_theme_icon_override(&"expanded_arrow_mirrored", _chevron_up)
	_more.add_theme_constant_override(&"h_separation", Tokens.ESP_12)
	for key in [&"font_color", &"font_hover_color", &"font_pressed_color", &"font_focus_color"]:
		_source_link.add_theme_color_override(key, Tokens.TEXT)
	_source_link.add_theme_color_override(&"font_hover_color", Tokens.HIGHLIGHT)
	_fade.texture = make_fade(sheet_bg)
	_footer_line.color = edge
	style_scrollbar(_scroll, edge)


func _high_contrast() -> bool:
	var s := get_node_or_null(^"/root/Settings")
	return s != null and bool(s.get("high_contrast"))


static func _icon(tex: Texture2D, px: int, flip: bool) -> Texture2D:
	var img := tex.get_image()
	if img == null:
		return tex
	if img.is_compressed():
		img.decompress()
	img.resize(px, px, Image.INTERPOLATE_LANCZOS)
	if flip:
		img.flip_y()
	return ImageTexture.create_from_image(img)


# --- Focus (trapped in the sheet: "Saiba mais" → Fonte (if open) → "Continuar") -------------

func _link_focus() -> void:
	var chain: Array[Control] = [_more]
	if not _more.folded and _source_box.visible and _source_row.visible:
		chain.append(_source_link)
	chain.append(_continue)
	for i in chain.size():
		var c := chain[i]
		var nxt := chain[(i + 1) % chain.size()]
		var prv := chain[(i - 1 + chain.size()) % chain.size()]
		c.focus_next = c.get_path_to(nxt)
		c.focus_previous = c.get_path_to(prv)
		c.focus_neighbor_bottom = c.get_path_to(nxt)
		c.focus_neighbor_top = c.get_path_to(prv)
		c.focus_neighbor_left = c.get_path_to(c)
		c.focus_neighbor_right = c.get_path_to(c)


func _give_focus(control: Control) -> void:
	if not is_inside_tree():
		return
	var app := get_tree().get_first_node_in_group(&"app_main")
	if app and app.has_method(&"give_focus"):
		app.call(&"give_focus", control)
	else:
		control.grab_focus.call_deferred()


# --- Events ----------------------------------------------------------------------------------

func _on_continue_pressed() -> void:
	if _is_open:
		continued.emit()


func _on_source_pressed() -> void:
	var source: Dictionary = _view.get("source", {}) if _view.get("source", {}) is Dictionary else {}
	var url := String(source.get("url", ""))
	if url != "" and link_opener.is_valid():
		link_opener.call(url)


func _on_folding_changed(is_folded: bool) -> void:
	_link_focus()
	_queue_fit()
	_kill(_more_tween)
	if is_folded or reduce_motion:
		_more_box.modulate.a = 1.0
		return
	_more_box.modulate.a = 0.0
	_more_tween = create_tween()
	_more_tween.tween_property(_more_box, "modulate:a", 1.0, MORE_FADE) \
		.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)


func _on_scrim_input(event: InputEvent) -> void:
	# D-160: the scrim stops every touch; what a tap on it does is [a definir].
	if SCRIM_TAP_CLOSES and event is InputEventMouseButton and not event.pressed:
		continued.emit()


func _after_close() -> void:
	if not _is_open:
		visible = false
		closed.emit()


func _kill(t: Tween) -> void:
	if t and t.is_valid():
		t.kill()
