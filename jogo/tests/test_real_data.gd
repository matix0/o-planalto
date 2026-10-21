extends SceneTree
## Headless check of the real deck in res://data (P-015 phase 6), exported from docs 17 and 18
## by jogo/tools/cards_doc.py export. Counts come from the data, so a new wave needs no edit here.
## godot --headless --path jogo -s res://tests/test_real_data.gd

func _initialize() -> void:
	var data = load("res://scripts/game_data.gd").new()
	var ok: bool = data.load_all()
	var failures: PackedStringArray = data.errors.duplicate()

	_expect(failures, data.meters.size() == 8, "8 meters")
	_expect(failures, data.modes.size() == 10, "10 modes")
	_expect(failures, data.actors.size() == 24, "24 actors")
	_expect(failures, data.endings.size() == 28, "28 endings")
	# A full match draws 7 cards × 4 years with no repeats (D-113).
	_expect(failures, data.cards.size() >= 28, "at least 28 playable cards, got %d" % data.cards.size())
	_expect(failures, data.cards.values().all(func(c): return not c.get("fictitious", false)), "no fictitious card in the real deck")
	_expect(failures, data.cards.values().all(func(c): return data.learning.has(c["learning_id"])), "a Learning Card for every card (D-102)")
	_expect(failures, data.learning.values().all(func(l): return not l.get("fictitious", false)), "no fictitious Learning Card")
	_expect(failures, data.impeachment_cards.size() == 5, "5 scene cards")
	for id in data.actors:
		for role in data.actors[id].get("cards", {}):
			var card_id: String = data.actors[id]["cards"][role]
			_expect(failures, data.cards.has(card_id), "%s %s card %s is in the deck" % [id, role, card_id])

	data.free()
	if failures.is_empty() and ok:
		print("test_real_data: OK")
		quit(0)
	else:
		for f in failures:
			printerr("FAIL: " + f)
		quit(1)


func _expect(failures: PackedStringArray, cond: bool, what: String) -> void:
	if not cond:
		failures.append(what)
