/// @description Toggle Display

if keyboard_check_pressed(ord("C")) && !visible {
	// Display
	visible = true
	x = 48 
	y = 120
}

if keyboard_check_pressed(vk_escape) && visible {
	visible = false
}