/// @description Draw Blackscreen

a = clamp(a + (fade * fsp), 0, 1);

if a == 1 {
	if rm_to_goto != noone {
		room_goto(rm_to_goto)
		obj_player.x = rm_x
		obj_player.y = rm_y
	}
	fade = -1; // Fade In again
}

if a == 0 && fade == -1 {
	
	instance_destroy(self);
}

draw_set_color(c_black);
draw_set_alpha(a);
draw_rectangle(0, 0, 1920, 1080, false);
draw_set_alpha(1);