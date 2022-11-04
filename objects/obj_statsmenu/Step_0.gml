/// @description Toggle Display
if room != rm_setup { 
	if keyboard_check_pressed(ord("C")) && !visible && !global.immobile {
		// Display
		global.immobile = true
		visible = true
		x = 48 
		y = 120
	}

	if keyboard_check_pressed(vk_escape) && visible {
		visible = false
		global.immobile = false
	}
}