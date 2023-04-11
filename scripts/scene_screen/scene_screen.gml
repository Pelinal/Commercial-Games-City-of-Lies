// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scene_screen_fade(fade_speed=0.05, goto_rm=noone, room_x=0, room_y=0, sound=noone, destroy=noone) {
	// Fades to Black
	if instance_number(obj_fade) == 0 {
		var fade_obj = instance_create_depth(0,0,-2000, obj_fade)
		fade_obj.fsp = fade_speed
		if goto_rm != noone { fade_obj.rm_to_goto = goto_rm }
		fade_obj.rm_x = room_x
		fade_obj.rm_y = room_y
		if sound != noone { fade_obj.sound_to_play = sound }
		if destroy != noone { fade_obj.destroy_this = destroy }
	} else {
		return	
	}
}