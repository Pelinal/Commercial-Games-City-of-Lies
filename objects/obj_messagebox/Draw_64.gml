/// @description  Draw text

draw_set_alpha(1)

x_draw = 960
y_draw = 896
draw_sprite(spr_messagebox, 0, x_draw, y_draw)

draw_set_color(c_white)
draw_set_font(fnt_textbox)



x_left = x_draw-300
y_row = y_draw + 20

if batch == -1 {
    for (i = 1; i <= string_length(display_text)-1; i ++) {
        draw_text(x_left, y_row, string_hash_to_newline(display_text_list[i]))
        
        if display_text_list[i] == "#" {
            x_left = x_draw-300
            y_row += 24
        }
        else {
            x_left += 12
        }
    }
}
else if batch_counter <= batch {
	
	if string_counter < string_length(display_text[batch_counter]) {
		for (i = 1; i <= string_counter; i ++) {
			draw_text(x_left, y_row, display_text_list[batch_counter, i])
		
			if display_text_list[batch_counter, i] == "#" || display_text_list[batch_counter, i] == "\n" {
				x_left = x_draw-300
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
	if string_counter == string_length(display_text[batch_counter]) {
		for (i = 1; i < string_length(display_text[batch_counter]); i ++) {
	        draw_text(x_left, y_row, string_hash_to_newline(display_text_list[batch_counter, i]))
        
	        if display_text_list[batch_counter, i] == "#" {
	            x_left = x_draw-300
	            y_row += 24
	        }
	        else {
	            x_left += 12
	        }
		}
	}
	

    if keyboard_check_pressed(vk_space) { batch_counter ++ string_counter = 0 }

}



/*while (i <= string_length(display_text)-1) {
    
    draw_text(x_left, y_row, display_text_list[i])
    
    if i % 50 == 0 and i > 0 {
        if display_text_list[i-1] == " " ||
           display_text_list[i+1] == " " ||
           display_text_list[i] == " "   {
            draw_text(x_left, y_row, "#")
            x_left = x_draw-150
            y_row += 12
        }
    }
    
    
    
    
    
    
    if display_text_list[i] == "#" {
        x_left = x_draw-150
        y_row += 12
    }
    else {
        x_left += 6
    }
    
}*/

//draw_text(x_draw - 150, y_draw + 10, display_text)
draw_sprite(spr_arrow_indicator, 1, x_draw + 260, y_draw + 144)


/* */
/*  */
