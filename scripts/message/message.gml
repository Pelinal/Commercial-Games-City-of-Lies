/// @description message(text)
/// @param text
function message_old(argument0) {
	// MAX Line size = 50-51 Characters

	text = argument0
	text_list = array_create(string_length(text))
	//batch = argument1
	//skip_space = false

	/*instance_create(view_xview[0]+427, view_yview[0]+388, obj_messagebox) { // CHARACTER LIMIT for 1 line: 62-4 characters
	    obj_messagebox.display_text = text
	}*/

	for (i = 0; i <= string_length(text)-1; i ++) {
	    /*
	    if text_list[i] == "#" {
	        skip_space = true
	        text_list[i] = string_char_at(text, i)
	    }
	    // List add conditions
	    if text_list[i] == " " && !skip_space {
	        text_list[i] = string_char_at(text, i)
	    }
	    else if text_list[i] != " " && text_list[i] != "#" {
	        text_list[i] = string_char_at(text, i)
	        skip_space = false
	    } 
	    */
    
	    text_list[i] = string_char_at(text, i)
	}

	instance_create(__view_get( e__VW.XView, 0 )+427, __view_get( e__VW.YView, 0 )+388, obj_messagebox) { // CHARACTER LIMIT for 1 line: 62-4 characters
	    obj_messagebox.display_text = text
	    obj_messagebox.display_text_list = text_list
	}



}
