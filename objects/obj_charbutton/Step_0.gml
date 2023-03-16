/// @description Check mouse

if position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id) {
	// Check for Mouse Enter
	image_xscale = 1.1
	image_yscale = 1.1
	
	if mouse_check_button_pressed(mb_left) {
		switch sprite_index {
			
			case spr_male :
				global.persona[0] = "John"
				global.persona[1] = "Male"
				global.persona[2] = "Mr"
				global.persona[3] = "sir"
				global.persona[4] = "lord"
				global.persona[5] = "he"
				global.persona[6] = "him"
				global.persona[7] = "his"
				global.persona[8] = "son"
				break
			case spr_female :
				global.persona[0] = "Jane"
				global.persona[1] = "Female"
				global.persona[2] = "Miss"
				global.persona[3] = "ma'am"
				global.persona[4] = "lady"
				global.persona[5] = "she"
				global.persona[6] = "her"
				global.persona[7] = "hers"
				global.persona[8] = "daughter"
				break
			default :
				global.persona[0] = "Jane"
				global.persona[1] = "Female"
				global.persona[2] = "Miss"
				global.persona[3] = "ma'am"
				global.persona[4] = "lady"
				global.persona[5] = "she"
				global.persona[6] = "her"
				global.persona[7] = "hers"
				global.persona[8] = "daughter"
				break
		}
		
		with instance_create(416, 192, obj_class_button) {
			if class_id == -1 { class_id = 2 }		
		}
		with instance_create(416, 429, obj_class_button) {
			if class_id == -1 { class_id = 1 }		
		}
		with instance_create(416, 666, obj_class_button) {
			if class_id == -1 { class_id = 0 }		
		}
		
		obj_setup.phase = 1
		instance_destroy(obj_charbutton)
	}
} else {
	image_xscale = 1
	image_yscale = 1
}

