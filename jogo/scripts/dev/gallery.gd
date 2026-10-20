extends Control
## Dev gallery of the game UI kit (P-005, Lote B): C-01 to C-08, C-10, C-19
## and T-06 compositions, to compare with the final wireframe round.
## Card texts are the wireframe samples (T-06); the playground effects are
## fictitious (D-135). Not part of the game.
## Run: godot --path jogo res://scenes/dev/gallery.tscn
## Keys: PageDown / PageUp change page · H high contrast · M reduce motion · R rebuild.
## On the T-06 pages the card can be dragged or tapped; the HUD then plays
## the Animações timeline and the card comes back.

const HUD_SCENE := preload("res://scenes/components/hud.tscn")
const METER_SCENE := preload("res://scenes/components/meter_icon.tscn")
const SPEAKER_SCENE := preload("res://scenes/components/speaker_view.tscn")
const CARD_SCENE := preload("res://scenes/components/swipe_card.tscn")
const FOOTER_SCENE := preload("res://scenes/components/card_footer.tscn")

const PAGES: Array[StringName] = [
	&"t06_1", &"t06_2", &"t06_3", &"t06_9", &"t06_hc", &"t06_36",
	&"meters", &"cards_1", &"cards_2", &"cards_3", &"footer",
]
const PAGE_TITLES := {
	&"t06_1": "T-06.1 — carta parada",
	&"t06_2": "T-06.2 — arraste no limite, lado +1",
	&"t06_3": "T-06.3 — arraste no limite, lado −1",
	&"t06_9": "T-06.9 — opção revelada pelo 1º toque",
	&"t06_hc": "T-15.3 — alto contraste (P2), arrastando",
	&"t06_36": "T-15.6 — texto 36 px (P1) + faixa (P7)",
	&"meters": "C-01, C-02, C-08 — medidores",
	&"cards_1": "C-04, C-05 — dica e calibração",
	&"cards_2": "C-04, C-10 — foco e crise",
	&"cards_3": "C-04, C-10 — crise arrastando e 1º toque",
	&"footer": "C-03, C-07, C-19 — quem fala e rodapé",
}
## Initial values (gdd/GDD.md §13.1), same as the wireframes.
const HUD_START := {
	"dignity": 45, "awareness": 40, "sovereignty": 40, "security": 50,
	"integrity": 40, "treasury": 55, "political_capital": 50, "legitimacy": 55,
}
## Emulates the wireframes' default safe areas (gallery only).
const SAFE_TOP := 48
const SAFE_BOTTOM := 32
## Wireframe sample (T-06.1 to T-06.9).
const SAMPLE := {
	"speaker": "Congresso",
	"problem": "O Congresso analisa um projeto de privatização da estatal de energia. O relator quer mudar o texto para beneficiar uma empresa doadora.",
	"title": "Privatização da estatal",
	"footer": "Ano 1 · Lua de Mel · 3/7",
	"sides": {
		-1: {"text": "Nomear relator adversário", "color": "red"},
		1: {"text": "Aceitar as mudanças", "color": "orange"},
	},
}
## Fictitious playground effects (D-135). Side -1 = RM board example
## (Soberania 40 → 43 changes band; Capital Político 50 → 47).
const DEMO_DELTAS := {
	-1: {"sovereignty": 3, "political_capital": -3},
	1: {"integrity": -12, "treasury": 4, "legitimacy": -2},
}

var show_nav: bool = true:
	set(v):
		show_nav = v
		if is_node_ready():
			_nav.visible = v

var force_high_contrast: bool = false
var reduce_motion: bool = false

var _page_index := 0
var _refs: Dictionary = {}

@onready var _stage: Control = $Stage
@onready var _nav: Label = $Nav


func _ready() -> void:
	theme = ThemeBuilder.build()
	_nav.visible = show_nav
	show_page(PAGES[0])


func pages() -> Array[StringName]:
	return PAGES


## Nodes of the current T-06 page: {page, hud, speaker, card, footer}.
func current_refs() -> Dictionary:
	return _refs


func show_page(id: StringName) -> void:
	_page_index = maxi(PAGES.find(id), 0)
	_refs = {}
	for child in _stage.get_children():
		_stage.remove_child(child)
		child.queue_free()
	match id:
		&"t06_1":
			_build_t06(SAMPLE)
		&"t06_2":
			_build_t06(SAMPLE).card.preview_drag(1, Tokens.DRAG_LIMIT_DEFAULT)
		&"t06_3":
			_build_t06(SAMPLE).card.preview_drag(-1, Tokens.DRAG_LIMIT_DEFAULT)
		&"t06_9":
			_build_t06(SAMPLE).card.preview_tap(-1)
		&"t06_hc":
			var view := SAMPLE.duplicate(true)
			view.sides[-1].color = "purple"
			_build_t06(view, {"hc": true}).card.preview_drag(-1, Tokens.DRAG_LIMIT_DEFAULT)
		&"t06_36":
			var refs := _build_t06(SAMPLE, {"step": 36, "portrait": false, "problem_lines": 4, "band": true})
			refs.card.preview_drag(1, Tokens.DRAG_LIMIT_DEFAULT)
		&"meters":
			_build_meters()
		&"cards_1":
			_build_cards(1)
		&"cards_2":
			_build_cards(2)
		&"cards_3":
			_build_cards(3)
		&"footer":
			_build_footer()
	_nav.text = "%s  ·  %d/%d  ·  PgUp/PgDn H M R" % [PAGE_TITLES.get(id, String(id)), _page_index + 1, PAGES.size()]


func _unhandled_input(event: InputEvent) -> void:
	var key := event as InputEventKey
	if key == null or not key.pressed or key.echo:
		return
	match key.keycode:
		KEY_PAGEDOWN:
			show_page(PAGES[(_page_index + 1) % PAGES.size()])
		KEY_PAGEUP:
			show_page(PAGES[(_page_index - 1 + PAGES.size()) % PAGES.size()])
		KEY_H:
			force_high_contrast = not force_high_contrast
			show_page(PAGES[_page_index])
		KEY_M:
			reduce_motion = not reduce_motion
			show_page(PAGES[_page_index])
		KEY_R:
			show_page(PAGES[_page_index])
		_:
			return
	get_viewport().set_input_as_handled()


# --- T-06 composition (emulates the game screen; the real one is wave 2) -----

func _build_t06(view: Dictionary, opts: Dictionary = {}) -> Dictionary:
	var hc: bool = opts.get("hc", false) or force_high_contrast
	var page := _new_page(int(opts.get("step", Tokens.DEFAULT_STEP)), hc)
	var col := VBoxContainer.new()
	col.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	col.offset_top = SAFE_TOP + Tokens.ESP_8
	col.offset_bottom = -SAFE_BOTTOM
	col.add_theme_constant_override(&"separation", 0)
	page.add_child(col)

	var hud: Hud = HUD_SCENE.instantiate()
	hud.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	col.add_child(hud)
	hud.high_contrast = hc
	hud.set_values(view.get("values", HUD_START))
	_spacer(col, Tokens.ESP_16)

	var speaker: SpeakerView = SPEAKER_SCENE.instantiate()
	col.add_child(_pad_h(speaker))
	speaker.high_contrast = hc
	speaker.setup(String(view.speaker), bool(opts.get("portrait", true)))
	_spacer(col, Tokens.ESP_8)

	var problem := Label.new()
	problem.theme_type_variation = &"Body"
	problem.text = String(view.problem)
	problem.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	problem.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	if opts.has("problem_lines"):
		problem.max_lines_visible = int(opts.problem_lines)
	col.add_child(_pad_h(problem))

	var slot := MarginContainer.new()
	slot.size_flags_vertical = Control.SIZE_EXPAND_FILL
	slot.add_theme_constant_override(&"margin_top", Tokens.ESP_16)
	slot.add_theme_constant_override(&"margin_bottom", Tokens.ESP_16)
	col.add_child(slot)
	var card: SwipeCard = CARD_SCENE.instantiate()
	slot.add_child(card)
	card.high_contrast = hc
	card.reduce_motion = reduce_motion
	card.option_band = bool(opts.get("band", false))
	card.hint_enabled = false
	card.setup({
		"title": view.title, "sides": view.sides, "problem": view.problem,
		"mode": view.get("mode", &"normal"),
	})

	var footer: CardFooter = FOOTER_SCENE.instantiate()
	col.add_child(_pad_h(footer))
	footer.high_contrast = hc
	footer.set_text(String(view.footer))

	var refs := {"page": page, "hud": hud, "speaker": speaker, "card": card, "footer": footer}
	card.choice_confirmed.connect(_on_choice.bind(refs))
	card.exit_finished.connect(_on_exit.bind(refs))
	_refs = refs
	return refs


func _on_choice(side: int, refs: Dictionary) -> void:
	var hud: Hud = refs.hud
	var current := hud.values()
	var changes: Array = []
	var deltas: Dictionary = DEMO_DELTAS.get(side, {})
	for id in deltas:
		var old_v := int(current.get(id, 50))
		changes.append({"id": id, "old": old_v, "new": clampi(old_v + int(deltas[id]), 0, 100)})
	hud.apply_changes(changes, reduce_motion)


func _on_exit(_side: int, refs: Dictionary) -> void:
	await get_tree().create_timer(0.6).timeout
	var card: SwipeCard = refs.card
	if is_instance_valid(card):
		card.reset()
		card.play_enter()


# --- Meters page --------------------------------------------------------------

func _build_meters() -> void:
	var hc := force_high_contrast
	var page := _new_page(Tokens.DEFAULT_STEP, hc)
	var col := _scroll_column(page)
	_caption(col, "Faixas 1 a 5 (cores em revisão — TA)", true)
	var row := _row(col)
	for v in [10, 30, 50, 70, 90]:
		_meter_cell(row, "dignity", "faixa %d" % Tokens.band_of(v), hc).set_value(v)
	_caption(col, "Rastro (D-161), pontos (C-08), pulso, zero, número", true)
	row = _row(col)
	_meter_cell(row, "sovereignty", "40 a 43, ponto pequeno", hc).show_state(43, 40, &"small")
	_meter_cell(row, "treasury", "64 a 41, ponto grande", hc).show_state(41, 64, &"big")
	_meter_cell(row, "sovereignty", "troca de faixa (pulso)", hc).show_state(43, 40, &"", true)
	_meter_cell(row, "legitimacy", "0 (estilhaçado)", hc).set_value(0)
	var numbered := _meter_cell(row, "integrity", "número (só T-10)", hc)
	numbered.show_number = true
	numbered.set_value(55)

	_caption(col, "HUD inicial (C-02)", true)
	_hud_row(col, hc).set_values(HUD_START)
	var after := HUD_START.duplicate()
	after.sovereignty = 43
	after.political_capital = 47
	_caption(col, "T-07.1 — preenchendo, com rastro e pontos", true)
	_hud_row(col, hc).show_state(after, {"sovereignty": 40, "political_capital": 50},
		{"sovereignty": &"small", "political_capital": &"small"})
	_caption(col, "T-07.2 — troca de faixa com pulso", true)
	_hud_row(col, hc).show_state(after, {}, {}, "sovereignty")

	_caption(col, "Alto contraste (P2)", true)
	var dark := PanelContainer.new()
	var dark_box := StyleBoxFlat.new()
	dark_box.bg_color = Tokens.HC_BG
	dark_box.set_content_margin_all(Tokens.ESP_8)
	dark.add_theme_stylebox_override(&"panel", dark_box)
	col.add_child(dark)
	var dark_col := VBoxContainer.new()
	dark_col.add_theme_constant_override(&"separation", Tokens.ESP_8)
	dark.add_child(dark_col)
	var hud_hc: Hud = HUD_SCENE.instantiate()
	hud_hc.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	dark_col.add_child(hud_hc)
	hud_hc.high_contrast = true
	hud_hc.show_state(after, {"sovereignty": 40, "political_capital": 50},
		{"sovereignty": &"small", "political_capital": &"big"})


func _hud_row(col: Control, hc: bool) -> Hud:
	var hud: Hud = HUD_SCENE.instantiate()
	hud.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	col.add_child(hud)
	hud.high_contrast = hc
	return hud


func _meter_cell(row: Control, id: String, caption: String, hc: bool) -> MeterIcon:
	var cell := VBoxContainer.new()
	cell.custom_minimum_size = Vector2(62, 0)
	cell.add_theme_constant_override(&"separation", Tokens.ESP_4)
	row.add_child(cell)
	var meter: MeterIcon = METER_SCENE.instantiate()
	meter.meter_id = id
	meter.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	cell.add_child(meter)
	meter.high_contrast = hc
	var label := Label.new()
	label.theme_type_variation = &"Caption"
	label.text = caption
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	label.custom_minimum_size = Vector2(62, 0)
	label.add_theme_font_size_override(&"font_size", 12)
	cell.add_child(label)
	return meter


# --- Card variants page -------------------------------------------------------

func _build_cards(part: int) -> void:
	var hc := force_high_contrast
	var page := _new_page(Tokens.DEFAULT_STEP, hc)
	var col := _scroll_column(page)
	var calib := {
		"title": "[pergunta — a definir]", "mode": &"calibration",
		"sides": {-1: {"text": "[resposta A]", "color": ""}, 1: {"text": "[resposta B]", "color": ""}},
	}
	var crisis := {
		"title": "Pedido de impeachment", "mode": &"crisis",
		"sides": {-1: {"text": "[opção — a definir]", "color": "purple"}, 1: {"text": "[opção — a definir]", "color": "blue"}},
	}
	match part:
		1:
			_card_cell(col, "parada + dica do toque (D-163, texto e tempo a definir)", SAMPLE, hc).preview_hint()
			_card_cell(col, "calibração arrastando: só filete branco (D-166)", calib, hc).preview_drag(1, 0.25)
		2:
			_card_cell(col, "foco do teclado (PC): anel 3 px, afastamento 4", SAMPLE, hc).grab_focus.call_deferred()
			_card_cell(col, "crise parada: moldura hachurada (C-10)", crisis, hc)
		_:
			_card_cell(col, "crise arrastando, lado −1", crisis, hc).preview_drag(-1, 0.25)
			_card_cell(col, "1º toque na metade +1 (D-145)", SAMPLE, hc).preview_tap(1)


func _card_cell(col: Control, caption: String, view: Dictionary, hc: bool) -> SwipeCard:
	var label := Label.new()
	label.theme_type_variation = &"Caption"
	label.text = caption
	label.add_theme_font_size_override(&"font_size", 13)
	col.add_child(label)
	var slot := Control.new()
	slot.custom_minimum_size = Vector2(0, Tokens.CARD_MAX.y + Tokens.ESP_24)
	slot.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.add_child(slot)
	var card: SwipeCard = CARD_SCENE.instantiate()
	slot.add_child(card)
	card.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	card.offset_top = Tokens.ESP_12
	card.offset_bottom = -Tokens.ESP_12
	card.high_contrast = hc
	card.hint_enabled = false
	card.setup({"title": view.title, "sides": view.sides, "mode": view.get("mode", &"normal")})
	return card


# --- Speaker + footer page ----------------------------------------------------

func _build_footer() -> void:
	var hc := force_high_contrast
	var page := _new_page(Tokens.DEFAULT_STEP, hc)
	var col := _scroll_column(page)
	_caption(col, "C-03 — quem fala (silhueta genérica, D-142); sem retrato (P1)", true)
	var grid := GridContainer.new()
	grid.columns = 2
	grid.add_theme_constant_override(&"h_separation", Tokens.ESP_8)
	col.add_child(grid)
	for args in [["Congresso", true], ["", true], ["Latifundiários", false]]:
		var speaker: SpeakerView = SPEAKER_SCENE.instantiate()
		speaker.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		grid.add_child(speaker)
		speaker.high_contrast = hc
		speaker.setup(String(args[0]), bool(args[1]))

	_caption(col, "C-07 — rodapé, 18 px", true)
	_footer(col, hc).set_text("Ano 1 · Lua de Mel · 3/7")
	_caption(col, "C-07 — pausa com foco (PC)", true)
	var focused := _footer(col, hc)
	focused.set_text("Ano 1 · Lua de Mel · 3/7")
	focused.pause_button().grab_focus.call_deferred()
	_caption(col, "C-07 — 24 px, pior caso (2 linhas, D21)", true)
	var big := _footer(col, hc, 24)
	big.set_text("Ano 2 · Realidade Bate · 7/7")
	_caption(col, "C-19 — progresso da calibração", true)
	_footer(col, hc).set_progress(3, 6)

	_caption(col, "Alto contraste (P2)", true)
	var dark := PanelContainer.new()
	dark.theme = ThemeBuilder.build(Tokens.DEFAULT_STEP, true)
	var dark_box := StyleBoxFlat.new()
	dark_box.bg_color = Tokens.HC_BG
	dark_box.set_content_margin_all(Tokens.ESP_8)
	dark.add_theme_stylebox_override(&"panel", dark_box)
	col.add_child(dark)
	var dark_col := VBoxContainer.new()
	dark.add_child(dark_col)
	var speaker_hc: SpeakerView = SPEAKER_SCENE.instantiate()
	dark_col.add_child(speaker_hc)
	speaker_hc.high_contrast = true
	speaker_hc.setup("Congresso")
	var footer_hc: CardFooter = FOOTER_SCENE.instantiate()
	dark_col.add_child(footer_hc)
	footer_hc.high_contrast = true
	footer_hc.set_progress(3, 6)


func _footer(col: Control, hc: bool, step: int = Tokens.DEFAULT_STEP) -> CardFooter:
	var footer: CardFooter = FOOTER_SCENE.instantiate()
	if step != Tokens.DEFAULT_STEP:
		footer.theme = ThemeBuilder.build(step, hc)
	col.add_child(footer)
	footer.high_contrast = hc
	return footer


# --- Helpers ------------------------------------------------------------------

func _new_page(step: int, hc: bool) -> Control:
	var page := Control.new()
	page.theme = ThemeBuilder.build(step, hc)
	_stage.add_child(page)
	page.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	var bg := ColorRect.new()
	bg.color = Tokens.HC_BG if hc else Tokens.BG
	bg.mouse_filter = Control.MOUSE_FILTER_IGNORE
	page.add_child(bg)
	bg.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	return page


## Column for the kit pages: margins esp-24, scrolls if taller than the screen.
func _scroll_column(page: Control) -> VBoxContainer:
	var scroll := ScrollContainer.new()
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	page.add_child(scroll)
	scroll.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	scroll.offset_top = Tokens.ESP_24
	scroll.offset_bottom = -Tokens.ESP_24
	var pad := MarginContainer.new()
	pad.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	for side in [&"margin_left", &"margin_right"]:
		pad.add_theme_constant_override(side, Tokens.ESP_24)
	scroll.add_child(pad)
	var col := VBoxContainer.new()
	col.add_theme_constant_override(&"separation", Tokens.ESP_8)
	pad.add_child(col)
	return col


func _row(col: Control) -> HBoxContainer:
	var row := HBoxContainer.new()
	row.add_theme_constant_override(&"separation", Tokens.ESP_4)
	col.add_child(row)
	return row


func _caption(col: Control, text: String, strong: bool = false) -> void:
	var label := Label.new()
	label.theme_type_variation = &"Option" if strong else &"Caption"
	label.text = text
	label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	label.add_theme_font_size_override(&"font_size", 14)
	col.add_child(label)


func _pad_h(child: Control) -> MarginContainer:
	var pad := MarginContainer.new()
	pad.add_theme_constant_override(&"margin_left", Tokens.ESP_24)
	pad.add_theme_constant_override(&"margin_right", Tokens.ESP_24)
	pad.add_child(child)
	return pad


func _spacer(col: Control, height: int) -> void:
	var gap := Control.new()
	gap.custom_minimum_size = Vector2(0, height)
	gap.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(gap)
