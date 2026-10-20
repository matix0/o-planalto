class_name ContentWarnings
extends VBoxContainer
## C-18 — avisos de conteúdo da tela inicial (14A §14A.03 C-18; gdd/GDD.md:762 §14.3).
## Etiquetas sóbrias (só contorno, sem ícone de alerta), informativas e não focáveis.
## O grupo tem accessibility_name com a lista, lido antes dos botões de T-01.
## Divergência: docs/16 §16.13 lista outros avisos; usado o GDD §14.3, igual ao 14A.

const TITLE := "Avisos de conteúdo"
const DEFAULT_WARNINGS: Array[String] = ["Genocídio", "Tortura", "Violência policial", "Linguagem direta"]

@onready var _title: Label = %Title
@onready var _tags: HFlowContainer = %Tags

var _items: Array[String] = []


func _ready() -> void:
	_title.text = TITLE
	set_warnings(DEFAULT_WARNINGS)


func set_warnings(items: Array[String]) -> void:
	_items = items.duplicate()
	for child in _tags.get_children():
		_tags.remove_child(child)
		child.queue_free()
	for text in _items:
		var tag := PanelContainer.new()
		tag.theme_type_variation = &"Tag"
		tag.mouse_filter = Control.MOUSE_FILTER_IGNORE
		var label := Label.new()
		label.theme_type_variation = &"Caption"
		label.add_theme_color_override(&"font_color", Tokens.TEXT)   # tag text is white (C-18)
		label.text = text
		label.mouse_filter = Control.MOUSE_FILTER_IGNORE
		tag.add_child(label)
		_tags.add_child(tag)
	accessibility_name = "%s: %s" % [TITLE, ", ".join(_items)]


func warnings() -> Array[String]:
	return _items.duplicate()
