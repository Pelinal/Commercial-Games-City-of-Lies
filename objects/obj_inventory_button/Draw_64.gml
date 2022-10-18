/// @description Draw Icon, Name and Amount


// Draw Amount
if global.current_menu == "consumables"			{ current_list = global.consumables }
else if global.current_menu == "weapons"		{ current_list = global.weapons     }
else if global.current_menu == "armours"		{ current_list = global.armours     }
else if global.current_menu == "accessories"	{ current_list = global.accessories }
else if global.current_menu == "key items"		{ current_list = global.keyitems    }
else if global.current_menu == "materials"		{ current_list = global.materials   }

if array_length(current_list) > 0 {

	draw_sprite_stretched(spr_button_288_32, anim_index, x_draw, y_draw, 640, 72)

	draw_set_alpha(1)
	draw_set_color(c_white)
	draw_set_font(fnt_inventory_small)

	// Draw Icon
	if inventory_is_enchanted(item_id) { draw_tile(ts_icons_iconset_64, 143, 0, x_draw, y_draw) }
	draw_tile(ts_icons_iconset_64, global.icons[item_id], 0, x_draw, y_draw)

	// Draw Name
	draw_text(x_draw + 106, y_draw + 8, global.library[item_id][0])

	draw_text(x_draw + 427, y_draw + 8, "x " + string(current_list[row_id][1]))	

	if inventory_check_equipped(item_id) { draw_text(x_draw + 488, y_draw + 8, "(Equipped)") }
}
