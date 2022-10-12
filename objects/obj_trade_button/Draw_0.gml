/// @description Draw Icon, Name and Amount

// Draw Amount
if obj_trademenu.current_tab == "sell" {
	current_list = obj_trademenu.pop_list
}
else if obj_trademenu.current_tab == "buy" {
	current_list = obj_trademenu.stock_list
}

if array_length(current_list) > 0 {

	draw_self()

	draw_set_alpha(1)
	draw_set_color(c_white)
	draw_set_font(fnt_inventory_12)

	// Draw Icon
	draw_tile(ts_icons_iconset, global.icons[item_id], 0, x, y)

	// Draw Name
	draw_text(x + 48, y + 4, global.library[item_id][0])
	
	if obj_trademenu.current_tab == "buy" {
		draw_text(x + 152, y + 4, "x " + string(current_list[row_id][1]))	
		//if inventory_check_equipped(item_id) { draw_text(x + 220, y + 4, "(Equipped)")}
	}
	else if obj_trademenu.current_tab == "sell" {
		draw_text(x + 152, y + 4, "x " + string(inventory_fetch(item_id)))
		if inventory_check_equipped(item_id) { draw_text(x + 220, y + 4, "(Equipped)")}
	}
}
