extends SceneTree
## P-014 etapa 7 — headless simulation through GameFlow (outside the repository).
## godot --headless --path <copy> -s res://sim/sim.gd -- [runs_per_profile]
## Checks: meters 0-100 after every step; same seed + profile → same run; save → JSON →
## restore in the middle → same result; each fired event fires in its target year; markers
## on the final screen data; ending frequencies per profile.

const METERS := ["dignity", "awareness", "sovereignty", "security", "integrity", "treasury", "political_capital", "legitimacy"]
const MAX_STEPS := 4000

var data: GameDatabase
var order: Array
var profiles: Array = []
var stats := {
	"runs": 0, "out_of_range": 0, "nondeterministic": 0, "restore_mismatch": 0,
	"event_year_mismatch": 0, "stuck": 0, "scenes": 0, "events_fired": 0,
}
var endings := {}            # ending id -> count
var by_profile := {}         # profile -> {ending id -> count}
var reasons := {}            # reason -> count
var markers := {}            # final_view field -> count of runs with "[" in it
var examples := []           # first problems found
var _scanned := {}           # "profile/seed" already scanned for markers (each run counted once)


func _initialize() -> void:
	data = GameDatabase.new()
	data.load_all()
	order = Array(data.meter_ids)
	profiles = ["random", "always_a", "always_b", "careful", "sink_capital", "populist", "populist_safe"]
	for m in METERS:
		profiles.append("max:" + m)
		profiles.append("min:" + m)
	var args := OS.get_cmdline_user_args()
	var per := int(args[0]) if args.size() > 0 else 92
	var t0 := Time.get_ticks_msec()
	for pi in profiles.size():
		var p: String = profiles[pi]
		by_profile[p] = {}
		for s in per:
			var seed := 1000 + s
			var a := _play(p, pi, seed, -1)
			var b := _play(p, pi, seed, -1)
			if a.sig != b.sig:
				stats.nondeterministic += 1
				_example("nondeterministic %s seed %d" % [p, seed])
			var k := 5 + (seed * 13) % 70
			var c := _play(p, pi, seed, k)
			if c.final_sig != a.final_sig:
				stats.restore_mismatch += 1
				_example("restore mismatch %s seed %d at step %d: %s vs %s" % [p, seed, k, c.final_sig, a.final_sig])
			stats.runs += 1
			endings[a.ending] = int(endings.get(a.ending, 0)) + 1
			by_profile[p][a.ending] = int(by_profile[p].get(a.ending, 0)) + 1
			reasons[a.reason] = int(reasons.get(a.reason, 0)) + 1
	print(JSON.stringify({"stats": stats, "endings": endings, "reasons": reasons, "markers": markers,
		"by_profile": by_profile, "examples": examples, "ms": Time.get_ticks_msec() - t0}, "  "))
	data.free()
	quit()


## One run. restore_at ≥ 0: at that step, save → JSON → restore and go on.
func _play(profile: String, pi: int, seed: int, restore_at: int) -> Dictionary:
	var f := GameFlow.new(data)
	f.start(seed)
	var rng := RandomNumberGenerator.new()
	rng.seed = seed * 7919 + pi
	var sig := PackedStringArray()
	var steps := 0
	var scene := false
	while f.state() != &"final" and steps < MAX_STEPS:
		if steps == restore_at:
			var text := JSON.stringify(f.to_dict())
			f = GameFlow.restore(data, JSON.parse_string(text))
		steps += 1
		match f.state():
			&"calibration":
				f.answer_calibration(rng.randi_range(0, 1) * 2 - 1 if profile == "random" else 1)
			&"year_intro":
				f.continue_from_year()
				for ev in f.run.turn_events:
					stats.events_fired += 1
					if int(ev["target"]) != int(f.run.year):
						stats.event_year_mismatch += 1
						_example("event '%s' target %d fired in year %d" % [ev["text"], ev["target"], f.run.year])
			&"events":
				f.continue_from_event()
			&"card":
				sig.append(String(f.run.current_card.get("id", "")))
				f.choose(_pick(f, profile, rng))
			&"consequence":
				f.continue_from_consequence()
			&"learning":
				f.continue_from_learning()
			&"impeachment":
				scene = true
				if f.impeachment_view()["stage"] == "phase":
					f.choose_impeachment(_scene_pick(f, profile, rng))
				else:
					f.continue_impeachment()
			_:
				_example("unknown state %s" % f.state())
				break
		for m in order:
			var v := int(f.run.meters.get(m, -1))
			if v < 0 or v > 100:
				stats.out_of_range += 1
				_example("%s = %d (%s seed %d)" % [m, v, profile, seed])
	if f.state() != &"final":
		stats.stuck += 1
		_example("stuck %s seed %d in %s" % [profile, seed, f.state()])
		return {"sig": "", "final_sig": "", "ending": "stuck", "reason": "stuck"}
	if restore_at < 0 and scene:
		stats.scenes += 1
	var v: Dictionary = f.final_view()
	if restore_at < 0 and sig.size() >= 0 and not _scanned.has("%s/%d" % [profile, seed]):
		_scanned["%s/%d" % [profile, seed]] = true
		_scan_markers(v, "")
	var ending := String(v.get("ending", {}).get("id", ""))
	var vals := PackedStringArray()
	for m in order:
		vals.append(str(f.run.meters[m]))
	var final_sig := "%s|%s|%s|%s" % [ending, v.get("reason", ""), ",".join(vals), str(f.run.epilogue)]
	sig.append(final_sig)
	return {"sig": ",".join(sig), "final_sig": final_sig, "ending": ending, "reason": String(v.get("reason", ""))}


func _pick(f: GameFlow, profile: String, rng: RandomNumberGenerator) -> int:
	var side_a := int(f.run.current_card["side_a"])
	match profile:
		"random":
			return rng.randi_range(0, 1) * 2 - 1
		"always_a":
			return side_a
		"always_b":
			return -side_a
	var card: Dictionary = _card(f)
	var best := 1
	var best_score := -INF
	for side in [-1, 1]:
		var opt: Dictionary = card[CardRules.option_key(side, side_a)]
		var m: Dictionary = f.run.meters.duplicate()
		MeterRules.apply_effects(m, f._ints(opt.get("effects", {})), f._multiplier(), data.balance, order)
		var careful: float = float(m.values().min()) * 1000.0 + float(m.values().reduce(func(a, x): return a + x, 0))
		var score := careful
		if profile == "sink_capital":
			score = -float(m["political_capital"]) * 1.0e6 + careful
		elif profile == "populist":
			score = float(m["legitimacy"] - m["awareness"] - m["integrity"]) * 1.0e6 + careful
		elif profile == "populist_safe":
			# Toward END-015 (Legitimidade > 80, Consciência < 30, Integridade < 30) without
			# letting any meter near 0: the floor comes first.
			var floor_ok: bool = int(m.values().min()) >= 22
			score = (1.0e9 if floor_ok else 0.0) + float(m["legitimacy"] - maxi(m["awareness"], 25) - maxi(m["integrity"], 25)) * 1.0e6 + careful
		elif profile.begins_with("max:"):
			score = float(m[profile.substr(4)]) * 1.0e6 + careful
		elif profile.begins_with("min:"):
			score = -float(m[profile.substr(4)]) * 1.0e6 + careful
		if score > best_score:
			best_score = score
			best = side
	return best


func _card(f: GameFlow) -> Dictionary:
	return data.cards[String(f.run.current_card["id"])]


## Scene: pass the phase test when possible (acquittal); sink_capital fails it (conviction).
func _scene_pick(f: GameFlow, profile: String, rng: RandomNumberGenerator) -> int:
	var imp: Dictionary = f.run.impeachment
	var card: Dictionary = data.impeachment_cards[int(imp["phase"]) - 1]
	var a_passes := ImpeachmentRules.test_passes(card["option_a"]["test"], f.run.meters)
	var b_passes := ImpeachmentRules.test_passes(card["option_b"]["test"], f.run.meters)
	var side_a := int(imp["side_a"])
	if profile == "random":
		return rng.randi_range(0, 1) * 2 - 1
	if profile == "sink_capital":
		return side_a if not a_passes else -side_a
	return side_a if (a_passes or not b_passes) else -side_a


func _scan_markers(v: Variant, path: String) -> void:
	if v is Dictionary:
		for k in v:
			_scan_markers(v[k], path + "/" + str(k))
	elif v is Array:
		for x in v:
			_scan_markers(x, path + "[]")
	elif v is String:
		for tag in ["[a definir", "a definir]", "[Fictício", "[não verificado"]:
			if (v as String).contains(tag):
				var key := "%s %s" % [path, tag]
				markers[key] = int(markers.get(key, 0)) + 1


func _example(t: String) -> void:
	if examples.size() < 20:
		examples.append(t)
