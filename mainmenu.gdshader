shader_type canvas_item;

uniform float top_width : hint_range(0.0, 1.0) = 0.2;
uniform float bottom_width : hint_range(0.0, 1.0) = 1.0;

void vertex() {
    float t = VERTEX.y / TEXTURE_PIXEL_SIZE.y;
    float width = mix(top_width, bottom_width, t);
    VERTEX.x += width;
}
