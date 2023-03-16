// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scene_screen_to_black(fade_duration){
	// Fades to Black
	if instance_number(obj_blackscreen) == 0 {
		var blackscreen = instance_create_depth(0,0,-2000, obj_blackscreen)
		blackscreen.duration = fade_duration
		blackscreen.fade = "FadeOut"
		blackscreen.image_alpha = 0
	} else {
		return	
	}
}
function scene_screen_from_black(fade_duration){
	// Fades from Black
	if instance_number(obj_blackscreen) == 0 {
		var blackscreen = instance_create_depth(0,0,-2000, obj_blackscreen)
		blackscreen.duration = fade_duration
		blackscreen.fade = "FadeIn"
		blackscreen.image_alpha = 1
	} else {
		return	
	}
}
