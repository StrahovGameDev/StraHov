shader_type canvas_item;

//uniform vec2 blur_amount = vec2(10.00, 0.10);
//
//void fragment(){
	//vec4 color_up = texture(TEXTURE, UV + vec2(0.0, blur_amount.y));
	//vec4 color_down = texture(TEXTURE, UV + vec2(0.0, -blur_amount.y));
	//vec4 color_right = texture(TEXTURE, UV + vec2(blur_amount.x, 0.0));
	//vec4 color_left = texture(TEXTURE, UV + vec2(-blur_amount.x, 0.0));
	//
	//COLOR = (color_up + color_down + color_left + color_right) /4.0;
	//COLOR.a = 0.3;
//}

uniform float lod: hint_range(0.0, 5.0)  = 0;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

void fragment(){
	vec4 color = texture(SCREEN_TEXTURE, SCREEN_UV, lod);
	COLOR = color;
}
