/// @description Insert description here
// You can write your code in this editor

draw_self()

if(distance_to_object(obj_player)) <= 32 {
	image_blend = c_ltgrey
	draw_set_colour(c_white)
	draw_set_font(fnt_popups)
	draw_set_halign(fa_center)
	draw_text(x + (sprite_width/2), y + (sprite_height/2), "SPACE")
	draw_set_halign(fa_left)
} else {
	image_blend = c_white
}







