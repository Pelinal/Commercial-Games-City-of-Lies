/// @description Step

if obj_inventory.visible || obj_questlog.visible || obj_statsmenu.visible || instance_number(obj_trademenu) > 0 {
	visible = false
} else {
	visible = true
}

if quest_tracked_id() == noone {
	visible = false	
}

if position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id) {
	// Check for Mouse Enter
	
	if mouse_check_button_pressed(mb_left) {
		// Check for Mouse Left Pressed
		if mode == "closed" {
			mode = "expanded"
		} else {
			mode = "closed"
		}
	}
	
}