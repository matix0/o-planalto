extends AppScreen
## T-10 — final screen (docs/14 §14.09; 14A §14A.02 T-10.1 to T-10.5; boards Final, T10a,
## T10b, T16 T-16.3; gdd/sistemas/02_finais.md, 04_eixo.md, 08_eventos.md §5).
## One page that scrolls: category Tag → ending name → short description [a definir] →
## quote (C-12, hidden without a verified quote, D-091) → epilogue (hidden when the queue was
## empty, gdd 08 §5) → "Os valores que guiaram seu governo" (C-13 radar, legend, dominant
## axis text, gdd 04 §3.3) → "O país que você construiu" (the 8 meters WITH numbers — the
## only screen with numbers, docs/14 §14.09 —, reveal text GDD §9.2, closing phrase) →
## "Jogar novamente" / "Compartilhar". Data: Game.final_view() (api.md §6). The save was
## deleted when the run entered FINAL (gdd 10 §3.5). No pause here (gdd 10 §3.3).
## Focus: the Scroll first (arrows, Page Up/Down, Home/End scroll it), then Tab → Jogar
## novamente → Compartilhar (T10a). Settings apply live (text size, high contrast).

const SHARE_TEXT := "[Compartilhar — a definir]"    # 14A §14A.07 #7: content [a definir]
const TBD := "[a definir]"
const EVENT_ICON := preload("res://assets/icons/event_link.svg")
const METER_ICON_SCENE := preload("res://scenes/components/meter_icon.tscn")
const ROW_MIN_HEIGHT := 40                 # epilogue and meter rows (board: min-height 40)
const EVENT_ICON_SIZE := Tokens.ESP_24     # 24 px link icon (board)
const KEY_SCROLL_STEP := 40                # arrow keys on the Scroll: one row (a validar)
const PAGE_SCROLL := 0.9                   # Page Up/Down: 90% of the visible height (a validar)
## a validar (D-156 × T-10.1 "Linha do medidor: 'Caixa, 0'"): the number is visible here, so
## the row reads name + number and the icon's own "faixa n de 5" name is cleared; during the
## game the icon keeps reading the band.
const A11Y_READS_NUMBER := true
const A11Y_ROW := "%s, %d"
## Esc / Android back on the final screen: nothing (a validar — or back to the title).
const ESC_DOES_NOTHING := true

var _view: Dictionary = {}
var _icons: Array[MeterIcon] = []
var _ring_box := _scroll_focus_box()

@onready var _safe_area: MarginContainer = %SafeArea
@onready var _scroll: ScrollContainer = %Scroll
@onready var _ring: Control = %ScrollRing
@onready var _page: MarginContainer = %Page
@onready var _category: Label = %CategoryLabel
@onready var _name: Label = %EndingName
@onready var _description: Label = %EndingDesc
@onready var _quote: QuoteBlock = %QuoteBlock
@onready var _epilogue: VBoxContainer = %Epilogue
@onready var _epilogue_list: VBoxContainer = %EpilogueList
@onready var _radar: Radar = %Radar
@onready var _axis_text: Label = %AxisText
@onready var _meter_list: VBoxContainer = %MeterList
@onready var _reveal: Label = %RevealText
@onready var _closing: Label = %ClosingPhrase
@onready var _play_again: Button = %PlayAgain
@onready var _share: Button = %Share


func _ready() -> void:
	_play_again.pressed.connect(_on_play_again)
	_share.pressed.connect(_on_share)
	_scroll.gui_input.connect(_on_scroll_input)
	# The Scroll's own draw_focus_border also lights up while a button inside has the focus
	# (double ring), so the ring is drawn here only for the Scroll itself.
	_ring.draw.connect(_draw_scroll_ring)
	_scroll.focus_entered.connect(_ring.queue_redraw)
	_scroll.focus_exited.connect(_ring.queue_redraw)
	Settings.changed.connect(_on_settings_changed)
	_apply_safe_area()


func enter(params: Dictionary = {}) -> void:
	if params.get("returned", false):
		return
	var g := game()
	show_final(g.final_view() if g != null and g.has_method(&"final_view") else {})
	focus_first(_scroll)


func allows_pause() -> bool:
	return false   # gdd 10 §3.3: no pause on the start and final screens


func handle_cancel() -> bool:
	if ESC_DOES_NOTHING:
		return false
	request.emit(&"title", {})
	return true


## Fills the page from a final_view() dictionary (api.md §6). Missing fields → "[a definir]".
func show_final(view: Dictionary) -> void:
	_view = view
	var ending: Dictionary = _dict(view.get("ending"))
	_category.text = _text(ending.get("category_label"))
	_name.text = _text(ending.get("name"))
	_description.text = _text(view.get("description"))
	_quote.set_quote(_plain(ending.get("quote")), _plain(ending.get("author")))
	_fill_epilogue(_array(view.get("epilogue")))
	var axis: Dictionary = _dict(view.get("axis"))
	_radar.set_data(axis)
	_axis_text.text = _text(axis.get("text"))
	_fill_meters(_array(view.get("meters")))
	_reveal.text = _text(view.get("reveal_text"))
	_closing.text = _text(view.get("closing_phrase"))
	_scroll.scroll_vertical = 0


func view() -> Dictionary:
	return _view


func scroll() -> ScrollContainer:
	return _scroll


func buttons() -> Array[Button]:
	return [_play_again, _share]


func meter_icons() -> Array[MeterIcon]:
	return _icons


# --- Safe area (T10a: SafeArea top = safe_top; Page bottom = esp-24 + safe_bottom) ----------

func _apply_safe_area() -> void:
	if not is_node_ready():
		return
	_safe_area.add_theme_constant_override(&"margin_top", int(round(safe_top)))
	_safe_area.add_theme_constant_override(&"margin_bottom", 0)
	_safe_area.add_theme_constant_override(&"margin_left", 0)
	_safe_area.add_theme_constant_override(&"margin_right", 0)
	_page.add_theme_constant_override(&"margin_bottom", int(round(Tokens.ESP_24 + safe_bottom)))


# --- Sections -----------------------------------------------------------------------------

func _fill_epilogue(entries: Array) -> void:
	_clear(_epilogue_list)
	_epilogue.visible = not entries.is_empty()
	for entry in entries:
		var row := _row()
		_epilogue_list.add_child(row)
		var icon := TextureRect.new()
		icon.texture = EVENT_ICON
		icon.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		icon.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		icon.custom_minimum_size = Vector2(EVENT_ICON_SIZE, EVENT_ICON_SIZE)
		icon.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		icon.mouse_filter = Control.MOUSE_FILTER_IGNORE
		row.add_child(icon)
		row.add_child(_label(&"Body", _text(entry), true))


func _fill_meters(meters: Array) -> void:
	_clear(_meter_list)
	_icons.clear()
	for m in meters:
		var meter: Dictionary = _dict(m)
		var value := int(meter.get("value", 0))
		var meter_name := _text(meter.get("name"))
		var row := _row()
		_meter_list.add_child(row)
		var icon: MeterIcon = METER_ICON_SCENE.instantiate()
		icon.meter_id = String(meter.get("id", ""))
		icon.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		row.add_child(icon)
		# Row layout of C-01 (T10a "Well 32 + Glyph 20"): no effect-dot slot above the well.
		var dot_slot := icon.get_node_or_null(^"DotSlot") as Control
		if dot_slot:
			dot_slot.visible = false
		icon.custom_minimum_size = Vector2(Tokens.METER_ICON, Tokens.METER_ICON)
		icon.show_number = false   # the number sits at the end of the row (board), not under the well
		icon.set_value(value)
		icon.high_contrast = Settings.high_contrast
		_icons.append(icon)
		var name_label := _label(&"Body", meter_name, true)
		row.add_child(name_label)
		var number := _label(&"TitleS", str(value), false)
		number.name = &"Value"
		row.add_child(number)
		if A11Y_READS_NUMBER:
			icon.accessibility_name = ""
			row.accessibility_name = A11Y_ROW % [meter_name, value]


func _row() -> HBoxContainer:
	var row := HBoxContainer.new()
	row.custom_minimum_size = Vector2(0, ROW_MIN_HEIGHT)
	row.add_theme_constant_override(&"separation", Tokens.ESP_12)
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return row


func _label(style: StringName, text: String, expand: bool) -> Label:
	var label := Label.new()
	label.theme_type_variation = style
	label.text = text
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	label.mouse_filter = Control.MOUSE_FILTER_IGNORE
	if expand:
		label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	return label


static func _clear(list: Node) -> void:
	for child in list.get_children():
		list.remove_child(child)
		child.queue_free()


# --- Input and settings -------------------------------------------------------------------

func _on_play_again() -> void:
	var g := game()
	if g != null:
		g.new_run()
	# Same path as "Novo mandato" (title): tutorial only the first time (gdd 10 §3.5).
	request.emit(&"calibration" if Settings.tutorial_seen else &"tutorial", {})


func _on_share() -> void:
	var a := app()
	if a:
		a.show_toast(SHARE_TEXT)


## The Scroll has the focus first (T10a): arrows, Page Up/Down, Home/End scroll the page
## instead of moving the focus. Tab still goes to the buttons.
func _on_scroll_input(event: InputEvent) -> void:
	if not _scroll.has_focus():
		return
	if event is InputEventKey:
		_ring.queue_redraw()   # a hidden focus may show again after a key
	var page := int(_scroll.size.y * PAGE_SCROLL)
	if event.is_action_pressed(&"ui_down", true):
		_scroll.scroll_vertical += KEY_SCROLL_STEP
	elif event.is_action_pressed(&"ui_up", true):
		_scroll.scroll_vertical -= KEY_SCROLL_STEP
	elif event.is_action_pressed(&"ui_page_down", true):
		_scroll.scroll_vertical += page
	elif event.is_action_pressed(&"ui_page_up", true):
		_scroll.scroll_vertical -= page
	elif event.is_action_pressed(&"ui_end"):
		_scroll.scroll_vertical = int(_scroll.get_v_scroll_bar().max_value)
	elif event.is_action_pressed(&"ui_home"):
		_scroll.scroll_vertical = 0
	else:
		return
	_scroll.accept_event()


func _on_settings_changed(key: StringName) -> void:
	if key == &"high_contrast" or key == &"all":
		for icon in _icons:
			if is_instance_valid(icon):
				icon.high_contrast = Settings.high_contrast


## Focus ring of the Scroll: white 3 px inside the page edge, only while the Scroll itself
## has a visible focus (keyboard; hidden after a touch, grab_focus(hide_focus)).
func _draw_scroll_ring() -> void:
	if _scroll.has_focus(true):
		_ring.draw_style_box(_ring_box, Rect2(Vector2.ZERO, _ring.size))


func scroll_ring_visible() -> bool:
	return _scroll.has_focus(true)


static func _scroll_focus_box() -> StyleBoxFlat:
	var sb := StyleBoxFlat.new()
	sb.draw_center = false
	sb.set_border_width_all(Tokens.FOCUS_RING)
	sb.border_color = Tokens.TEXT
	return sb


# --- Data helpers -------------------------------------------------------------------------

static func _text(v: Variant) -> String:
	var s := _plain(v)
	return s if s != "" else TBD


static func _plain(v: Variant) -> String:
	return "" if v == null else str(v).strip_edges()


static func _dict(v: Variant) -> Dictionary:
	return v if v is Dictionary else {}


static func _array(v: Variant) -> Array:
	return v if v is Array else []
