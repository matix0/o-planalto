class_name ThemeBuilder
extends RefCounted
## Builds the game Theme from Tokens at runtime, for one text step
## (16/18/20/24, 36 for tests — D-165, D-169) and normal or high contrast (P2).
## Apply the result to the root Control; rebuild when Settings change.
##
## Type variations (set `theme_type_variation` on the node):
##   Labels:  Display, TitleL, TitleM, TitleS, Body, Muted, Option, Caption, Footer, Quote, Number
##   Buttons: Primary, Secondary, Icon, Link, Segment
##   Panels (PanelContainer): Background, Card, CardCrisis, Sheet, Modal, Toast, Tag, Well

const FONT_DIR := "res://assets/fonts/"

static var _fonts: Dictionary = {}


static func build(step: int = Tokens.DEFAULT_STEP, high_contrast: bool = false) -> Theme:
	var t := Theme.new()
	var f := fonts()
	var bg := Tokens.HC_BG if high_contrast else Tokens.BG
	var card := Tokens.HC_BG if high_contrast else Tokens.CARD
	var text2 := Tokens.TEXT if high_contrast else Tokens.TEXT2
	var outline := Tokens.TEXT if high_contrast else Tokens.OUTLINE

	t.default_font = f["inter_400"]
	t.default_font_size = Tokens.type_size("Body", step)

	# --- Labels ---
	t.set_color(&"font_color", &"Label", Tokens.TEXT)
	_label(t, "Display", f["poppins_700"], step, Tokens.TEXT)
	_label(t, "TitleL", f["poppins_700"], step, Tokens.TEXT)
	_label(t, "TitleM", f["poppins_600"], step, Tokens.TEXT)
	_label(t, "TitleS", f["poppins_600"], step, Tokens.TEXT)
	_label(t, "Body", f["inter_400"], step, Tokens.TEXT)
	_label(t, "Muted", f["inter_400"], step, text2, "Body")
	_label(t, "Option", f["inter_600"], step, Tokens.TEXT)
	_label(t, "Caption", f["inter_400"], step, text2)
	_label(t, "Footer", f["inter_400"], step, text2)
	_label(t, "Quote", f["inter_italic"], step, Tokens.TEXT)
	_label(t, "Number", f["poppins_700"], step, Tokens.TEXT)

	# --- Buttons (min height via node custom_minimum_size = TOUCH_MIN) ---
	var btn_size := Tokens.type_size("Option", step)
	for name in ["Primary", "Secondary", "Icon", "Link", "Segment"]:
		t.set_type_variation(name, &"Button")
		t.set_font(&"font", name, f["inter_600"])
		t.set_font_size(&"font_size", name, btn_size)
		t.set_stylebox(&"focus", name, _focus(Tokens.RADIUS_12))
	var primary_fg := Tokens.HC_BG if high_contrast else Tokens.BG
	_button_colors(t, "Primary", primary_fg)
	t.set_stylebox(&"normal", &"Primary", _box(Tokens.TEXT, Tokens.RADIUS_12, 0, Color(), Tokens.ESP_16, Tokens.ESP_12))
	t.set_stylebox(&"hover", &"Primary", _box(Tokens.TEXT, Tokens.RADIUS_12, 0, Color(), Tokens.ESP_16, Tokens.ESP_12))
	t.set_stylebox(&"pressed", &"Primary", _box(text2 if not high_contrast else Tokens.HIGHLIGHT, Tokens.RADIUS_12, 0, Color(), Tokens.ESP_16, Tokens.ESP_12))
	t.set_stylebox(&"disabled", &"Primary", _box(Color(Tokens.TEXT, 0.5), Tokens.RADIUS_12, 0, Color(), Tokens.ESP_16, Tokens.ESP_12))

	_button_colors(t, "Secondary", Tokens.TEXT)
	var sec_border := 2
	t.set_stylebox(&"normal", &"Secondary", _box(Color(0, 0, 0, 0), Tokens.RADIUS_12, sec_border, outline, Tokens.ESP_16, Tokens.ESP_12))
	t.set_stylebox(&"hover", &"Secondary", _box(Color(0, 0, 0, 0), Tokens.RADIUS_12, sec_border, outline, Tokens.ESP_16, Tokens.ESP_12))
	t.set_stylebox(&"pressed", &"Secondary", _box(card, Tokens.RADIUS_12, sec_border, outline, Tokens.ESP_16, Tokens.ESP_12))
	t.set_stylebox(&"disabled", &"Secondary", _box(Color(0, 0, 0, 0), Tokens.RADIUS_12, sec_border, Color(outline, 0.5), Tokens.ESP_16, Tokens.ESP_12))

	_button_colors(t, "Icon", Tokens.TEXT)
	t.set_stylebox(&"normal", &"Icon", _box(Color(0, 0, 0, 0), Tokens.RADIUS_12, 2 if high_contrast else 0, Tokens.TEXT, Tokens.ESP_12, Tokens.ESP_12))
	t.set_stylebox(&"hover", &"Icon", _box(Color(0, 0, 0, 0), Tokens.RADIUS_12, 2 if high_contrast else 0, Tokens.TEXT, Tokens.ESP_12, Tokens.ESP_12))
	t.set_stylebox(&"pressed", &"Icon", _box(Tokens.PRESSED, Tokens.RADIUS_12, 2 if high_contrast else 0, Tokens.TEXT, Tokens.ESP_12, Tokens.ESP_12))
	t.set_stylebox(&"disabled", &"Icon", _box(Color(0, 0, 0, 0), Tokens.RADIUS_12, 0, Color(), Tokens.ESP_12, Tokens.ESP_12))
	t.set_color(&"icon_normal_color", &"Icon", Tokens.TEXT)
	t.set_color(&"icon_pressed_color", &"Icon", Tokens.TEXT)
	t.set_color(&"icon_hover_color", &"Icon", Tokens.TEXT)
	t.set_color(&"icon_focus_color", &"Icon", Tokens.TEXT)

	_button_colors(t, "Link", Tokens.TEXT)
	for state in [&"normal", &"hover", &"pressed", &"disabled"]:
		t.set_stylebox(state, &"Link", _box(Color(0, 0, 0, 0), Tokens.RADIUS_12, 0, Color(), 0, Tokens.ESP_12))

	_button_colors(t, "Segment", Tokens.TEXT)
	t.set_color(&"font_pressed_color", &"Segment", primary_fg)
	t.set_color(&"font_hover_pressed_color", &"Segment", primary_fg)
	t.set_stylebox(&"normal", &"Segment", _box(Color(0, 0, 0, 0), Tokens.RADIUS_12, 2, outline, Tokens.ESP_12, Tokens.ESP_12))
	t.set_stylebox(&"hover", &"Segment", _box(Color(0, 0, 0, 0), Tokens.RADIUS_12, 2, outline, Tokens.ESP_12, Tokens.ESP_12))
	t.set_stylebox(&"pressed", &"Segment", _box(Tokens.TEXT, Tokens.RADIUS_12, 2, Tokens.TEXT, Tokens.ESP_12, Tokens.ESP_12))
	t.set_stylebox(&"hover_pressed", &"Segment", _box(Tokens.TEXT, Tokens.RADIUS_12, 2, Tokens.TEXT, Tokens.ESP_12, Tokens.ESP_12))

	# --- Generic controls ---
	t.set_font(&"font", &"Button", f["inter_600"])
	t.set_font_size(&"font_size", &"Button", btn_size)
	t.set_font(&"font", &"CheckButton", f["inter_400"])
	t.set_font_size(&"font_size", &"CheckButton", Tokens.type_size("Body", step))
	t.set_color(&"font_color", &"CheckButton", Tokens.TEXT)
	t.set_stylebox(&"focus", &"CheckButton", _focus(Tokens.RADIUS_12))
	t.set_font(&"font", &"LinkButton", f["inter_400"])
	t.set_font_size(&"font_size", &"LinkButton", Tokens.type_size("Body", step))
	t.set_color(&"font_color", &"LinkButton", Tokens.TEXT)
	t.set_stylebox(&"focus", &"LinkButton", _focus(4))
	var track := StyleBoxFlat.new()
	track.bg_color = outline
	track.set_corner_radius_all(2)
	track.content_margin_top = 2
	track.content_margin_bottom = 2
	t.set_stylebox(&"slider", &"HSlider", track)
	var fill := track.duplicate() as StyleBoxFlat
	fill.bg_color = Tokens.TEXT
	t.set_stylebox(&"grabber_area", &"HSlider", fill)
	t.set_stylebox(&"grabber_area_highlight", &"HSlider", fill)
	t.set_stylebox(&"focus", &"HSlider", _focus(Tokens.RADIUS_12))
	t.set_stylebox(&"panel", &"PanelContainer", StyleBoxEmpty.new())

	# --- Panels ---
	var hc_edge := 2 if high_contrast else 0
	_panel(t, "Background", _box(bg, 0, 0, Color(), 0, 0))
	var card_box := _box(card, Tokens.RADIUS_16, hc_edge, Tokens.TEXT, Tokens.ESP_24, Tokens.ESP_24)
	if not high_contrast:
		card_box.shadow_color = Color(0, 0, 0, 0.35)
		card_box.shadow_size = Tokens.ESP_24
		card_box.shadow_offset = Vector2(0, Tokens.ESP_8)
	_panel(t, "Card", card_box)
	_panel(t, "CardCrisis", card_box.duplicate())
	var sheet := _box(card, 0, 0, Color(), Tokens.ESP_24, Tokens.ESP_24)
	sheet.corner_radius_top_left = Tokens.RADIUS_24
	sheet.corner_radius_top_right = Tokens.RADIUS_24
	if high_contrast:
		sheet.border_width_top = 2
		sheet.border_color = Tokens.TEXT
	_panel(t, "Sheet", sheet)
	_panel(t, "Modal", _box(card, Tokens.RADIUS_24, 2 if high_contrast else 1, outline, Tokens.ESP_24, Tokens.ESP_24))
	_panel(t, "Toast", _box(card, Tokens.RADIUS_12, 2 if high_contrast else 1, outline, Tokens.ESP_16, Tokens.ESP_12))
	_panel(t, "Tag", _box(Color(0, 0, 0, 0), Tokens.RADIUS_PILL, 2 if high_contrast else 1, outline, Tokens.ESP_12, Tokens.ESP_4))
	_panel(t, "Well", _box(card, Tokens.RADIUS_8, hc_edge, Tokens.TEXT, 0, 0))
	return t


## Loads the OFL fonts once (Inter variable + italic, Poppins SemiBold/Bold).
static func fonts() -> Dictionary:
	if not _fonts.is_empty():
		return _fonts
	var inter: FontFile = load(FONT_DIR + "Inter-Variable.ttf")
	var inter_italic: FontFile = load(FONT_DIR + "Inter-Italic-Variable.ttf")
	_fonts = {
		"inter_400": _weight(inter, 400),
		"inter_500": _weight(inter, 500),
		"inter_600": _weight(inter, 600),
		"inter_italic": _weight(inter_italic, 400),
		"poppins_600": load(FONT_DIR + "Poppins-SemiBold.ttf"),
		"poppins_700": load(FONT_DIR + "Poppins-Bold.ttf"),
	}
	return _fonts


static func _weight(base: Font, wght: int) -> FontVariation:
	var fv := FontVariation.new()
	fv.base_font = base
	var ts := TextServerManager.get_primary_interface()
	fv.variation_opentype = {ts.name_to_tag("wght"): wght}
	return fv


static func _label(t: Theme, name: String, font: Font, step: int, color: Color, size_from: String = "") -> void:
	var style := size_from if size_from != "" else name
	var size := Tokens.type_size(style, step)
	var line := Tokens.type_line(style, step)
	t.set_type_variation(name, &"Label")
	t.set_font(&"font", name, font)
	t.set_font_size(&"font_size", name, size)
	t.set_color(&"font_color", name, color)
	if line > 0:
		t.set_constant(&"line_spacing", name, int(round(line - font.get_height(size))))


static func _button_colors(t: Theme, name: String, color: Color) -> void:
	for key in [&"font_color", &"font_hover_color", &"font_pressed_color", &"font_focus_color", &"font_hover_pressed_color"]:
		t.set_color(key, name, color)
	t.set_color(&"font_disabled_color", name, Color(color, 0.5))


static func _panel(t: Theme, name: String, box: StyleBox) -> void:
	t.set_type_variation(name, &"PanelContainer")
	t.set_stylebox(&"panel", name, box)


static func _box(bg: Color, radius: int, border: int, border_color: Color, pad_x: int, pad_y: int) -> StyleBoxFlat:
	var sb := StyleBoxFlat.new()
	sb.bg_color = bg
	sb.draw_center = bg.a > 0.0
	sb.set_corner_radius_all(radius)
	if border > 0:
		sb.set_border_width_all(border)
		sb.border_color = border_color
	sb.content_margin_left = pad_x
	sb.content_margin_right = pad_x
	sb.content_margin_top = pad_y
	sb.content_margin_bottom = pad_y
	sb.anti_aliasing = true
	return sb


## White 3 px ring with 4 px offset (Tokens: focus ring).
static func _focus(radius: int) -> StyleBoxFlat:
	var sb := StyleBoxFlat.new()
	sb.draw_center = false
	sb.set_border_width_all(Tokens.FOCUS_RING)
	sb.border_color = Tokens.TEXT
	sb.set_corner_radius_all(radius + Tokens.FOCUS_OFFSET)
	sb.set_expand_margin_all(Tokens.FOCUS_OFFSET)
	return sb
