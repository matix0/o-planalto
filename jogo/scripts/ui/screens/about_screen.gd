extends AppScreen
## T-13 — Sobre (14A §14A.02 T-13.1; docs/14 §14.12; D-140).
## Créditos: docs/16_MANUAL_DO_JOGADOR.md:353 (§16.15). Fontes Poppins e Inter
## (Google Fonts, OFL 1.1): aviso de licença lido de assets/fonts/OFL-*.txt (D-140).
## Ícones provisórios do protótipo (assets/icons/README.md). Lista de assets e
## aviso de licença do Godot (MIT): [a definir] — não citados no repo.

const TITLE := "Sobre"
const CLOSE_NAME := "Fechar"        # a validar — rótulo do botão de fechar [a definir] (T-12/T-13)
const CREDITS := [
	["Idealização", "Mateus"],
	["Design", "Mateus"],
	["Pesquisa", "Mateus"],
	["Validação Pedagógica", "Professor interlocutor"],
	["Revisão Crítica", "Professor Alisson"],
	["Engine", "Godot 4.7"],
]
const ROLE_COLUMN := 168            # T-13.1: coluna da função
const ASSETS_TEXT := "Kenney (CC0) e outros"
const ICONS_TEXT := "Ícones provisórios do protótipo; os definitivos serão CC0."   # assets/icons/README.md, D-140
const ASSETS_TODO := "[lista de assets e licenças — a definir]"
const FONTS_TEXT := "Poppins e Inter — Google Fonts, licença OFL"
const FONT_LICENSES := [
	["Inter", "res://assets/fonts/OFL-Inter.txt"],
	["Poppins", "res://assets/fonts/OFL-Poppins.txt"],
]
const GODOT_TODO := "[aviso de licença do Godot (MIT) — a definir]"

@onready var _safe_area: MarginContainer = %SafeArea
@onready var _close: Button = %CloseButton
@onready var _grid: GridContainer = %CreditsGrid
@onready var _fonts_box: VBoxContainer = %FontsBox

var _folds: Array[FoldableContainer] = []


func _ready() -> void:
	%Title.text = TITLE
	%AssetsText.text = ASSETS_TEXT
	%IconsText.text = ICONS_TEXT
	%AssetsTodo.text = ASSETS_TODO
	%FontsText.text = FONTS_TEXT
	%GodotTodo.text = GODOT_TODO
	_close.accessibility_name = CLOSE_NAME
	_close.tooltip_text = CLOSE_NAME
	_close.pressed.connect(close)
	_build_credits()
	_build_font_licenses()


func enter(params: Dictionary = {}) -> void:
	if not params.get("returned", false):
		focus_first(_close)


func handle_cancel() -> bool:
	close()
	return true


func close() -> void:
	request.emit(&"back", {})


func _apply_safe_area() -> void:
	fit_margins(_safe_area, Tokens.ESP_8, 0.0)


func _notification(what: int) -> void:
	if what == NOTIFICATION_THEME_CHANGED and is_node_ready():
		_style_folds()


func _build_credits() -> void:
	for pair: Array in CREDITS:
		var role := Label.new()
		role.theme_type_variation = &"Caption"
		role.text = pair[0]
		role.custom_minimum_size.x = ROLE_COLUMN
		role.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		var person := Label.new()
		person.theme_type_variation = &"Body"
		person.text = pair[1]
		person.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		person.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		_grid.add_child(role)
		_grid.add_child(person)


## One folded block per font with the copyright line and the full OFL 1.1 text.
func _build_font_licenses() -> void:
	for item: Array in FONT_LICENSES:
		var text := FileAccess.get_file_as_string(item[1])
		var first_line := text.get_slice("\n", 0).strip_edges()
		var copyright := Label.new()
		copyright.theme_type_variation = &"Caption"
		copyright.text = first_line if first_line != "" else "[aviso de licença — a definir]"
		copyright.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		_fonts_box.add_child(copyright)
		var fold := FoldableContainer.new()
		fold.title = "Licença OFL 1.1 — %s" % item[0]
		# The title does not wrap: trim it instead of widening the column (24 px, +30 %).
		fold.title_text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
		fold.folded = true
		var body := Label.new()
		body.theme_type_variation = &"Caption"
		body.text = text.strip_edges() if text != "" else "[texto da licença — a definir]"
		body.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		fold.add_child(body)
		_fonts_box.add_child(fold)
		_folds.append(fold)
	_style_folds()


func _style_folds() -> void:
	for fold in _folds:
		AppScreen.style_foldable(fold)


func folds() -> Array[FoldableContainer]:
	return _folds.duplicate()
