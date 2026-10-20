class_name EventRules
extends RefCounted
## gdd/sistemas/08_eventos.md — scheduling (§3.2), firing order (§3.3) and epilogue
## (§3.4, §5). Effects are applied by the flow with the multiplier of the firing year.

const LAST_YEAR := 4


## Queues the events of the chosen option: target = X + delay; target > 4 → epilogue.
static func schedule(run: RunState, events: Array, chosen_year: int, origin_id: String, origin_title: String) -> void:
	for ev in events:
		var target := chosen_year + int(ev.get("delay", 1))
		var text := String(ev.get("text", ""))
		if target > LAST_YEAR:
			run.epilogue.append(text)
			continue
		var effects := {}
		for m in ev.get("effects", {}):
			effects[String(m)] = int(ev["effects"][m])
		run.event_queue.append({
			"text": text,
			"effects": effects,
			"target": target,
			"origin_id": origin_id,
			"origin_title": origin_title,
			"seq": run.event_seq,
		})
		run.event_seq += 1


## Removes and returns the events due in `year`, in scheduling order.
static func take_due(run: RunState, year: int) -> Array:
	var due: Array = []
	var rest: Array = []
	for ev in run.event_queue:
		if int(ev["target"]) <= year:
			due.append(ev)
		else:
			rest.append(ev)
	due.sort_custom(func(a: Variant, b: Variant) -> bool: return int(a["seq"]) < int(b["seq"]))
	run.event_queue = rest
	return due


## End of the run: events of this turn not fired yet and everything still queued go to the
## epilogue, without effects (§3.4, §5).
static func flush_to_epilogue(run: RunState) -> void:
	for i in range(run.event_cursor + 1, run.turn_events.size()):
		run.epilogue.append(String(run.turn_events[i]["text"]))
	run.turn_events = []
	var queue := run.event_queue.duplicate()
	queue.sort_custom(func(a: Variant, b: Variant) -> bool: return int(a["seq"]) < int(b["seq"]))
	for ev in queue:
		run.epilogue.append(String(ev["text"]))
	run.event_queue = []
