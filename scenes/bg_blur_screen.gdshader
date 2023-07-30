shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE: hint_screen_texture;

uniform float lod: hint_range(0.0, 5) = 0.0;
uniform vec4 new_color: source_color;
void fragment(){
	vec4 color = texture(SCREEN_TEXTURE, SCREEN_UV, lod);
	COLOR = color * new_color;
}