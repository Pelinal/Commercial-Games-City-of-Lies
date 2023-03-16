/// @description Floating Text

draw_self()


if(distance_to_object(obj_player)) <= 32 && !opening {
	image_blend = c_ltgrey
	draw_set_colour(c_white)
	draw_set_font(fnt_popups)
	draw_set_halign(fa_center)
	if !locked {
		draw_text(x + (sprite_width/2), y + (sprite_height/2), "SPACE")
	} else {
		draw_text(x + (sprite_width/2), y + (sprite_height/2), "LOCKED")
	}
} else {
	image_blend = c_white
}

draw_set_halign(fa_left)