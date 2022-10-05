/// @description  Draw name text

draw_set_alpha(1)
draw_self()

draw_set_color(c_white)
draw_set_font(fnt_textbox_10)

x_left = x+ 4
y_row = y + 4

if batch == -1 {
    draw_text(x_left, y_row, string_hash_to_newline(name_list[i]))
}
else if batch_counter <= batch {
    draw_text(x_left, y_row, string_hash_to_newline(name_list[batch_counter]))
    if keyboard_check_pressed(vk_space) batch_counter ++
}

