/// @description  Draw name text

draw_set_alpha(1)
x_draw = 640
y_draw = 848

if string_length(name_list[batch_counter]) >= 7 {
	w_draw = string_length(name_list[batch_counter]) - 7
	draw_sprite_stretched(spr_nametag, 0, x_draw, y_draw, 96 + (15 * w_draw), 48)
}
else {
	draw_sprite(spr_nametag, 0, x_draw, y_draw)
}
draw_set_color(c_white)
draw_set_font(fnt_inventory_20)

x_left = x_draw + 15
y_row = y_draw + 10

if batch == -1 {
    draw_text(x_left, y_row, string_hash_to_newline(name_list[i]))
}
else if batch_counter <= batch {
    draw_text(x_left, y_row, string_hash_to_newline(name_list[batch_counter]))
    if keyboard_check_pressed(vk_space) batch_counter ++
}

