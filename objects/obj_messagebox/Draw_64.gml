/// @description  Draw text

draw_set_alpha(1)


draw_self()

draw_set_color(c_white)
draw_set_font(fnt_textbox)

if choices_enabled {
	draw_sprite(spr_choices, 0, x + 318, y-6)
}


x_left = x-300
y_row = y + 20

if batch == -1 {
    for (i = 1; i <= string_length(display_text)-1; i ++) {
        draw_text(x_left, y_row, display_text_list[i])
        
        if display_text_list[i] == "#" || display_text_list[i] == "\n" {
            x_left = x-300
            y_row += 24
        }
        else {
            x_left += 12
        }
    }
}
else if batch_counter <= batch {
	
	if string_counter < string_length(display_text[batch_counter]) && !skipped {
		for (i = 1; i <= string_counter; i ++) {
			draw_text(x_left, y_row, display_text_list[batch_counter, i])
			
			if keyboard_check_pressed(vk_space) {
				string_counter = string_length(display_text[batch_counter])
				i = string_counter
				alarm[1] = 30
				skipped = true
			}
		
			if display_text_list[batch_counter, i] == "#" || display_text_list[batch_counter, i] == "\n" {
				x_left = x-300
				y_row += 24
			}
			else {
				x_left += 12
			}
		}
		if alarm_get(0) == -1 {
			string_counter ++
			alarm_set(0, 2) // type speed
		}
	}
	if string_counter == string_length(display_text[batch_counter]) || skipped {
		for (i = 1; i < string_length(display_text[batch_counter]); i ++) {
	        draw_text(x_left, y_row, display_text_list[batch_counter, i])
        
	        if display_text_list[batch_counter, i] == "\n" || display_text_list[batch_counter, i] == "#" {
	            x_left = x-300
	            y_row += 24
	        }
	        else {
	            x_left += 12
	        }
		}
		
		if keyboard_check_pressed(vk_space) && alarm[1] == -1 && instance_number(obj_choice_button) == 0 && batch_counter < batch {
			batch_counter ++ 
			string_counter = 0
			skipped = false
			if instance_number(obj_nametag) > 0 {
				obj_nametag.batch_counter ++
			}
			alarm[1] = 30
		}
		if keyboard_check_pressed(vk_space) && alarm[1] == -1 && instance_number(obj_choice_button) == 0 && batch_counter == batch {
			instance_destroy(obj_messagebox)
			instance_destroy(obj_nametag)
			global.immobile = false
		}
		else if keyboard_check_pressed(vk_space) && alarm[1] == -1 && instance_number(obj_choice_button) == 0 && batch == 0 {
			instance_destroy(obj_messagebox)
			instance_destroy(obj_nametag)
			global.immobile = false
		}
	}
}

if keyboard_check_pressed(vk_space) && alarm[1] == -1 && instance_number(obj_choice_button) == 0 && batch_counter > batch {
	instance_destroy(obj_messagebox)
	instance_destroy(obj_nametag)
	global.immobile = false
}

draw_sprite(spr_arrow_indicator, 1, x + 260, y + 144)

