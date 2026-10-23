class_name AppScreen
extends Control
## Base for every screen shown by Main (P-005 shell).
## A screen is a full-rect Control inside the centered column (≤ 430, D-171).
## It applies the safe area itself (Viewport board: "SafeArea, MarginContainer
## na raiz de cada tela"), so a sheet can still reach the bottom edge.
## It never navigates by itself: it emits `request`.

## Ask Main to show another screen. Params understood by Main:
##   "push": true      → keep this screen underneath; &"back" returns to it.
##   "fade_time": 0.5  → total fade of this transition (default 300 ms, A-22).
## Special ids: &"back" (pop the top screen), &"title" (start screen).
signal request(screen_id: StringName, params: Dictionary)

## Id under which Main created this screen.
var screen_id: StringName = &""
## Safe-area insets in canvas units (0 on PC and Web). Set by Main.
var safe_top: float = 0.0
var safe_bottom: float = 0.0


## Called by Main right after the screen enters the tree, and again with
## {"returned": true} when it comes back to the top of the stack (Main then
## restores the focus that the screen had before).
func enter(_params: Dictionary = {}) -> void:
	pass


## Return true when Esc / ui_cancel was consumed by the screen (close a
## screen, cancel a revealed half of the card first — D-167).
func handle_cancel() -> bool:
	return false


## True only on screens where the game is running (calibration and game):
## the pause menu exists in every state except start and final (gdd 10 §3.3).
func allows_pause() -> bool:
	return false


## Called by Main whenever the safe area changes (and before enter()).
func set_safe_area(top: float, bottom: float) -> void:
	safe_top = top
	safe_bottom = bottom
	_apply_safe_area()


## Override to re-apply margins (see fit_margins()).
func _apply_safe_area() -> void:
	pass


## Initial focus of a screen ("grab_focus() no primeiro botão ao abrir"): the
## ring shows only when the player is using the keyboard or a gamepad.
func focus_first(control: Control) -> void:
	var a := app()
	if a:
		a.give_focus(control)
	else:
		control.grab_focus.call_deferred()


## Sets a MarginContainer to safe area + extra space, sides esp-24 by default.
func fit_margins(margin: MarginContainer, extra_top: float, extra_bottom: float, side: float = Tokens.ESP_24) -> void:
	margin.add_theme_constant_override(&"margin_top", int(round(safe_top + extra_top)))
	margin.add_theme_constant_override(&"margin_bottom", int(round(safe_bottom + extra_bottom)))
	margin.add_theme_constant_override(&"margin_left", int(side))
	margin.add_theme_constant_override(&"margin_right", int(side))


## The Main node (group "app_main"): toasts, confirmations, pause, backdrop.
func app() -> AppMain:
	return get_tree().get_first_node_in_group(&"app_main") as AppMain if is_inside_tree() else null


## The Game API (autoload `Game`, or the fake a test injected into Main).
func game() -> Node:
	var a := app()
	if a and a.game:
		return a.game
	return get_node_or_null(^"/root/Game")


## FoldableContainer look for the app (no ThemeBuilder variation yet — a validar):
## title in a #37474F panel (raio-12, esp-12 × esp-16), DM Sans 600 at the body size,
## white text, white focus ring; high contrast = black with a 2 px white edge.
static func style_foldable(fold: FoldableContainer) -> void:
	var hc: bool = Settings.high_contrast
	var fill := Tokens.HC_BG if hc else Tokens.CARD
	var edge := 2 if hc else 0
	var title := _fold_box(fill, edge)
	var hover := _fold_box(Tokens.HC_BG if hc else Tokens.PRESSED, edge)
	var open_title := title.duplicate() as StyleBoxFlat
	open_title.corner_radius_bottom_left = 0
	open_title.corner_radius_bottom_right = 0
	var open_hover := hover.duplicate() as StyleBoxFlat
	open_hover.corner_radius_bottom_left = 0
	open_hover.corner_radius_bottom_right = 0
	var panel := _fold_box(fill, edge)
	panel.corner_radius_top_left = 0
	panel.corner_radius_top_right = 0
	fold.add_theme_stylebox_override(&"title_panel", open_title)
	fold.add_theme_stylebox_override(&"title_hover_panel", open_hover)
	fold.add_theme_stylebox_override(&"title_collapsed_panel", title)
	fold.add_theme_stylebox_override(&"title_collapsed_hover_panel", hover)
	fold.add_theme_stylebox_override(&"panel", panel)
	var ring := StyleBoxFlat.new()
	ring.draw_center = false
	ring.set_border_width_all(Tokens.FOCUS_RING)
	ring.border_color = Tokens.TEXT
	ring.set_corner_radius_all(Tokens.RADIUS_12 + Tokens.FOCUS_OFFSET)
	ring.set_expand_margin_all(Tokens.FOCUS_OFFSET)
	fold.add_theme_stylebox_override(&"focus", ring)
	fold.add_theme_font_override(&"font", ThemeBuilder.fonts()["body_600"])
	fold.add_theme_font_size_override(&"font_size", Tokens.type_size("Body", Settings.text_step))
	for c in [&"font_color", &"hover_font_color", &"collapsed_font_color"]:
		fold.add_theme_color_override(c, Tokens.TEXT)


static func _fold_box(color: Color, border: int) -> StyleBoxFlat:
	var sb := StyleBoxFlat.new()
	sb.bg_color = color
	sb.set_corner_radius_all(Tokens.RADIUS_12)
	if border > 0:
		sb.set_border_width_all(border)
		sb.border_color = Tokens.TEXT
	sb.content_margin_left = Tokens.ESP_16
	sb.content_margin_right = Tokens.ESP_16
	sb.content_margin_top = Tokens.ESP_12
	sb.content_margin_bottom = Tokens.ESP_12
	sb.anti_aliasing = true
	return sb
