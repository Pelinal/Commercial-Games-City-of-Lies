/// @description  Destroy when SPACE is pressed.

global.immobile = true
//if keyboard_check_pressed(vk_space) && batch_counter >= batch {
//	if !choices_enabled {
//		instance_destroy(self)
//	    global.immobile = false
//	}
//} 

//if keyboard_check(vk_escape) { instance_destroy(self) global.immobile = false }

if instance_number(obj_choice_button) > 0 { choices_enabled = true }
else { choices_enabled = false }

// If choices need to occur after certain # of batch messages
//if choices != noone && !choices_enabled && batch_counter >= batch-1 {
	
//	// Create choice buttons
//	y_margin = y + 24
//	for (ii = 0; ii < array_length(choices); ii ++) {
//		if ii < 4 {
//			with instance_create(x + 334, y_margin, obj_choice_button) {
//				if choice_text == -1 { choice_text = obj_messagebox.choices[obj_messagebox.ii] }
//			}
//			y_margin += 32
//		} else {
//			break
//		}
//	}
	
//	choices_enabled = true
//}