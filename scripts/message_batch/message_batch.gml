/// @description message(text_list, batch)
function message(text_list, batch=1, show_textbox=true) {
	/// @param TextList
	/// @param Batch
	/// @param Textbox(true/false)
	// MAX Line size = 50-51 Characters
	
	//instance_destroy(obj_messagebox)
	// For some reason: Mandatory Space at the end of strings ...

	for (i = 0; i < array_length(text_list); i ++) {
	    for (j = 0; j <= string_length(text_list[i]); j++) {
	        text_list_x[i,j] = string_char_at(text_list[i], j)
	    }
	}
	
	if show_textbox {
		instance_create(960, 896, obj_messagebox) { // CHARACTER LIMIT for 1 line: 62-4 characters
		    obj_messagebox.display_text = text_list
		    obj_messagebox.display_text_list = text_list_x
		    obj_messagebox.batch = batch-1
		}
	} else {
		instance_create(960, 896, obj_messagebox) { // CHARACTER LIMIT for 1 line: 62-4 characters
		    obj_messagebox.display_text = text_list
		    obj_messagebox.display_text_list = text_list_x
		    obj_messagebox.batch = batch-1
			
			sprite_index = noone
		}
	}
}
