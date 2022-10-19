/// @description Check for GUI click

if position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id) {
	// Check for Mouse Enter
	image_index = 1
	
	if mouse_check_button_pressed(mb_left) {
		quest_track(selected_quest)
		instance_destroy(obj_dropdown)
	}
} else {
	image_index = 0
}

// Inherit the parent event
event_inherited();

