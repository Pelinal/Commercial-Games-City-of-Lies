// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scene_screen_to_black(fade_duration){
	// Fades to Black
	var blackscreen = instance_create_depth(0,0,-2000, obj_blackscreen)
	blackscreen.duration = fade_duration
	blackscreen.fade = "FadeOut"
}
function scene_screen_from_black(fade_duration){
	// Fades to Black
	var blackscreen = instance_create_depth(0,0,-2000, obj_blackscreen)
	blackscreen.duration = fade_duration
	blackscreen.fade = "FadeIn"
}
