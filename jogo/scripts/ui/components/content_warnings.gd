class_name ContentWarnings
extends VBoxContainer
## C-18 — avisos de conteúdo da tela inicial (14A §14A.03 C-18; gdd/GDD.md:762 §14.3).
## Etiquetas sóbrias (só contorno, sem ícone de alerta), informativas e não focáveis.
## O grupo tem accessibility_name com a lista e a frase de apoio, lido antes dos botões
## de T-01. Lista unificada (D-190, gdd/GDD.md §14.3 = docs/16 §16.13; DP-008, provisória).

const TITLE := "Avisos de conteúdo"
const DEFAULT_WARNINGS: Array[String] = ["Violência policial", "Racismo", "Genocídio", "Ditadura e tortura", "Nazifascismo", "Políticos reais"]
const SUPPORT_TEXT := "O jogo fala de fome e morte sem eufemismo."

@onready var _title: Label = %Title
@onready var _tags: HFlowContainer = %Tags
@onready var _support: Label = %Support

var _items: Array[String] = []


func _ready() -> void:
	_title.text = TITLE
	_support.text = SUPPORT_TEXT
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
	accessibility_name = "%s: %s. %s" % [TITLE, ", ".join(_items), SUPPORT_TEXT]


func warnings() -> Array[String]:
	return _items.duplicate()
