/// @description Draw Icon, Name and Amount

// Draw Amount
if slot_type == "gear" {
	current_list = obj_manualinput.gear_list
}
else {
	current_list = obj_manualinput.solite_list
}

if array_length(current_list) > 0 {
	draw_set_alpha(1)
	draw_set_color(c_white)
	draw_set_font(fnt_inventory_12)

	draw_self()

	// Draw Icon
	
	draw_tile(ts_icons_iconset, global.icons[item_id], 0, x, y)

	// Draw Name
	draw_text(x + 48, y + 4, global.library[item_id][0])
	
	// Draw Other
	draw_text(x + 152, y + 4, "x " + string(inventory_fetch(item_id)))
	if inventory_check_equipped(item_id) { draw_text(x + 244, y + 4, "(Equipped)")}
	
}
