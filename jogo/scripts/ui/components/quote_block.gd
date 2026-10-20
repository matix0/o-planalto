class_name QuoteBlock
extends VBoxContainer
## C-12 — quote block of the final screen (docs/14 §14.09; 14A C-12; gdd/sistemas/02_finais.md
## §3.5; boards Final, C08-C14). The quote in the Quote style between typographic quotes, and
## "— author" in Caption under it. Endings without a verified quote ("—" or "Adaptação" in
## gdd 02 §3.5) come with quote "" and the block hides itself (D-091): the screen's VBox
## closes the gap. Read in order, no focus; no own animation (enters with A-26).

## [a definir] (C-12: "Obra e data entre parênteses na tabela: exibir?"). The data keep the
## work and date after the name ("Roberto Campos (Na virada do milênio, 1999)"); the boards
## show only the name. true = the author exactly as in the data, which also keeps qualifiers
## such as "(atribuída)" and "(paráfrase de entrevista, 2023)"; false = name only.
const SHOW_AUTHOR_DETAILS := true
const AUTHOR_TBD := "[autor — a definir]"
const OPEN_QUOTE := "“"
const CLOSE_QUOTE := "”"
const DASH := "— "

var quote: String = ""
var author: String = ""

@onready var _text: Label = $QuoteText
@onready var _author: Label = $QuoteAuthor


func _ready() -> void:
	_apply()


## Empty `quote` (or only spaces) hides the whole block.
func set_quote(new_quote: String, new_author: String) -> void:
	quote = new_quote.strip_edges()
	author = new_author.strip_edges()
	if is_node_ready():
		_apply()


func has_quote() -> bool:
	return quote != ""


func quote_text() -> String:
	return _text.text


func author_text() -> String:
	return _author.text


## "Name (work, year)" → "Name". Only a final parenthesis group is removed.
static func author_name_only(full: String) -> String:
	var re := RegEx.create_from_string("\\s*\\([^()]*\\)\\s*$")
	return re.sub(full, "").strip_edges()


func _apply() -> void:
	visible = quote != ""
	_text.text = OPEN_QUOTE + quote + CLOSE_QUOTE if visible else ""
	var shown := author if SHOW_AUTHOR_DETAILS else author_name_only(author)
	_author.text = DASH + (shown if shown != "" else AUTHOR_TBD)
