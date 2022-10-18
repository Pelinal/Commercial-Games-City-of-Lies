/// @description  Scrolling and Active Icon

if quest_tracked(quest_id) { tracked = 1 }
else { tracked = 0 }

if obj_questlog.scroll {
	if mouse_wheel_up() { y -= 72 } 
	else if mouse_wheel_down() { y += 72 }
}

//if y < (obj_questlog.y + 888) || y > (obj_questlog.y + 100)  {
//	visible = false
//} else { visible = true }

if position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id) {
	// Check for Mouse Enter
	image_index = 1
} else {
	image_index = 0
}