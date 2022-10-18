/// @description React to Input, etc.

if keyboard_check(ord("J")) && !visible {
	x = 48 
	y = 120
	
	quest_populate(current_tab)
	visible = true
}

if keyboard_check_pressed(vk_escape) && visible {
	visible = false
}