extends AppScreen
## T-13 — Sobre (14A §14A.02 T-13.1; docs/14 §14.12; D-140).
## Créditos: docs/16_MANUAL_DO_JOGADOR.md:353 (§16.15). Fontes Poppins e Inter
## (Google Fonts, OFL 1.1): aviso de licença lido de assets/fonts/OFL-*.txt (D-140).
## D-188: lista real dos assets (ASSETS; tests/test_shell.gd confere que todo arquivo de
## assets/ está num grupo) e aviso de licença do Godot por Engine.get_license_text(), com os
## componentes de terceiros do Godot por Engine.get_copyright_info() (docs do Godot,
## "Complying with licenses": https://docs.godotengine.org/en/stable/about/complying_with_licenses.html).

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
## Real asset list (D-188): one line per group; `files` are globs under res://assets/.
const ASSETS := [
	{
		"text": "Ícones e retrato: provisórios, desenhados para o protótipo; os definitivos serão CC0.",
		"files": ["icons/*.svg"],   # assets/icons/README.md, D-140
	},
	{
		"text": "Fontes Poppins e Inter: Google Fonts, licença OFL 1.1 (textos abaixo).",
		"files": ["fonts/*.ttf", "fonts/OFL-*.txt"],
	},
]
const FONTS_TEXT := "Poppins e Inter — Google Fonts, licença OFL"
const FONT_LICENSES := [
	["Inter", "res://assets/fonts/OFL-Inter.txt"],
	["Poppins", "res://assets/fonts/OFL-Poppins.txt"],
]
const GODOT_TEXT := "Feito com o Godot Engine, licença MIT. O Godot inclui componentes de terceiros, cada um com a sua licença."
const GODOT_LICENSE_TITLE := "Licença MIT — Godot Engine"
const THIRD_PARTY_TITLE := "Componentes de terceiros"

@onready var _safe_area: MarginContainer = %SafeArea
@onready var _close: Button = %CloseButton
@onready var _grid: GridContainer = %CreditsGrid
@onready var _fonts_box: VBoxContainer = %FontsBox
@onready var _assets_list: VBoxContainer = %AssetsList
@onready var _godot_box: VBoxContainer = %GodotBox

var _folds: Array[FoldableContainer] = []


func _ready() -> void:
	%Title.text = TITLE
	%FontsText.text = FONTS_TEXT
	%GodotText.text = GODOT_TEXT
	_close.accessibility_name = CLOSE_NAME
	_close.tooltip_text = CLOSE_NAME
	_close.pressed.connect(close)
	_build_credits()
	_build_assets()
	_build_font_licenses()
	_build_godot_licenses()


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


func _build_assets() -> void:
	for group: Dictionary in ASSETS:
		var line := Label.new()
		line.theme_type_variation = &"Body"
		line.text = group["text"]
		line.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		_assets_list.add_child(line)


## Every file under res://assets/ that is an asset (not docs nor import data) — tests.
static func asset_files(dir := "res://assets") -> PackedStringArray:
	var out := PackedStringArray()
	for f in DirAccess.get_files_at(dir):
		if f.get_extension() in ["import", "uid", "md"]:
			continue
		out.append(dir.path_join(f))
	for d in DirAccess.get_directories_at(dir):
		out.append_array(asset_files(dir.path_join(d)))
	return out


## The ASSETS group that covers a res://assets/ path, or -1.
static func asset_group(res_path: String) -> int:
	var rel := res_path.trim_prefix("res://assets/")
	for i in ASSETS.size():
		for pattern: String in ASSETS[i]["files"]:
			if rel.match(pattern):
				return i
	return -1


## One folded block per font with the copyright line and the full OFL 1.1 text.
func _build_font_licenses() -> void:
	for item: Array in FONT_LICENSES:
		var text := FileAccess.get_file_as_string(item[1])
		var first_line := text.get_slice("\n", 0).strip_edges()
		var copyright := Label.new()
		copyright.theme_type_variation = &"Caption"
		copyright.text = first_line if first_line != "" else ""
		copyright.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		_fonts_box.add_child(copyright)
		_add_fold(_fonts_box, "Licença OFL 1.1 — %s" % item[0],
			text.strip_edges() if text != "" else "")


## Godot: the MIT notice (Engine.get_license_text) and the third-party components with
## their licenses and copyrights (Engine.get_copyright_info), both folded.
func _build_godot_licenses() -> void:
	_add_fold(_godot_box, GODOT_LICENSE_TITLE, Engine.get_license_text().strip_edges())
	_add_fold(_godot_box, THIRD_PARTY_TITLE, third_party_text())


## "Name — licenses" then one "© …" line per copyright, for each Godot component.
static func third_party_text() -> String:
	var blocks := PackedStringArray()
	for component: Dictionary in Engine.get_copyright_info():
		var licenses := PackedStringArray()
		var lines := PackedStringArray()
		for part: Dictionary in component.get("parts", []):
			var lic := String(part.get("license", ""))
			if lic != "" and not licenses.has(lic):
				licenses.append(lic)
			for c in part.get("copyright", []):
				var line := "© %s" % String(c)
				if not lines.has(line):
					lines.append(line)
		blocks.append("%s — %s\n%s" % [component.get("name", ""), ", ".join(licenses), "\n".join(lines)])
	return "\n\n".join(blocks)


func _add_fold(parent: Container, title: String, text: String) -> FoldableContainer:
	var fold := FoldableContainer.new()
	fold.title = title
	# The title does not wrap: trim it instead of widening the column (24 px, +30 %).
	fold.title_text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	fold.folded = true
	var body := Label.new()
	body.theme_type_variation = &"Caption"
	body.text = text
	body.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	fold.add_child(body)
	parent.add_child(fold)
	_folds.append(fold)
	_style_folds()
	return fold


func _style_folds() -> void:
	for fold in _folds:
		AppScreen.style_foldable(fold)


func folds() -> Array[FoldableContainer]:
	return _folds.duplicate()
