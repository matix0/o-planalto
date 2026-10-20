class_name ProgressIndicator
extends HBoxContainer
## C-19 — indicador de progresso "n/N" + segmentos (14A §14A.03 C-19).
## Tutorial 1/4..4/4 no painel (T-02) · calibração 1/6..6/6 no rodapé (T-03).
## Ordem unificada: "n/N" ANTES dos segmentos (pendência do C-19 resolvida no canvas).
## Segmento 16×4, pílula, sep 4: feito = branco; a fazer = #78909C no fundo ou
## contorno 1 px #90A4AE no painel. A cor não é a única pista: o texto acompanha.

enum Surface { BACKGROUND, PANEL }

## Leitor de tela (texto a validar): "Passo n de 4" / "Pergunta n de 6".
const NAME_FORMATS := {
	&"step": "Passo %d de %d",
	&"question": "Pergunta %d de %d",
}

@export var total: int = 4:
	set(v):
		total = maxi(1, v)
		if is_node_ready():
			_rebuild()
@export var current: int = 1:
	set(v):
		current = clampi(v, 0, total)
		if is_node_ready():
			_refresh()
@export var surface: Surface = Surface.PANEL:
	set(v):
		surface = v
		if is_node_ready():
			_rebuild()
@export var kind: StringName = &"step"

@onready var _count: Label = %Count
@onready var _segments: HBoxContainer = %Segments


func _ready() -> void:
	accessibility_live = AccessibilityServer.LIVE_POLITE
	_rebuild()


func setup(new_total: int, new_surface: Surface, new_kind: StringName = &"step") -> void:
	kind = new_kind
	surface = new_surface
	total = new_total
	_rebuild()


func set_current(n: int) -> void:
	current = n


func count_text() -> String:
	return "%d/%d" % [current, total]


func _notification(what: int) -> void:
	if what == NOTIFICATION_THEME_CHANGED and is_node_ready():
		_refresh()


func _rebuild() -> void:
	for child in _segments.get_children():
		_segments.remove_child(child)
		child.queue_free()
	for i in total:
		var seg := Panel.new()
		seg.custom_minimum_size = Vector2(Tokens.ESP_16, Tokens.ESP_4)
		seg.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		seg.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_segments.add_child(seg)
	_count.theme_type_variation = &"Caption" if surface == Surface.PANEL else &"Footer"
	_refresh()


func _refresh() -> void:
	_count.text = count_text()
	var fmt: String = NAME_FORMATS.get(kind, NAME_FORMATS[&"step"])
	accessibility_name = fmt % [current, total]
	var hc: bool = Settings.high_contrast
	var i := 0
	for seg: Panel in _segments.get_children():
		seg.add_theme_stylebox_override(&"panel", _segment_box(i < current, hc))
		i += 1


func _segment_box(done: bool, hc: bool) -> StyleBoxFlat:
	var sb := StyleBoxFlat.new()
	sb.set_corner_radius_all(Tokens.ESP_2)
	sb.anti_aliasing = true
	if done:
		sb.bg_color = Tokens.TEXT
	elif surface == Surface.BACKGROUND and not hc:
		sb.bg_color = Tokens.INACTIVE
	else:
		sb.draw_center = false
		sb.set_border_width_all(1)
		sb.border_color = Tokens.TEXT if hc else Tokens.OUTLINE
	return sb
