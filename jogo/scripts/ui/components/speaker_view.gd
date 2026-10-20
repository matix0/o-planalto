class_name SpeakerView
extends VBoxContainer
## C-03 — who presents the problem (docs/14 §14.04.1; D-142, D-164):
## generic silhouette + name from the card's `quem_fala`. The portrait can
## be hidden (P1, text at 36 px, D-169). High contrast (P2): black disc,
## white ring and white silhouette (wireframe Tela).

const UNKNOWN := "[quem_fala — a definir]"
const PORTRAIT_HC_SVG := """<svg xmlns="http://www.w3.org/2000/svg" width="96" height="96" viewBox="0 0 56 56"><circle cx="28" cy="28" r="27" fill="#000000" stroke="#FFFFFF" stroke-width="2"/><circle cx="28" cy="22" r="9" fill="#FFFFFF"/><path d="M11 49c2-9 9-14 17-14s15 5 17 14Z" fill="#FFFFFF"/></svg>"""

var high_contrast: bool = false:
	set(v):
		high_contrast = v
		if is_node_ready():
			_apply_contrast()

static var _hc_texture: Texture2D

@onready var _portrait: TextureRect = $Portrait
@onready var _name: Label = $SpeakerName
@onready var _normal_texture: Texture2D = _portrait.texture


func _ready() -> void:
	_portrait.accessibility_name = "Retrato em silhueta genérica"
	_apply_contrast()


func setup(speaker_name: String, show_portrait: bool = true) -> void:
	_name.text = speaker_name if speaker_name.strip_edges() != "" else UNKNOWN
	_portrait.visible = show_portrait


func speaker_name() -> String:
	return _name.text


func _apply_contrast() -> void:
	_portrait.texture = _hc_portrait() if high_contrast else _normal_texture


static func _hc_portrait() -> Texture2D:
	if _hc_texture == null:
		var img := Image.new()
		if img.load_svg_from_string(PORTRAIT_HC_SVG) == OK:
			_hc_texture = ImageTexture.create_from_image(img)
	return _hc_texture
