extends SceneTree
## Headless theme check: godot --headless --path jogo -s res://tests/test_theme.gd

func _initialize() -> void:
	var failures: PackedStringArray = []
	for step in Tokens.STEPS:
		for hc in [false, true]:
			var t: Theme = ThemeBuilder.build(step, hc)
			_expect(failures, t != null, "theme built (%d, %s)" % [step, hc])
			_expect(failures, t.get_font_size(&"font_size", &"Body") == Tokens.type_size("Body", step), "Body size at %d" % step)
			_expect(failures, t.get_type_variation_base(&"TitleM") == &"Label", "TitleM is a Label variation")
			_expect(failures, t.get_type_variation_base(&"Primary") == &"Button", "Primary is a Button variation")
			_expect(failures, t.get_type_variation_base(&"Card") == &"PanelContainer", "Card is a PanelContainer variation")
			_expect(failures, t.has_stylebox(&"focus", &"Primary"), "Primary has focus ring")
			# P-018: every button text reads on its own background (≥ 4.5:1), selected states too.
			for pair in [["Primary", "font_color", "normal"], ["Primary", "font_pressed_color", "pressed"],
					["Segment", "font_pressed_color", "pressed"], ["Segment", "font_hover_pressed_color", "hover_pressed"]]:
				var fg: Color = t.get_color(StringName(pair[1]), StringName(pair[0]))
				var bg: Color = (t.get_stylebox(StringName(pair[2]), StringName(pair[0])) as StyleBoxFlat).bg_color
				_expect(failures, _contrast(fg, bg) >= 4.5, "%s %s on %s: %.2f:1 (%d, %s)" % [pair[0], pair[1], pair[2], _contrast(fg, bg), step, hc])
	_expect(failures, Tokens.band_of(20) == 1 and Tokens.band_of(21) == 2 and Tokens.band_of(81) == 5, "bands")
	var f: Dictionary = ThemeBuilder.fonts()
	for k in ["inter_400", "inter_600", "inter_italic", "poppins_600", "poppins_700"]:
		_expect(failures, f.get(k) != null, "font " + k)
	if failures.is_empty():
		print("test_theme: OK")
		quit(0)
	else:
		for x in failures:
			printerr("FAIL: " + x)
		quit(1)


func _contrast(a: Color, b: Color) -> float:
	var la := a.srgb_to_linear().get_luminance()   # WCAG relative luminance (linear RGB)
	var lb := b.srgb_to_linear().get_luminance()
	return (maxf(la, lb) + 0.05) / (minf(la, lb) + 0.05)


func _expect(failures: PackedStringArray, cond: bool, what: String) -> void:
	if not cond:
		failures.append(what)
