/// @description Draw Icon, Name and Amount

draw_x = (obj_trademenu.draw_x) + (x - obj_trademenu.x) + 512

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
	draw_set_font(fnt_inventory_small)

	draw_sprite_stretched(spr_button_288_32, anim_index, draw_x, draw_y, 648, 72)
	// Draw Icon
	
	draw_tile(ts_icons_iconset_64, global.icons[item_id], 0, draw_x, draw_y)

	// Draw Name
	draw_text(draw_x + 108, draw_y + 9, global.library[item_id][0])
	
	// Draw Other
	draw_text(draw_x + 372, draw_y + 9, "x " + string(inventory_fetch(item_id)))
	if inventory_check_equipped(item_id) { draw_text(draw_x + 549, draw_y + 9, "(Equipped)")}
	
}
