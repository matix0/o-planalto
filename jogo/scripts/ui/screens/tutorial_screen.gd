extends AppScreen
## T-02 — tutorial em 4 passos (14A §14A.02 T-02.1 a T-02.4; docs/16 Parte B).
## Camada escurecida sobre uma tela de jogo de demonstração (inerte), com
## destaque no elemento explicado. Textos aprovados pelo PO, sem alteração:
## docs/16_MANUAL_DO_JOGADOR.md:382-385. Conteúdo de exemplo (carta, problema,
## folha) = [a definir]. Avança só pelo botão (gesto na carta: [a definir]).
## Sem pausa: o tutorial não é estado do gdd 10 §3.1. Ao terminar, grava
## "tutorial visto" (gdd 10 §3.5) e abre a calibração.
## HUD: o componente C-02 do lote B (hud.tscn), carregado se existir.

const STEPS := [
	{
		"text": "Você é o Presidente. Cada carta traz um problema. Arraste para um lado ou para o outro para decidir.",
		"target": &"card", "coach": &"top", "margin": 4, "radius": 20,
	},
	{
		"text": "No topo estão os 8 medidores do país. Se um deles zerar, seu mandato acaba na hora.",
		"target": &"hud", "coach": &"bottom", "margin": 8, "radius": 16,
	},
	{
		"text": "Depois de decidir, pontos mostram quais medidores mudaram. Toda escolha tem custo.",
		"target": &"hud", "coach": &"bottom", "margin": 8, "radius": 16, "effects": true,
	},
	{
		"text": "Depois de cada decisão, a Carta de Aprendizado explica o que está por trás. Toque em 'saiba mais' para ver dados e fontes.",
		"target": &"more", "coach": &"top", "margin": 4, "radius": 16, "sheet": true,
	},
]
const ADVANCE_TEXT := "Avançar"
const START_TEXT := "Começar"     # last step (P-017)
const CARD_TEXT := "Privatização da estatal"
const SPEAKER_TEXT := "Congresso Nacional"
const PROBLEM_TEXT := "O Congresso analisa um projeto de privatização da estatal de energia. O relator quer mudar o texto para beneficiar uma empresa doadora."
const SHEET_TITLE := "Privatização da estatal"
const SHEET_TEXT := "O relator tem poder de alterar o texto de um projeto. Isso se chama \"poder de agenda\"."
const SHEET_MORE := "Saiba mais"
const SHEET_MORE_TEXT := "Aqui aparecem o dado real e o link da fonte de cada carta."
const SHEET_CONTINUE := "Continuar"
## Step 2: the 8 meter names under the approved text (P-017; the approved text is unchanged).
const METER_LIST := "Sociais: Dignidade, Consciência, Soberania, Segurança, Integridade.\nPoder: Caixa, Capital Político, Legitimidade.\nToque em um medidor para ver o que ele mede."
## Step 3 illustration: effects of option B of INST-001, no multiplier
## (docs/17_ROTEIRO_DAS_CARTAS.md:71; T-02.3 — real tutorial example [a definir]).
const EXAMPLE_EFFECTS := {"political_capital": 10, "sovereignty": -10, "treasury": 10, "integrity": -5}
const SMALL_DOT_MAX := 10           # docs/14 §14.05: up to 10 = small dot
const STEP_FADE := 0.2              # A-28: 200 ms (half out, half in); Reduzir movimento: igual
const HUD_SCENE := "res://scenes/components/hud.tscn"   # C-02 (lote B)
const CARD_RATIO := Tokens.CARD_RATIO
const DIM_ALPHA := 0.62

@onready var _board_area: MarginContainer = %BoardArea
@onready var _hud_slot: CenterContainer = %HudSlot
@onready var _card_slot: Control = %CardSlot
@onready var _card: PanelContainer = %Card
@onready var _sheet: PanelContainer = %Sheet
@onready var _sheet_pad: Control = %SheetPad
@onready var _more: FoldableContainer = %More
@onready var _dim: ColorRect = %Dim
@onready var _spotlight: Panel = %Spotlight
@onready var _coach_area: MarginContainer = %CoachArea
@onready var _coach_box: VBoxContainer = %CoachBox
@onready var _coach: PanelContainer = %CoachPanel
@onready var _progress: ProgressIndicator = %Progress
@onready var _coach_text: Label = %CoachText
@onready var _advance: Button = %AdvanceButton

var _hud: Control
var _step := 0
var _changing := false
var _layout_queued := false


func _ready() -> void:
	%CardTitle.text = CARD_TEXT
	%SpeakerName.text = SPEAKER_TEXT
	%Problem.text = PROBLEM_TEXT
	%SheetTitle.text = SHEET_TITLE
	%SheetText.text = SHEET_TEXT
	%MoreText.text = SHEET_MORE_TEXT
	%SheetContinue.text = SHEET_CONTINUE
	_more.title = SHEET_MORE
	_advance.text = ADVANCE_TEXT
	_coach_text.accessibility_live = AccessibilityServer.LIVE_POLITE
	_progress.setup(STEPS.size(), ProgressIndicator.Surface.PANEL, &"step")
	_dim.color = Color(0, 0, 0, DIM_ALPHA)
	_hud = _make_hud()
	_hud_slot.add_child(_hud)
	_advance.pressed.connect(advance)
	for node: Control in [self, _card_slot, _card, _hud, _more, _coach]:
		node.resized.connect(_queue_layout)
	# The card sits in a plain Control: when its wrapped title settles, fit it again.
	_card.minimum_size_changed.connect(_queue_layout)
	_more.mouse_filter = Control.MOUSE_FILTER_IGNORE   # "Saiba mais" is out of focus in the tutorial [a definir]
	_more.focus_mode = Control.FOCUS_NONE
	_more.title_text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	_style_overlay()


func enter(params: Dictionary = {}) -> void:
	if params.get("returned", false):
		return
	_show_step(0)
	focus_first(_advance)


func _apply_safe_area() -> void:
	fit_margins(_board_area, Tokens.ESP_8, 0.0)   # like T-06
	_coach_area.add_theme_constant_override(&"margin_top", int(safe_top + Tokens.ESP_8))
	_coach_area.add_theme_constant_override(&"margin_bottom", int(safe_bottom + Tokens.ESP_16))
	_coach_area.add_theme_constant_override(&"margin_left", Tokens.ESP_16)
	_coach_area.add_theme_constant_override(&"margin_right", Tokens.ESP_16)
	_sheet_pad.custom_minimum_size.y = safe_bottom
	_queue_layout()


func _notification(what: int) -> void:
	if what == NOTIFICATION_THEME_CHANGED and is_node_ready():
		_style_overlay()
		_queue_layout()


## 1-based step shown now.
func step() -> int:
	return _step + 1


func coach_text() -> String:
	return _coach_text.text


func progress() -> ProgressIndicator:
	return _progress


## Highlighted rect in this screen's local coordinates.
func spotlight_rect() -> Rect2:
	return Rect2(_spotlight.position, _spotlight.size)


func coach_on_top() -> bool:
	return _coach_box.alignment == BoxContainer.ALIGNMENT_BEGIN


func advance() -> void:
	if _changing:
		return
	if _step >= STEPS.size() - 1:
		_changing = true   # one request only, even with a double tap
		Settings.set_value(&"tutorial_seen", true)
		request.emit(&"calibration", {})
		return
	_changing = true
	var half := STEP_FADE * 0.5
	if is_inside_tree():
		var out := create_tween().set_parallel(true).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
		for node: CanvasItem in [_coach_area, _spotlight]:
			out.tween_property(node, "modulate:a", 0.0, half)
		await out.finished
	_show_step(_step + 1)
	if is_inside_tree():
		var back := create_tween().set_parallel(true).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
		for node: CanvasItem in [_coach_area, _spotlight]:
			back.tween_property(node, "modulate:a", 1.0, half)
	_changing = false
	focus_first(_advance)


func _show_step(i: int) -> void:
	_step = i
	var s: Dictionary = STEPS[i]
	_coach_text.text = s["text"]
	_meter_list().visible = s["target"] == &"hud" and not s.get("effects", false)
	_progress.set_current(i + 1)
	_advance.text = START_TEXT if i == STEPS.size() - 1 else ADVANCE_TEXT
	_coach_box.alignment = BoxContainer.ALIGNMENT_BEGIN if s["coach"] == &"top" else BoxContainer.ALIGNMENT_END
	var show_sheet: bool = s.get("sheet", false)
	if show_sheet and not _sheet.visible and is_inside_tree():
		# A-12 (sheet up 300 ms) reduced to a short fade inside the step change (a validar).
		_sheet.modulate.a = 0.0
		create_tween().tween_property(_sheet, "modulate:a", 1.0, STEP_FADE * 0.5)
	_sheet.visible = show_sheet
	_show_meters(s.get("effects", false))
	_queue_layout()


func _meter_list() -> Label:
	var label := _coach_text.get_parent().get_node_or_null(^"MeterList") as Label
	if label == null:
		label = Label.new()
		label.name = "MeterList"
		label.theme_type_variation = &"Caption"
		label.text = METER_LIST
		label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		_coach_text.add_sibling(label)
	return label


## Steps 1, 2 and 4: initial levels (gdd/GDD.md §13.1 via GameData). Step 3:
## new levels with the trail of the old ones and dots without direction (D-156, D-161).
func _show_meters(effects: bool) -> void:
	if not _hud.has_method(&"show_state"):
		return
	var initial := {}
	for m: Dictionary in GameData.meters:
		initial[String(m.get("id", ""))] = int(m.get("initial", 50))
	if not effects:
		_hud.call(&"show_state", initial, {}, {}, "")
		return
	var after := initial.duplicate()
	var dots := {}
	var pulse := ""
	for id: String in EXAMPLE_EFFECTS:
		var old_v: int = initial.get(id, 50)
		var new_v: int = clampi(old_v + int(EXAMPLE_EFFECTS[id]), 0, 100)
		after[id] = new_v
		dots[id] = &"small" if absi(new_v - old_v) <= SMALL_DOT_MAX else &"big"
		if Tokens.band_of(new_v) != Tokens.band_of(old_v):
			pulse = id   # T-02.3: Caixa changes band (A-09)
	_hud.call(&"show_state", after, initial, dots, pulse)


func _make_hud() -> Control:
	if ResourceLoader.exists(HUD_SCENE):
		var node := (load(HUD_SCENE) as PackedScene).instantiate() as Control
		if node:
			if &"high_contrast" in node:
				node.set(&"high_contrast", Settings.high_contrast)
			return node
	var fallback := PanelContainer.new()
	fallback.theme_type_variation = &"Well"
	fallback.custom_minimum_size = Tokens.HUD_SIZE
	var label := Label.new()
	label.theme_type_variation = &"Caption"
	label.text = ""
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	fallback.add_child(label)
	return fallback


func _style_overlay() -> void:
	var hc: bool = Settings.high_contrast
	var coach := StyleBoxFlat.new()
	coach.bg_color = Tokens.HC_BG if hc else Tokens.CARD
	coach.set_border_width_all(2 if hc else 1)
	coach.border_color = Tokens.TEXT if hc else Tokens.OUTLINE
	coach.set_corner_radius_all(Tokens.RADIUS_16)
	coach.set_content_margin_all(Tokens.ESP_16)
	coach.anti_aliasing = true
	_coach.add_theme_stylebox_override(&"panel", coach)
	AppScreen.style_foldable(_more)
	if _hud and &"high_contrast" in _hud:
		_hud.set(&"high_contrast", hc)


func _queue_layout() -> void:
	if _layout_queued or not is_inside_tree():
		return
	_layout_queued = true
	_layout.call_deferred()


func _layout() -> void:
	_layout_queued = false
	if not is_inside_tree():
		return
	_fit_card()
	# The dim covers the whole window, including the PC sides and the safe areas.
	var origin := get_global_rect().position
	_dim.position = -origin
	_dim.size = get_viewport_rect().size
	var s: Dictionary = STEPS[_step]
	var target := _target_rect(s["target"]).grow(float(s["margin"]))
	var radius := float(s["radius"])
	var mat := _dim.material as ShaderMaterial
	if mat:
		mat.set_shader_parameter(&"hole_rect", Vector4(target.position.x + origin.x, target.position.y + origin.y, target.size.x, target.size.y))
		mat.set_shader_parameter(&"hole_radius", radius)
	_spotlight.position = target.position
	_spotlight.size = target.size
	var ring := StyleBoxFlat.new()
	ring.draw_center = false
	ring.set_border_width_all(Tokens.ESP_2)
	ring.border_color = Tokens.TEXT
	ring.set_corner_radius_all(int(radius))
	ring.anti_aliasing = true
	_spotlight.add_theme_stylebox_override(&"panel", ring)
	# T-02: the coach panel must not cover the highlight; if it does, it moves to the other side.
	var preferred := BoxContainer.ALIGNMENT_BEGIN if s["coach"] == &"top" else BoxContainer.ALIGNMENT_END
	_coach_box.alignment = preferred
	var coach_rect := _coach_rect_for(preferred)
	if coach_rect.intersects(target):
		var other := BoxContainer.ALIGNMENT_END if preferred == BoxContainer.ALIGNMENT_BEGIN else BoxContainer.ALIGNMENT_BEGIN
		if not _coach_rect_for(other).intersects(target):
			_coach_box.alignment = other


## Card: 5:6, ceiling 280×336 (C-05), centered in the slot with esp-16 above and below.
func _fit_card() -> void:
	var avail := _card_slot.size - Vector2(0, Tokens.ESP_16 * 2)
	var w := minf(minf(avail.x, Tokens.CARD_MAX.x), avail.y * CARD_RATIO)
	w = maxf(w, 0.0)
	var card_size := Vector2(w, w / CARD_RATIO)
	_card.size = card_size
	_card.position = Vector2((_card_slot.size.x - card_size.x) * 0.5, (_card_slot.size.y - card_size.y) * 0.5)


func _target_rect(target: StringName) -> Rect2:
	var node: Control = _card
	match target:
		&"hud":
			node = _hud
		&"more":
			node = _more
	var r := node.get_global_rect()
	r.position -= get_global_rect().position
	return r


## Rect the coach panel takes with this alignment, in local coordinates.
func _coach_rect_for(alignment: int) -> Rect2:
	var h := _coach.get_combined_minimum_size().y
	var top := float(_coach_area.get_theme_constant(&"margin_top"))
	var bottom := float(_coach_area.get_theme_constant(&"margin_bottom"))
	var left := float(_coach_area.get_theme_constant(&"margin_left"))
	var w := size.x - left - float(_coach_area.get_theme_constant(&"margin_right"))
	var y := top if alignment == BoxContainer.ALIGNMENT_BEGIN else size.y - bottom - h
	return Rect2(left, y, w, h)
