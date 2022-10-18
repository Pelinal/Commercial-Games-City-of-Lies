/// @description Draw Overview

draw_x = 150
draw_y = 0
draw_sprite_stretched(sprite_to_draw, 0, draw_x, draw_y, 1620, 1080)
draw_set_alpha(1)
draw_set_colour(c_white)
draw_set_font(fnt_questlog_large)
draw_set_halign(fa_right)
draw_text(1720, 48, shop_name)
draw_set_halign(fa_left)

// Gold, Other Currencies (TBA), etc.
draw_set_font(fnt_inventory_small)
draw_tile(ts_icons_iconset_64, global.icons[0], 0, draw_x + 2.25*384, draw_y + 2.25*444)
draw_text(draw_x + 2.25*384+72, draw_y + 2.25*444+12, string(global.gold))

if overview_id != -1 {
	// Name
	draw_set_colour(c_white)
	draw_set_font(fnt_inventory_large)
	draw_text(draw_x + 2.25*384, draw_y + 2.25*160, global.library[overview_id][0])
	
	if current_tab == "craft" {
		// Draw Craft Amount
		draw_set_halign(fa_center)
		draw_text(draw_x + 2.25*312, draw_y + 2.25*444, string(craft_amount))
		draw_set_halign(fa_left)
	}
	
	// Icon
	if inventory_is_enchanted(overview_id) { draw_tile(ts_icons_iconset_64, 143, 0, draw_x + 2.25*644, draw_y + 2.25*160) }
	draw_tile(ts_icons_iconset_64, global.icons[overview_id], 0, draw_x + 2.25*644, draw_y + 2.25*160)
	
	// Description
	draw_set_font(fnt_inventory_small)
	draw_text(draw_x + 2.25*384, draw_y + 2.25*192, global.library[overview_id][1])
	
	// Stats
	if current_tab == "sell" {
		overview_price = trade_price(overview_id, "sell")
		if category == "consumables" {		 // Index 0: ID, Index 1: Effect, Index 2: Effect Value, Index 3: Price
			for (i = 0; i < array_length(global.c_library); i ++) {
				if global.c_library[i][0] == overview_id {
					draw_text(draw_x + 2.25*384, draw_y + 2.25*256, "Effect:" + global.c_library[i][1])
					draw_text(draw_x + 2.25*384, draw_y + 2.25*288, "Strength: " + string(global.c_library[i][2]) + " PTS")
					draw_text(draw_x + 2.25*384, draw_y + 2.25*320, "Sell For: " + string(overview_price) + " Gold")
				
				}
			}
		}
		else if category == "weapons" {		 // Index 0: ID, Index 1: Type, Index 2: Damage, Index 3: Price
			for (i = 0; i < array_length(global.w_library); i ++) {
				if global.w_library[i][0] == overview_id {
					draw_text(draw_x + 2.25*384, draw_y + 2.25*256, "Type: " + global.w_library[i][1])
					draw_text(draw_x + 2.25*384, draw_y + 2.25*288, "Damage: " + string(global.w_library[i][2]) + " PTS")
					draw_text(draw_x + 2.25*384, draw_y + 2.25*320, "Sell For: " + string(overview_price) + " Gold")
				
				}
			}
		}
		else if category == "armours" {		 // Index 0: ID, Index 1: Type, Index 2: Armour Rating, Index 3: Price
			for (i = 0; i < array_length(global.ar_library); i ++) {
				if global.ar_library[i][0] == overview_id {
					draw_text(draw_x + 2.25*384, draw_y + 2.25*256, "Type: " + global.ar_library[i][1])
					draw_text(draw_x + 2.25*384, draw_y + 2.25*288, "Slot: " + string(global.ar_library[i][4]))
					draw_text(draw_x + 2.25*384, draw_y + 2.25*320, "Armour: " + string(global.ar_library[i][2]) + " PTS")
					draw_text(draw_x + 2.25*384, draw_y + 2.25*352, "Sell For: " + string(overview_price) + " Gold")
				}
			}
		}
		else if category == "accessories" {		 // Index 0: ID, Index 1: Type, Index 2: Effect, Index 3: Price
			for (i = 0; i < array_length(global.ac_library); i ++) {
				if global.ac_library[i][0] == overview_id {
					draw_text(draw_x + 2.25*384, draw_y + 2.25*256, "Type: " + global.ac_library[i][1])
					draw_text(draw_x + 2.25*384, draw_y + 2.25*288, "Effect: " + string(global.ac_library[i][2]))
					draw_text(draw_x + 2.25*384, draw_y + 2.25*320, "Sell For: " + string(overview_price) + " Gold")
				
				}
			}
		}
		else if category == "materials" {		 // Index 0: ID, Index 1: Type, Index 2: Price
			for (i = 0; i < array_length(global.m_library); i ++) {
				if global.m_library[i][0] == overview_id {
					draw_text(draw_x + 2.25*384, draw_y + 2.25*256, "Used For: " + global.m_library[i][1])
					draw_text(draw_x + 2.25*384, draw_y + 2.25*288, "Sell For: " + string(overview_price) + " Gold")		
				}
			}
		}
	}
	else if current_tab == "buy" {
		overview_price = trade_price(overview_id, "buy")
		if category == "consumables" {		 // Index 0: ID, Index 1: Effect, Index 2: Effect Value, Index 3: Price
			for (i = 0; i < array_length(global.c_library); i ++) {
				if global.c_library[i][0] == overview_id {
					draw_text(draw_x + 2.25*384, draw_y + 2.25*256, "Effect:" + global.c_library[i][1])
					draw_text(draw_x + 2.25*384, draw_y + 2.25*288, "Strength: " + string(global.c_library[i][2]) + " PTS")
					draw_text(draw_x + 2.25*384, draw_y + 2.25*320, "Buy For: " + string(overview_price) + " Gold")
				
				}
			}
		}
		else if category == "weapons" {		 // Index 0: ID, Index 1: Type, Index 2: Damage, Index 3: Price
			for (i = 0; i < array_length(global.w_library); i ++) {
				if global.w_library[i][0] == overview_id {
					draw_text(draw_x + 2.25*384, draw_y + 2.25*256, "Type: " + global.w_library[i][1])
					draw_text(draw_x + 2.25*384, draw_y + 2.25*288, "Damage: " + string(global.w_library[i][2]) + " PTS")
					draw_text(draw_x + 2.25*384, draw_y + 2.25*320, "Buy For: " + string(overview_price) + " Gold")
				
				}
			}
		}
		else if category == "armours" {		 // Index 0: ID, Index 1: Type, Index 2: Armour Rating, Index 3: Price
			for (i = 0; i < array_length(global.ar_library); i ++) {
				if global.ar_library[i][0] == overview_id {
					draw_text(draw_x + 2.25*384, draw_y + 2.25*256, "Type: " + global.ar_library[i][1])
					draw_text(draw_x + 2.25*384, draw_y + 2.25*288, "Slot: " + string(global.ar_library[i][4]))
					draw_text(draw_x + 2.25*384, draw_y + 2.25*320, "Armour: " + string(global.ar_library[i][2]) + " PTS")
					draw_text(draw_x + 2.25*384, draw_y + 2.25*352, "Buy For: " + string(overview_price) + " Gold")
				}
			}
		}
		else if category == "accessories" {		 // Index 0: ID, Index 1: Type, Index 2: Effect, Index 3: Price
			for (i = 0; i < array_length(global.ac_library); i ++) {
				if global.ac_library[i][0] == overview_id {
					draw_text(draw_x + 2.25*384, draw_y + 2.25*256, "Type: " + global.ac_library[i][1])
					draw_text(draw_x + 2.25*384, draw_y + 2.25*288, "Effect: " + string(global.ac_library[i][2]))
					draw_text(draw_x + 2.25*384, draw_y + 2.25*320, "Buy For: " + string(overview_price) + " Gold")
				
				}
			}
		}
		else if category == "materials" {		 // Index 0: ID, Index 1: Type, Index 2: Price
			for (i = 0; i < array_length(global.m_library); i ++) {
				if global.m_library[i][0] == overview_id {
					draw_text(draw_x + 2.25*384, draw_y + 2.25*256, "Used For: " + global.m_library[i][1])
					draw_text(draw_x + 2.25*384, draw_y + 2.25*288, "Buy For: " + string(overview_price) + " Gold")		
				}
			}
		}
	}
	else if current_tab == "craft" {
		overview_price = trade_price(overview_id, "craft")
		
		for (i = 0; i < array_length(recipe_list); i ++) {
			if recipe_list[i][0] == overview_id {
				overview_row = recipe_list[i]
			}
		}
		
		if crafting_category == "alchemy" { cc[0] = 1 cc[1] = 1 cc[2] = 1 }
		else if crafting_category == "enchanting" { cc[0] = 1 cc[1] = 1 cc[2] = 1 ench_selected_items[0] = overview_row[1] }
		else if crafting_category == "smithing" { cc = crafting_craft_cost(overview_id) }
		
		if crafting_category != "enchanting" {
			// Draw Ingredient Icons
			
			draw_tile(ts_icons_iconset_64, global.icons[overview_row[1]], 0, draw_x + 2.25*292, draw_y + 2.25*128)
			draw_tile(ts_icons_iconset_64, global.icons[overview_row[2]], 0, draw_x + 2.25*292, draw_y + 2.25*248)
			draw_tile(ts_icons_iconset_64, global.icons[overview_row[3]], 0, draw_x + 2.25*292, draw_y + 2.25*368)
			
			// Draw Text
			draw_set_halign(fa_center)
			draw_set_font(fnt_trademenu_small)
			draw_text(draw_x + 2.25*312, draw_y + 2.25*112, global.library[overview_row[1]][0])
			draw_text(draw_x + 2.25*312, draw_y + 2.25*232, global.library[overview_row[2]][0])
			draw_text(draw_x + 2.25*312, draw_y + 2.25*352, global.library[overview_row[3]][0])
			draw_set_font(fnt_inventory_small)
			draw_text(draw_x + 2.25*314, draw_y + 2.25*160, string(inventory_fetch(overview_row[1])) + " / " + string(craft_amount*cc[0]))
			draw_text(draw_x + 2.25*314, draw_y + 2.25*288, string(inventory_fetch(overview_row[2])) + " / " + string(craft_amount*cc[1]))
			draw_text(draw_x + 2.25*314, draw_y + 2.25*400, string(inventory_fetch(overview_row[3])) + " / " + string(craft_amount*cc[2]))
			draw_set_halign(fa_left)
		}
		else if crafting_category == "enchanting" && ench_selected_items[1] == -1 && ench_selected_items[2] == -1 {
			draw_tile(ts_icons_iconset_64, global.icons[overview_row[1]], 0, draw_x + 2.25*292, draw_y + 2.25*128)
			draw_tile(ts_icons_iconset_64, global.icons[4], 0, draw_x + 2.25*292, draw_y + 2.25*248)
			draw_tile(ts_icons_iconset_64, global.icons[24], 0, draw_x + 2.25*292, draw_y + 2.25*368)
			
			// Draw Text
			draw_set_halign(fa_center)
			draw_set_font(fnt_trademenu_small)
			draw_text(draw_x + 2.25*312, draw_y + 2.25*112, global.library[overview_row[1]][0])
			draw_text(draw_x + 2.25*312, draw_y + 2.25*232, "Click to Add")
			draw_text(draw_x + 2.25*312, draw_y + 2.25*352, "Click to Add")
			draw_set_font(fnt_inventory_small)
			draw_text(draw_x + 2.25*314, draw_y + 2.25*160, string(inventory_fetch(overview_row[1])) + " / " + string(craft_amount*cc[0]))
			//draw_text(draw_x + 2.25*314, draw_y + 2.25*288, string(inventory_fetch(ench_selected_items[0])) + " / " + string(craft_amount*cc[1]))
			//draw_text(draw_x + 2.25*314, draw_y + 2.25*400, string(inventory_fetch(overview_row[3])) + " / " + string(craft_amount*cc[2]))
			draw_set_halign(fa_left)
		}
		else if crafting_category == "enchanting" && ench_selected_items[1] != -1 && ench_selected_items[2] == -1 {
			draw_tile(ts_icons_iconset_64, global.icons[overview_row[1]], 0, draw_x + 2.25*292, draw_y + 2.25*128)
			draw_tile(ts_icons_iconset_64, global.icons[ench_selected_items[1]], 0, draw_x + 2.25*292, draw_y + 2.25*248)
			draw_tile(ts_icons_iconset_64, global.icons[24], 0, draw_x + 2.25*292, draw_y + 2.25*368)
			
			// Draw Text
			draw_set_halign(fa_center)
			draw_set_font(fnt_trademenu_small)
			draw_text(draw_x + 2.25*312, draw_y + 2.25*112, global.library[overview_row[1]][0])
			draw_text(draw_x + 2.25*312, draw_y + 2.25*232, global.library[ench_selected_items[1]][0])
			draw_text(draw_x + 2.25*312, draw_y + 2.25*352, "Click to Add")
			draw_set_font(fnt_inventory_small)
			draw_text(draw_x + 2.25*314, draw_y + 2.25*160, string(inventory_fetch(overview_row[1])) + " / " + string(craft_amount*cc[0]))
			draw_text(draw_x + 2.25*314, draw_y + 2.25*288, string(inventory_fetch(ench_selected_items[1])) + " / " + string(craft_amount*cc[1]))
			//draw_text(draw_x + 2.25*314, draw_y + 2.25*400, string(inventory_fetch(overview_row[3])) + " / " + string(craft_amount*cc[2]))
			draw_set_halign(fa_left)
		}
		else if crafting_category == "enchanting" && ench_selected_items[1] == -1 && ench_selected_items[2] != -1 {
			draw_tile(ts_icons_iconset_64, global.icons[overview_row[1]], 0, draw_x + 2.25*292, draw_y + 2.25*128)
			draw_tile(ts_icons_iconset_64, global.icons[4], 0, draw_x + 2.25*292, draw_y + 2.25*248)
			draw_tile(ts_icons_iconset_64, global.icons[ench_selected_items[2]], 0, draw_x + 2.25*292, draw_y + 2.25*368)
			
			// Draw Text
			draw_set_halign(fa_center)
			draw_set_font(fnt_trademenu_small)
			draw_text(draw_x + 2.25*312, draw_y + 2.25*112, global.library[overview_row[1]][0])
			//draw_text(draw_x + 2.25*312, draw_y + 2.25*232, global.library[ench_selected_items[1]][0])
			draw_text(draw_x + 2.25*312, draw_y + 2.25*352, global.library[ench_selected_items[2]][0])
			draw_set_font(fnt_inventory_small)
			draw_text(draw_x + 2.25*314, draw_y + 2.25*160, string(inventory_fetch(overview_row[1])) + " / " + string(craft_amount*cc[0]))
			//draw_text(draw_x + 2.25*314, draw_y + 2.25*288, string(inventory_fetch(ench_selected_items[1])) + " / " + string(craft_amount*cc[1]))
			draw_text(draw_x + 2.25*314, draw_y + 2.25*400, string(inventory_fetch(ench_selected_items[2])) + " / " + string(craft_amount*cc[2]))
			draw_set_halign(fa_left)
		}
		else if crafting_category == "enchanting" && ench_selected_items[1] != -1 && ench_selected_items[2] != -1 {
			draw_tile(ts_icons_iconset_64, global.icons[overview_row[1]], 0, draw_x + 2.25*292, draw_y + 2.25*128)
			draw_tile(ts_icons_iconset_64, global.icons[ench_selected_items[1]], 0, draw_x + 2.25*292, draw_y + 2.25*248)
			draw_tile(ts_icons_iconset_64, global.icons[ench_selected_items[2]], 0, draw_x + 2.25*292, draw_y + 2.25*368)
			
			// Draw Text
			draw_set_halign(fa_center)
			draw_set_font(fnt_trademenu_small)
			draw_text(draw_x + 2.25*312, draw_y + 2.25*112, global.library[overview_row[1]][0])
			draw_text(draw_x + 2.25*312, draw_y + 2.25*232, global.library[ench_selected_items[1]][0])
			draw_text(draw_x + 2.25*312, draw_y + 2.25*352, global.library[ench_selected_items[2]][0])
			draw_set_font(fnt_inventory_small)
			draw_text(draw_x + 2.25*314, draw_y + 2.25*160, string(inventory_fetch(overview_row[1])) + " / " + string(craft_amount*cc[0]))
			draw_text(draw_x + 2.25*314, draw_y + 2.25*288, string(inventory_fetch(ench_selected_items[1])) + " / " + string(craft_amount*cc[1]))
			draw_text(draw_x + 2.25*314, draw_y + 2.25*400, string(inventory_fetch(ench_selected_items[2])) + " / " + string(craft_amount*cc[2]))
			draw_set_halign(fa_left)
		}
		// Draw Details
		if crafting_category == "alchemy" {
			for (i = 0; i < array_length(global.c_library); i ++) {
				if global.c_library[i][0] == overview_id {
					draw_text(draw_x + 2.25*384, draw_y + 2.25*256, "Effect: " + global.c_library[i][1])
					draw_text(draw_x + 2.25*384, draw_y + 2.25*288, "Strength: " + string(global.c_library[i][2]) + " PTS")
					draw_text(draw_x + 2.25*384, draw_y + 2.25*320, "Craft Cost: " + string(overview_price) + " Gold")
				}
			}
		}
		else if crafting_category == "smithing" {
			for (i = 0; i < array_length(global.ar_library); i ++) {
				if global.ar_library[i][0] == overview_id {
					draw_text(draw_x + 2.25*384, draw_y + 2.25*256, "Type: " + global.ar_library[i][1])
					draw_text(draw_x + 2.25*384, draw_y + 2.25*288, "Slot: " + string(global.ar_library[i][4]))
					draw_text(draw_x + 2.25*384, draw_y + 2.25*320, "Armour: " + string(global.ar_library[i][2]) + " PTS")
					draw_text(draw_x + 2.25*384, draw_y + 2.25*352, "Craft Cost: " + string(overview_price) + " Gold")
				}
			}
			for (i = 0; i < array_length(global.w_library); i ++) {
				if global.w_library[i][0] == overview_id {
					draw_text(draw_x + 2.25*384, draw_y + 2.25*256, "Type: " + global.w_library[i][1])
					draw_text(draw_x + 2.25*384, draw_y + 2.25*288, "Damage: " + string(global.w_library[i][2]) + " PTS")
					draw_text(draw_x + 2.25*384, draw_y + 2.25*320, "Craft Cost: " + string(overview_price) + " Gold")
				
				}
			}
			for (i = 0; i < array_length(global.ac_library); i ++) {
				if global.ac_library[i][0] == overview_id {
					draw_text(draw_x + 2.25*384, draw_y + 2.25*256, "Type: " + global.ac_library[i][1])
					draw_text(draw_x + 2.25*384, draw_y + 2.25*288, "Effect: " + string(global.ac_library[i][2]))
					draw_text(draw_x + 2.25*384, draw_y + 2.25*320, "Craft Cost: " + string(overview_price) + " Gold")
				
				}
			}
		}
		if crafting_category == "enchanting" {
			for (i = 0; i < array_length(global.m_library); i ++) {
				if global.m_library[i][0] == overview_id {
					draw_text(draw_x + 2.25*384, draw_y + 2.25*256, "Used For: " + global.m_library[i][1])
					draw_text(draw_x + 2.25*384, draw_y + 2.25*288, "Craft Cost: " + string(overview_price) + " Gold")		
				}
			}
		}
	}
}