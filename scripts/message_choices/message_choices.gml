// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function message_choices(choices=["Yes", "No"], activator){
	// Displays list of dialogue choices
	obj_messagebox.choices_enabled = true
	obj_messagebox.choices = choices
	// Create choice buttons
	with obj_messagebox {
		y_margin = y + 24
		for (ii = 0; ii < array_length(choices); ii ++) {
			if ii < 4 {
				with instance_create(x + 334, y_margin, obj_choice_button) {
					if choice_text == -1 { choice_text = obj_messagebox.choices[obj_messagebox.ii] }
				}
				y_margin += 32
			}
		}
	}
	
	obj_choice_button.activator = activator // Takes ID of activating object
}