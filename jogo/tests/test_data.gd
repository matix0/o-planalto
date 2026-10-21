extends SceneTree
## Headless data check (D-134):
## godot --headless --path jogo -s res://tests/test_data.gd
## Runs on the fictitious fixture deck (tests/fixtures/data, D-139); the real deck is checked
## by test_real_data.gd.

const FIXTURE_DIR := "res://tests/fixtures/data/"

func _initialize() -> void:
	var data = load("res://scripts/game_data.gd").new()
	data.data_dir = FIXTURE_DIR
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

	# D-177: option text up to 25 characters (accented letters count once).
	var long_text: Dictionary = data.cards["INST-001"].duplicate(true)
	long_text["option_a"]["text"] = "Redirecionar para o hospital"   # 28 (docs/17:354)
	_expect(failures, _has_error(data.validate_card(long_text), "over 25 characters"), "option over 25 characters rejected")
	var at_limit: Dictionary = data.cards["INST-001"].duplicate(true)
	at_limit["option_a"]["text"] = "Oferecer cargos a aliados"       # exactly 25
	at_limit["option_b"]["text"] = "Ação já é tão útil à união"      # 26 with accents
	var limit_errors: PackedStringArray = data.validate_card(at_limit)
	_expect(failures, not _has_error(limit_errors, "option_a: text over"), "25 characters accepted")
	_expect(failures, _has_error(limit_errors, "option_b: text over"), "26 characters with accents rejected")
	# D-164: quem_fala (speaker) is required; an ACT-xxx speaker must exist.
	var mute: Dictionary = data.cards["INST-001"].duplicate(true)
	mute.erase("speaker")
	_expect(failures, _has_error(data.validate_card(mute), "missing speaker"), "card without quem_fala rejected")
	var ghost: Dictionary = data.cards["INST-001"].duplicate(true)
	ghost["speaker"] = "ACT-999"
	_expect(failures, _has_error(data.validate_card(ghost), "unknown speaker actor"), "unknown ACT speaker rejected")
	var legacy: Dictionary = data.cards["INST-001"].duplicate(true)
	legacy.erase("speaker")
	legacy["quem_fala"] = "ACT-001"
	_expect(failures, data.validate_card(legacy).is_empty(), "quem_fala key accepted (doc 17 name)")
	_expect(failures, data.cards.values().all(func(c): return String(c.get("speaker", "")) != ""), "every card names who speaks")

	# V-035: the Capture limit comes from balance.json.
	_expect(failures, data.endings["END-009"]["conditions"][0]["value"] == int(data.balance["capture_at_or_above"]), "capture ending reads capture_at_or_above")
	var low_capture = load("res://scripts/game_data.gd").new()
	low_capture.balance = {"capture_at_or_above": 90}
	low_capture.endings = {"E": {"id": "E", "category": "capture", "trigger": "end_of_term", "conditions": [{"meter": "security", "op": ">=", "value": 95}]}}
	low_capture._apply_capture_limit()
	_expect(failures, low_capture.endings["E"]["conditions"][0]["value"] == 90, "capture limit follows balance.json")
	low_capture.free()
	# V-015 / D-091: a Learning Card without a verified link leaves the data → its card leaves the draw.
	var strict = load("res://scripts/game_data.gd").new()
	strict.data_dir = FIXTURE_DIR
	strict.load_all()
	var real: Dictionary = strict.learning["APR-001"].duplicate(true)
	real.erase("fictitious")
	strict.learning = {"APR-001": real}
	strict.cards = {"INST-001": strict.cards["INST-001"]}
	strict.errors.clear()
	strict._validate_learning()
	_expect(failures, not strict.learning.has("APR-001"), "real learning without a link is dropped (V-015)")
	_expect(failures, Array(strict.errors).any(func(e: String) -> bool: return e.contains("verified link")), "error names the missing link")
	var linked: Dictionary = real.duplicate(true)
	linked["source"] = {"label": "IBGE", "url": "https://www.ibge.gov.br/"}
	strict.learning = {"APR-001": linked}
	strict._validate_learning()
	_expect(failures, strict.learning.has("APR-001"), "real learning with a link stays")
	strict.free()

	# Lote A data (P-005): calibration (docs/15 §15.04), Learning Cards (doc 18 blocks,
	# fictitious), the 5 impeachment scene cards (gdd/sistemas/03_impeachment.md §4.1).
	_expect(failures, data.calibration.size() == 6, "6 calibration questions")
	_expect(failures, data.calibration[0]["question"] == "O governo deve priorizar segurança ou prevenção?", "calibration question 1")
	_expect(failures, data.cards.values().all(func(c): return data.learning.has(c["learning_id"])), "a Learning Card for every card")
	_expect(failures, data.impeachment_cards.size() == 5, "5 scene cards")
	_expect(failures, data.impeachment_cards.all(func(c): return c["type"] == "impeachment"), "scene cards are type impeachment")
	var no_test: Dictionary = data.impeachment_cards[0].duplicate(true)
	no_test["option_a"].erase("test")
	_expect(failures, not data.validate_card(no_test).is_empty(), "scene card without a test rejected")
	_expect(failures, data.speaker_for(data.cards["INST-001"])["name"] == "Congresso", "speaker = mode institution (D-164)")

	data.free()
	if failures.is_empty() and ok:
		print("test_data: OK")
		quit(0)
	else:
		for f in failures:
			printerr("FAIL: " + f)
		quit(1)


func _has_error(errors: PackedStringArray, fragment: String) -> bool:
	return Array(errors).any(func(e: String) -> bool: return e.contains(fragment))


func _expect(failures: PackedStringArray, cond: bool, what: String) -> void:
	if not cond:
		failures.append(what)
