shader_type canvas_item;
// T-02 — tutorial dim with a rounded-rect hole over the highlighted element
// ("recorte: shader com retângulo arredondado (uniform hole_rect, hole_radius)").
// The ColorRect color (black 62 %) and the modulate stay in COLOR; only alpha is masked.

uniform vec4 hole_rect = vec4(0.0);   // x, y, w, h in the item's local pixels
uniform float hole_radius = 0.0;

varying vec2 local_pos;

void vertex() {
	local_pos = VERTEX;
}

void fragment() {
	float outside = 1.0;
	if (hole_rect.z > 0.0 && hole_rect.w > 0.0) {
		vec2 half_size = hole_rect.zw * 0.5;
		vec2 center = hole_rect.xy + half_size;
		float r = min(hole_radius, min(half_size.x, half_size.y));
		vec2 q = abs(local_pos - center) - (half_size - vec2(r));
		float d = length(max(q, vec2(0.0))) + min(max(q.x, q.y), 0.0) - r;
		outside = smoothstep(-0.75, 0.75, d);
	}
	COLOR.a *= outside;
}
