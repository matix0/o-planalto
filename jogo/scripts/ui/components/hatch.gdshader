// C-10 — crisis frame: #B0BEC5 hatching around the impeachment card
// (docs/14 §14.08; wireframe Tela, cena "crise"). Rounded-rect mask.
shader_type canvas_item;

uniform vec4 stripe_color : source_color = vec4(0.6902, 0.7451, 0.7725, 1.0);
uniform float period = 10.0;
uniform float stripe_width = 4.0;
uniform float radius = 28.0;
uniform vec2 rect_size = vec2(304.0, 360.0);

void fragment() {
	vec2 p = UV * rect_size;
	// Distance across the 45° stripes (CSS repeating-linear-gradient(45deg, ...)).
	float s = mod((p.x - p.y) * 0.70710678, period);
	float stripe = step(s, stripe_width);
	vec2 q = abs(p - rect_size * 0.5) - (rect_size * 0.5 - vec2(radius));
	float d = length(max(q, vec2(0.0))) + min(max(q.x, q.y), 0.0) - radius;
	float inside = clamp(0.5 - d, 0.0, 1.0);
	COLOR = vec4(stripe_color.rgb, stripe_color.a * stripe * inside);
}
