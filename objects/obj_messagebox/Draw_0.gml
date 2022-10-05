/// @description  Draw text

draw_set_alpha(1)
draw_self()

draw_set_color(c_white)
draw_set_font(fnt_textbox_10)



x_left = x-150
y_row = y + 10

if batch == -1 {
    for (i = 1; i <= string_length(display_text)-1; i ++) {
        draw_text(x_left, y_row, string_hash_to_newline(display_text_list[i]))
        
        if display_text_list[i] == "#" {
            x_left = x-150
            y_row += 12
        }
        else {
            x_left += 6
        }
    }
}
else if batch_counter <= batch {
    for (i = 1; i < string_length(display_text[batch_counter]); i ++) {
        draw_text(x_left, y_row, string_hash_to_newline(display_text_list[batch_counter, i]))
        
        if display_text_list[batch_counter, i] == "#" {
            x_left = x-150
            y_row += 12
        }
        else {
            x_left += 6
        }
    }
    if keyboard_check_pressed(vk_space) batch_counter ++

}



/*while (i <= string_length(display_text)-1) {
    
    draw_text(x_left, y_row, display_text_list[i])
    
    if i % 50 == 0 and i > 0 {
        if display_text_list[i-1] == " " ||
           display_text_list[i+1] == " " ||
           display_text_list[i] == " "   {
            draw_text(x_left, y_row, "#")
            x_left = x-150
            y_row += 12
        }
    }
    
    
    
    
    
    
    if display_text_list[i] == "#" {
        x_left = x-150
        y_row += 12
    }
    else {
        x_left += 6
    }
    
}*/

//draw_text(x - 150, y + 10, display_text)
draw_sprite(spr_arrow_indicator, 1, x + 130, y + 72)


/* */
/*  */
