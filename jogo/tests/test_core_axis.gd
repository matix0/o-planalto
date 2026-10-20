extends SceneTree
## gdd/sistemas/04_eixo.md — §4 example and §8 acceptance criteria.
## godot --headless --path jogo -s res://tests/test_core_axis.gd

var failures: PackedStringArray = []
var data: GameDatabase


func _initialize() -> void:
	data = GameDatabase.new()
	data.load_all()
	_positions()
	_said_track()
	_side_does_not_matter()
	data.free()
	_done("test_core_axis")


func _positions() -> void:
	# CA-1: three options touch Economia with −2, −1, +1 → (−2 / 3) × 5 = −3,3.
	var s := [0, 0, 0, 0]
	var n := [0, 0, 0, 0]
	for v in [[-2, 0, 0, 0], [-1, 0, 0, 0], [1, 0, 0, 0], [0, 0, 0, 0]]:
		AxisRules.add(s, n, v)
	var pos := AxisRules.positions(s, n)
	_check(absf(pos[0] - (-10.0 / 3.0)) < 0.001, "CA-1 −3,3 (got %s)" % pos[0])
	_eq(n, [3, 0, 0, 0], "a vector of zeros counts in no denominator (§5)")
	# CA-2: untouched axis → 0 and the "sem posição" text.
	_eq(pos[1], 0.0, "CA-2 untouched axis is 0")
	_eq(AxisRules.text_for(1, pos[1]), "Você quase não decidiu o lugar do Brasil no mundo.", "CA-2 text")
	_eq(AxisRules.dominant(pos), 0, "dominant = largest |pos|")
	_eq(AxisRules.text_for(0, pos[0]), AxisRules.TEXTS[0][0], "negative pole text")
	_eq(AxisRules.pole_for(0, pos[0]), "Coletivismo", "pole name")
	# Tie by Economia → Diplomacia → Sociedade → Estado.
	_eq(AxisRules.dominant([0.0, -5.0, 5.0, 0.0]), 1, "tie → table order")
	_eq(AxisRules.dominant([0.0, 0.0, 0.0, 0.0]), 0, "all zero → Economia (sem posição)")
	# CA-5: every position within −10..+10.
	var rng := RandomNumberGenerator.new()
	rng.seed = 4
	s = [0, 0, 0, 0]
	n = [0, 0, 0, 0]
	for _i in 200:
		AxisRules.add(s, n, [rng.randi_range(-2, 2), rng.randi_range(-2, 2), rng.randi_range(-2, 2), rng.randi_range(-2, 2)])
	_check(AxisRules.positions(s, n).all(func(p): return p >= -10.0 and p <= 10.0), "CA-5 range −10..+10")


func _said_track() -> void:
	# Wireframe T-10.1: the 6 "A" answers of docs/15 §15.04 → −7,5 · +5 · −5 · +5.
	var f := GameFlow.new(data)
	f.start(11)
	while f.state() == &"calibration":
		f.answer_calibration(int(f.run.calibration_side_a))
	_eq(AxisRules.positions(f.run.said_sum, f.run.said_count), [-7.5, 5.0, -5.0, 5.0], "said track of the A answers")
	_eq(f.state(), &"year_intro", "calibration → Ano 1")
	_eq(f.run.governed_count, [0, 0, 0, 0], "calibration does not touch the governed track")


func _side_does_not_matter() -> void:
	# CA-3: the side where an option shows does not change the score (D-084).
	var tracks: Array = []
	for side_a in [1, -1]:
		var f := GameFlow.new(data)
		f.start(3)
		f._begin_year(1)
		f.run.state = &"card"
		f.run.current_card = {"id": "INST-001", "kind": "draw", "target": "", "side_a": side_a}
		f.choose(side_a)   # option A wherever it showed
		tracks.append([f.run.governed_sum.duplicate(), f.run.governed_count.duplicate(), f.run.meters.duplicate()])
	_eq(tracks[0], tracks[1], "CA-3 same option, either side, same result")


func _eq(got: Variant, want: Variant, what: String) -> void:
	if got != want:
		failures.append("%s: got %s, want %s" % [what, str(got), str(want)])


func _check(cond: bool, what: String) -> void:
	if not cond:
		failures.append(what)


func _done(test_name: String) -> void:
	if failures.is_empty():
		print("%s: OK" % test_name)
		quit(0)
	else:
		for f in failures:
			printerr("FAIL: " + f)
		quit(1)
