shader_type canvas_item;

uniform float speed = 0;          // flow speed
uniform float amplitude = 5;     // wave strength
uniform float frequency = 10.0;     // number of waves

uniform vec2 direction = vec2(1.0, 0.0); // flow direction

void fragment() {
    vec2 uv = UV;

    // Flow: move texture over time
    uv += direction * TIME * speed;

    // Wave distortion
    uv.x += sin(uv.y * frequency + TIME * speed) * amplitude;

    COLOR = texture(TEXTURE, uv);
}
