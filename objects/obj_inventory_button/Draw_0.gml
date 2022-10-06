/// @description Draw Icon, Name and Amount

// Draw Amount
if global.current_menu == "consumables"			{ current_list = global.consumables }
else if global.current_menu == "weapons"		{ current_list = global.weapons     }
else if global.current_menu == "armours"		{ current_list = global.armours     }
else if global.current_menu == "accessories"	{ current_list = global.accessories }
else if global.current_menu == "key items"		{ current_list = global.keyitems    }
else if global.current_menu == "materials"		{ current_list = global.materials   }

if array_length(current_list) > 0 {

	draw_self()

	draw_set_alpha(1)
	draw_set_color(c_white)
	draw_set_font(fnt_inventory_12)

	// Draw Icon
	draw_tile(ts_icons_iconset, global.icons[item_id], 0, x, y)

	// Draw Name
	draw_text(x + 48, y + 4, global.library[item_id][0])

	draw_text(x + 152, y + 4, "x " + string(current_list[row_id][1]))	

	if inventory_check_equipped(item_id) { draw_text(x + 220, y + 4, "(Equipped)") }
}