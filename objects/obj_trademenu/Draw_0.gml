/// @description Draw Overview

draw_self()
draw_set_alpha(1)
draw_set_colour(c_white)

// Gold, Other Currencies (TBA), etc.
draw_set_font(fnt_inventory_12)
draw_tile(ts_icons_iconset, global.icons[0], 0, x + 384, y + 390)
draw_text(x + 384+32, y + 394, string(global.gold))

if overview_id != -1 {
	// Name
	draw_set_colour(c_white)
	draw_set_font(fnt_inventory_20)
	draw_text(x + 384, y + 160, global.library[overview_id][0])
	
	// Icon
	draw_tile(ts_icons_iconset, global.icons[overview_id], 0, x + 644, y + 160)
	
	// Description
	draw_set_font(fnt_inventory_12)
	draw_text(x + 384, y + 192, global.library[overview_id][1])
	
	// Stats
	if current_tab == "sell" {
		overview_price = trade_price(overview_id, "sell")
		if category == "consumables" {		 // Index 0: ID, Index 1: Effect, Index 2: Effect Value, Index 3: Price
			for (i = 0; i < array_length(global.c_library); i ++) {
				if global.c_library[i][0] == overview_id {
					draw_text(x + 384, y + 256, "Effect:" + global.c_library[i][1])
					draw_text(x + 384, y + 288, "Strength: " + string(global.c_library[i][2]) + " PTS")
					draw_text(x + 384, y + 320, "Sell For: " + string(overview_price) + " Gold")
				
				}
			}
		}
		else if category == "weapons" {		 // Index 0: ID, Index 1: Type, Index 2: Damage, Index 3: Price
			for (i = 0; i < array_length(global.w_library); i ++) {
				if global.w_library[i][0] == overview_id {
					draw_text(x + 384, y + 256, "Type: " + global.w_library[i][1])
					draw_text(x + 384, y + 288, "Damage: " + string(global.w_library[i][2]) + " PTS")
					draw_text(x + 384, y + 320, "Sell For: " + string(overview_price) + " Gold")
				
				}
			}
		}
		else if category == "armours" {		 // Index 0: ID, Index 1: Type, Index 2: Armour Rating, Index 3: Price
			for (i = 0; i < array_length(global.ar_library); i ++) {
				if global.ar_library[i][0] == overview_id {
					draw_text(x + 384, y + 256, "Type: " + global.ar_library[i][1])
					draw_text(x + 384, y + 288, "Slot: " + string(global.ar_library[i][4]))
					draw_text(x + 384, y + 320, "Armour: " + string(global.ar_library[i][2]) + " PTS")
					draw_text(x + 384, y + 352, "Sell For: " + string(overview_price) + " Gold")
				}
			}
		}
		else if category == "accessories" {		 // Index 0: ID, Index 1: Type, Index 2: Effect, Index 3: Price
			for (i = 0; i < array_length(global.ac_library); i ++) {
				if global.ac_library[i][0] == overview_id {
					draw_text(x + 384, y + 256, "Type: " + global.ac_library[i][1])
					draw_text(x + 384, y + 288, "Effect: " + string(global.ac_library[i][2]))
					draw_text(x + 384, y + 320, "Sell For: " + string(overview_price) + " Gold")
				
				}
			}
		}
		else if category == "materials" {		 // Index 0: ID, Index 1: Type, Index 2: Price
			for (i = 0; i < array_length(global.m_library); i ++) {
				if global.m_library[i][0] == overview_id {
					draw_text(x + 384, y + 256, "Used For: " + global.m_library[i][1])
					draw_text(x + 384, y + 288, "Sell For: " + string(overview_price) + " Gold")		
				}
			}
		}
	}
	else if current_tab == "buy" {
		overview_price = trade_price(overview_id, "buy")
		if category == "consumables" {		 // Index 0: ID, Index 1: Effect, Index 2: Effect Value, Index 3: Price
			for (i = 0; i < array_length(global.c_library); i ++) {
				if global.c_library[i][0] == overview_id {
					draw_text(x + 384, y + 256, "Effect:" + global.c_library[i][1])
					draw_text(x + 384, y + 288, "Strength: " + string(global.c_library[i][2]) + " PTS")
					draw_text(x + 384, y + 320, "Buy For: " + string(overview_price) + " Gold")
				
				}
			}
		}
		else if category == "weapons" {		 // Index 0: ID, Index 1: Type, Index 2: Damage, Index 3: Price
			for (i = 0; i < array_length(global.w_library); i ++) {
				if global.w_library[i][0] == overview_id {
					draw_text(x + 384, y + 256, "Type: " + global.w_library[i][1])
					draw_text(x + 384, y + 288, "Damage: " + string(global.w_library[i][2]) + " PTS")
					draw_text(x + 384, y + 320, "Buy For: " + string(overview_price) + " Gold")
				
				}
			}
		}
		else if category == "armours" {		 // Index 0: ID, Index 1: Type, Index 2: Armour Rating, Index 3: Price
			for (i = 0; i < array_length(global.ar_library); i ++) {
				if global.ar_library[i][0] == overview_id {
					draw_text(x + 384, y + 256, "Type: " + global.ar_library[i][1])
					draw_text(x + 384, y + 288, "Slot: " + string(global.ar_library[i][4]))
					draw_text(x + 384, y + 320, "Armour: " + string(global.ar_library[i][2]) + " PTS")
					draw_text(x + 384, y + 352, "Buy For: " + string(overview_price) + " Gold")
				}
			}
		}
		else if category == "accessories" {		 // Index 0: ID, Index 1: Type, Index 2: Effect, Index 3: Price
			for (i = 0; i < array_length(global.ac_library); i ++) {
				if global.ac_library[i][0] == overview_id {
					draw_text(x + 384, y + 256, "Type: " + global.ac_library[i][1])
					draw_text(x + 384, y + 288, "Effect: " + string(global.ac_library[i][2]))
					draw_text(x + 384, y + 320, "Buy For: " + string(overview_price) + " Gold")
				
				}
			}
		}
		else if category == "materials" {		 // Index 0: ID, Index 1: Type, Index 2: Price
			for (i = 0; i < array_length(global.m_library); i ++) {
				if global.m_library[i][0] == overview_id {
					draw_text(x + 384, y + 256, "Used For: " + global.m_library[i][1])
					draw_text(x + 384, y + 288, "Buy For: " + string(overview_price) + " Gold")		
				}
			}
		}
	}
	else if current_tab == "craft" {
		
		// TBA	
	}
}