shader_type canvas_item;

uniform float whitening = 0.0;

void fragment() {
    vec4 texture_color = texture(TEXTURE, UV);
    COLOR = vec4(mix(texture_color.rgb, vec3(0.5,1,1), whitening), texture_color.a);
}