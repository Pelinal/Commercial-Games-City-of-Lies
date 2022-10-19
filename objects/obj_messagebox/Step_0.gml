/// @description  Destroy when SPACE is pressed.


if keyboard_check_pressed(vk_space) && batch_counter >= batch {
	if !choices_enabled {
		instance_destroy(self)
	    global.immobile = false
	}
} 

if instance_number(obj_choice_button) > 0 { choices_enabled = true }
else { choices_enabled = false }