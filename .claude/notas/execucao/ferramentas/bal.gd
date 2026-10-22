extends SceneTree
## Balance probe (impeachment): which trigger opens the scene, in which year, and the outcome.
## godot --headless --path <copy> -s res://sim/bal.gd -- [runs_per_profile]
## Profiles: random; careful (keeps the lowest meter high); people (prefers the option that
## raises Dignidade + Consciência + Integridade + Legitimidade, like a player who "does the
## right thing"); mixed (people 70%, random 30%).

const MAX_STEPS := 4000
var data: GameDatabase
var order: Array


func _initialize() -> void:
	data = GameDatabase.new()
	data.load_all()
	order = Array(data.meter_ids)
	var args := OS.get_cmdline_user_args()
	var per := int(args[0]) if args.size() > 0 else 300
	var out := {}
	for p in ["random", "careful", "people", "mixed"]:
		var r := {"runs": 0, "scene": 0, "acquitted": 0, "convicted": 0, "triggers": {}, "scene_year": {},
			"reasons": {}, "capital_end": 0.0, "endings": {}}
		for s in per:
			_play(p, 5000 + s, r)
		r["capital_end"] = snappedf(r["capital_end"] / max(1, r["runs"]), 0.1)
		out[p] = r
	print(JSON.stringify(out, "  "))
	data.free()
	quit()


func _play(profile: String, seed: int, r: Dictionary) -> void:
	var f := GameFlow.new(data)
	f.start(seed)
	var rng := RandomNumberGenerator.new()
	rng.seed = seed * 7919 + profile.hash()
	var steps := 0
	var seen_scene := false
	while f.state() != &"final" and steps < MAX_STEPS:
		steps += 1
		match f.state():
			&"calibration":
				f.answer_calibration(1)
			&"year_intro":
				f.continue_from_year()
			&"events":
				f.continue_from_event()
			&"card":
				f.choose(_pick(f, profile, rng))
			&"consequence":
				f.continue_from_consequence()
			&"learning":
				f.continue_from_learning()
			&"impeachment":
				if not seen_scene:
					seen_scene = true
					r["scene"] += 1
					var imp: Dictionary = f.run.impeachment
					for t in imp.get("triggers", []):
						r["triggers"][t] = int(r["triggers"].get(t, 0)) + 1
					var y := str(f.run.year)
					r["scene_year"][y] = int(r["scene_year"].get(y, 0)) + 1
				if f.impeachment_view()["stage"] == "phase":
					f.choose_impeachment(_scene_pick(f))
				else:
					f.continue_impeachment()
			_:
				break
	r["runs"] += 1
	var v: Dictionary = f.final_view()
	var reason := String(v.get("reason", ""))
	r["reasons"][reason] = int(r["reasons"].get(reason, 0)) + 1
	var e := String(v.get("ending", {}).get("id", ""))
	r["endings"][e] = int(r["endings"].get(e, 0)) + 1
	if seen_scene:
		if reason == "impeachment":
			r["convicted"] += 1
		else:
			r["acquitted"] += 1
	r["capital_end"] += float(f.run.meters["political_capital"])


func _pick(f: GameFlow, profile: String, rng: RandomNumberGenerator) -> int:
	if profile == "random" or (profile == "mixed" and rng.randf() < 0.3):
		return rng.randi_range(0, 1) * 2 - 1
	var side_a := int(f.run.current_card["side_a"])
	var card: Dictionary = data.cards[String(f.run.current_card["id"])]
	var best := 1
	var best_score := -INF
	for side in [-1, 1]:
		var opt: Dictionary = card[CardRules.option_key(side, side_a)]
		var m: Dictionary = f.run.meters.duplicate()
		MeterRules.apply_effects(m, f._ints(opt.get("effects", {})), f._multiplier(), data.balance, order)
		var score: float
		if profile == "careful":
			score = float(m.values().min()) * 1000.0 + float(m.values().reduce(func(a, x): return a + x, 0))
		else:
			var e: Dictionary = f._ints(opt.get("effects", {}))
			score = float(int(e.get("dignity", 0)) + int(e.get("awareness", 0)) + int(e.get("integrity", 0)) + int(e.get("legitimacy", 0)))
			score += float(m.values().min()) * 0.01   # tie-break: stay alive
		if score > best_score:
			best_score = score
			best = side
	return best


## A sensible player in the scene: takes the option whose test passes, A first.
func _scene_pick(f: GameFlow) -> int:
	var imp: Dictionary = f.run.impeachment
	var card: Dictionary = data.impeachment_cards[int(imp["phase"]) - 1]
	var side_a := int(imp["side_a"])
	if ImpeachmentRules.test_passes(card["option_a"]["test"], f.run.meters):
		return side_a
	if ImpeachmentRules.test_passes(card["option_b"]["test"], f.run.meters):
		return -side_a
	return side_a
