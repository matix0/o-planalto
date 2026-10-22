extends SceneTree
## P-017 etapa 5 (Alisson: "no celular não consigo baixar pra ver o link da notícia").
## Over the open "Saiba mais" no control may stop the finger drag, and at the end of the scroll
## the source link shows above the fixed "Continuar" (T-15.4), long text, 390×844 phone.
## godot --headless --path jogo -s res://tests/test_learning_touch.gd

const SHEET_SCENE := "res://scenes/components/learning_sheet.tscn"
const LONG := "Texto longo para forçar a rolagem da folha no celular, como no pior caso do T-15.4. "
var _failures: PackedStringArray = []


func _initialize() -> void:
	_run.call_deferred()


func _run() -> void:
	root.size = Vector2i(390, 844)
	var settings: Node = root.get_node_or_null(^"Settings")
	if settings:
		settings.storage_path = "user://test_learning_touch.cfg"
		settings.reset_defaults(false)
		settings.set_value(&"text_step", 24)
	var sheet: Control = (load(SHEET_SCENE) as PackedScene).instantiate()
	root.add_child(sheet)
	sheet.set_anchors_preset(Control.PRESET_TOP_LEFT)
	sheet.size = Vector2(390, 844)   # the phone, whatever the headless window is
	await process_frame
	sheet.open({"title": "Testemunha contra a milícia", "concept": LONG.repeat(8), "impact": "Sem proteção, o silêncio vence.",
		"lived": LONG.repeat(8), "data": LONG.repeat(6),
		"source": {"label": "Agência Senado, 2025.", "url": "https://www12.senado.leg.br/"}})
	for i in 30:
		await process_frame
	sheet.more().folded = false
	for i in 10:
		await process_frame
	var scroll: ScrollContainer = sheet.scroll()
	_expect(sheet.is_scrolling(), "the open sheet scrolls at 24 px")
	# Headless Godot only drag-scrolls on a touchscreen, so the finger drag itself is checked on
	# the Web build (.claude/notas/execucao/ferramentas/web_touch.js, Chromium as a phone).
	# Here: nothing between the finger and Scroll stops the drag, and the link is reachable.
	var node: Node = sheet.more()
	while node != scroll:
		_expect(not (node is Control) or (node as Control).mouse_filter != Control.MOUSE_FILTER_STOP,
			"%s lets the drag reach Scroll (mouse_filter)" % node.name)
		node = node.get_parent()
	scroll.scroll_vertical = int(scroll.get_v_scroll_bar().max_value)
	for i in 5:
		await process_frame
	_expect(_link_visible(sheet), "the source link shows above Continuar at the end of the scroll")
	if _failures.is_empty():
		print("test_learning_touch: OK")
		quit(0)
	else:
		for f in _failures:
			printerr("FAIL: " + f)
		quit(1)


func _link_visible(sheet: Control) -> bool:
	var link: Control = sheet.source_link()
	var area: Rect2 = sheet.scroll().get_global_rect()
	return link.is_visible_in_tree() and area.encloses(link.get_global_rect())


func _expect(cond: bool, what: String) -> void:
	if not cond:
		_failures.append(what)
