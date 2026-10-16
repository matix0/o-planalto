extends SceneTree
## Headless data check (D-134):
## godot --headless --path jogo -s res://tests/test_data.gd

func _initialize() -> void:
	var data = load("res://scripts/game_data.gd").new()
	var ok: bool = data.load_all()
	var failures: PackedStringArray = data.errors.duplicate()

	_expect(failures, data.meters.size() == 8, "8 meters")
	_expect(failures, data.modes.size() == 10, "10 modes")
	_expect(failures, data.actors.size() == 24, "24 actors")
	_expect(failures, data.endings.size() == 28, "28 endings")
	_expect(failures, data.cards.size() == 40, "40 valid cards, got %d" % data.cards.size())
	# gdd/sistemas/01_medidores.md §3.2
	var expected_initial := {"dignity": 45, "awareness": 40, "sovereignty": 40, "security": 50,
		"integrity": 40, "treasury": 55, "political_capital": 50, "legitimacy": 55}
	for m in data.meters:
		_expect(failures, expected_initial.get(m["id"]) == int(m["initial"]), "initial value of %s" % m["id"])
	for mode in data.modes:
		_expect(failures, data.cards.values().any(func(c): return c["mode"] == mode and c["type"] == "institutional"), "mode %s has a card" % mode)

	# Validator rejects broken cards.
	var bad: Dictionary = data.cards["INST-001"].duplicate(true)
	bad["option_a"]["effects"] = {"dignity": 7}
	bad["option_b"]["color"] = bad["option_a"]["color"]
	var bad_errors: PackedStringArray = data.validate_card(bad)
	_expect(failures, bad_errors.size() >= 3, "broken card rejected (%s)" % ", ".join(bad_errors))

	data.free()
	if failures.is_empty() and ok:
		print("test_data: OK")
		quit(0)
	else:
		for f in failures:
			printerr("FAIL: " + f)
		quit(1)


func _expect(failures: PackedStringArray, cond: bool, what: String) -> void:
	if not cond:
		failures.append(what)
