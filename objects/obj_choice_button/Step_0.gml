/// @description Animate + Click Checks

if position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id) {
	// Check for Mouse Enter
	image_index = 1
	
	if mouse_check_button_pressed(mb_left) {
		activator.choice_result = choice_text
		with obj_messagebox {
			if batch_counter >= batch {
				global.immobile = false
				instance_destroy(obj_messagebox)
			} else {
				batch_counter ++ string_counter = 0
			}
		}
		instance_destroy(obj_choice_button)
	}
} else {
	image_index = 0
}

if keyboard_check(vk_escape) {
	instance_destroy(self)
}