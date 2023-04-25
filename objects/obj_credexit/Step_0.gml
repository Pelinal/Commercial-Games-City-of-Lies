/// @description Insert description here
// You can write your code in this editor

if global.immobile == true {
	visible = false
}

if room != rm_setup && room != rm_init && room != rm_intro && global.immobile == false {
	visible = true
}

if position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id) {
	// Check for Mouse Enter
	image_index = 1
	
	if mouse_check_button_pressed(mb_left) {
		if type == "Exit" {
			game_end()
		} else if type == "Credits" {
			if instance_number(obj_credits) == 0 {
				instance_create(960, 540, obj_credits)
			}
		}
	}
} else {
	image_index = 0
}





