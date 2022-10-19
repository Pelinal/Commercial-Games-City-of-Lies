/// @description message_batch(text_list, batch)
/// @param text_list
/// @param  batch
function message_batch(argument0, argument1) {
	// MAX Line size = 50-51 Characters
	
	//instance_destroy(obj_messagebox)
	// For some reason: Mandatory Space at the end of strings ...

	text_list = argument0
	batch = argument1       // -1 means no batch

	for (i = 0; i <= array_length_1d(text_list)-1; i ++) {
	    for (j = 0; j <= string_length(text_list[i]); j++) {
	        text_list_x[i,j] = string_char_at(text_list[i], j)
	    }
	}

	instance_create(960, 896, obj_messagebox) { // CHARACTER LIMIT for 1 line: 62-4 characters
	    obj_messagebox.display_text = text_list
	    obj_messagebox.display_text_list = text_list_x
	    obj_messagebox.batch = batch-1
	}



}
