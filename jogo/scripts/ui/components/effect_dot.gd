class_name EffectDot
extends Control
## C-08 — effect dot above a meter (docs/14 §14.05; D-156).
## Small (change up to 10): solid white circle ~6. Big (over 10): ~10 + ring ~14.
## The two differ by shape, not only size. No direction: the meter itself
## fills or empties.

enum Kind { NONE, SMALL, BIG }

const POP_PEAK := 1.2

var kind: Kind = Kind.NONE:
	set(value):
		kind = value
		queue_redraw()

var _tween: Tween


func _ready() -> void:
	custom_minimum_size = Vector2(Tokens.DOT_RING, Tokens.DOT_RING)
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	offset_transform_enabled = true
	offset_transform_pivot_ratio = Vector2(0.5, 0.5)
	modulate.a = 0.0


static func kind_from(name: StringName) -> Kind:
	match name:
		&"small":
			return Kind.SMALL
		&"big":
			return Kind.BIG
	return Kind.NONE


func show_static(new_kind: Kind) -> void:
	_kill()
	kind = new_kind
	offset_transform_scale = Vector2.ONE
	modulate.a = 1.0 if new_kind != Kind.NONE else 0.0


## A-10: pops (0 → 1.2 → 1) after `delay`, stays, then fades out within
## `lifetime`. Reduce motion: fade only (docs/14 §14.10.3).
func play(new_kind: Kind, delay: float, lifetime: float, reduce_motion: bool) -> void:
	_kill()
	kind = new_kind
	if new_kind == Kind.NONE:
		modulate.a = 0.0
		return
	modulate.a = 0.0
	var fade := 0.15
	_tween = create_tween()
	_tween.tween_interval(delay)
	if reduce_motion:
		offset_transform_scale = Vector2.ONE
		_tween.tween_property(self, "modulate:a", 1.0, fade)
	else:
		offset_transform_scale = Vector2.ZERO
		_tween.tween_property(self, "modulate:a", 1.0, 0.05)
		_tween.parallel().tween_property(self, "offset_transform_scale", Vector2.ONE * POP_PEAK, 0.12) \
			.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
		_tween.tween_property(self, "offset_transform_scale", Vector2.ONE, 0.08)
	var hold := maxf(lifetime - fade * 2.0, 0.0)
	_tween.tween_interval(hold)
	_tween.tween_property(self, "modulate:a", 0.0, fade)


func _kill() -> void:
	if _tween and _tween.is_valid():
		_tween.kill()


func _draw() -> void:
	var c := size * 0.5
	match kind:
		Kind.SMALL:
			draw_circle(c, Tokens.DOT_SMALL * 0.5, Tokens.TEXT, true, -1.0, true)
		Kind.BIG:
			draw_circle(c, Tokens.DOT_BIG * 0.5, Tokens.TEXT, true, -1.0, true)
			draw_circle(c, Tokens.DOT_RING * 0.5 - 0.5, Tokens.TEXT, false, 1.0, true)
