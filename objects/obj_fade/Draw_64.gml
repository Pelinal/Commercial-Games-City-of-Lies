/// @description Draw Blackscreen

a = clamp(a + (fade * fsp), 0, 1);

if a == 1 {
	if rm_to_goto != noone {
		room_goto(rm_to_goto)
		obj_player.x = rm_x
		obj_player.y = rm_y
	}
	if object_to_move != noone {
		object_to_move.x = rm_x
		object_to_move.y = rm_y
	}
	if destroy_this != noone { instance_destroy(destroy_this) }
	fade = -1; // Fade In again
}

if a == 0 && fade == -1 {
	if sound_to_play != noone { audio_play_sound(sound_to_play, 100, false) }
	instance_destroy(self);
}

draw_set_color(c_black);
draw_set_alpha(a);
draw_rectangle(0, 0, 1920, 1080, false);
draw_set_alpha(1);