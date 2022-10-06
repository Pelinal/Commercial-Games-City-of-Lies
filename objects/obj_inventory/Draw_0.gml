/// @description Draw Overview

draw_self()
draw_set_alpha(1)
draw_set_colour(c_white)

// Gold, Other Currencies (TBA), Health etc.
draw_set_font(fnt_inventory_12)
draw_text(x + 384, y + 390, "Gold: " + string(global.gold))

draw_set_colour(c_grey)
draw_rectangle(x + 384, y + 420, (x + 384) + (global.max_hp) * 3, y + 432, false) 
draw_set_colour(c_red)
draw_rectangle(x + 384, y + 420, (x + 384) + (global.hp) * 3, y + 432, false)

draw_set_colour(c_grey)
draw_rectangle(x + 384, y + 440, (x + 384) + (global.max_mp) * 3, y + 452, false) 
draw_set_colour(c_blue)
draw_rectangle(x + 384, y + 440, (x + 384) + (global.mp) * 3, y + 452, false)

draw_set_colour(c_grey)
draw_rectangle(x + 384, y + 460, (x + 384) + (global.max_sp) * 3, y + 472, false) 
draw_set_colour(c_green)
draw_rectangle(x + 384, y + 460, (x + 384) + (global.sp) * 3, y + 472, false)

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
	if global.current_menu == "consumables" {		 // Index 0: ID, Index 1: Effect, Index 2: Effect Value, Index 3: Price
		for (i = 0; i < array_length(global.c_library); i ++) {
			if global.c_library[i][0] == overview_id {
				draw_text(x + 384, y + 256, "Effect:" + global.c_library[i][1])
				draw_text(x + 384, y + 288, "Strength: " + string(global.c_library[i][2]) + " PTS")
				draw_text(x + 384, y + 320, "Value: " + string(global.c_library[i][3]) + " Gold")
				
			}
		}
	}
	else if global.current_menu == "weapons" {		 // Index 0: ID, Index 1: Type, Index 2: Damage, Index 3: Price
		for (i = 0; i < array_length(global.w_library); i ++) {
			if global.w_library[i][0] == overview_id {
				draw_text(x + 384, y + 256, "Type: " + global.w_library[i][1])
				draw_text(x + 384, y + 288, "Damage: " + string(global.w_library[i][2]) + " PTS")
				draw_text(x + 384, y + 320, "Value: " + string(global.w_library[i][3]) + " Gold")
				
			}
		}
	}
	else if global.current_menu == "armours" {		 // Index 0: ID, Index 1: Type, Index 2: Armour Rating, Index 3: Price
		for (i = 0; i < array_length(global.ar_library); i ++) {
			if global.ar_library[i][0] == overview_id {
				draw_text(x + 384, y + 256, "Type: " + global.ar_library[i][1])
				draw_text(x + 384, y + 288, "Slot: " + string(global.ar_library[i][4]))
				draw_text(x + 384, y + 320, "Armour: " + string(global.ar_library[i][2]) + " PTS")
				draw_text(x + 384, y + 352, "Value: " + string(global.ar_library[i][3]) + " Gold")
			}
		}
	}
	else if global.current_menu == "accessories" {		 // Index 0: ID, Index 1: Type, Index 2: Effect, Index 3: Price
		for (i = 0; i < array_length(global.ac_library); i ++) {
			if global.ac_library[i][0] == overview_id {
				draw_text(x + 384, y + 256, "Type: " + global.ac_library[i][1])
				draw_text(x + 384, y + 288, "Effect: " + string(global.ac_library[i][2]))
				draw_text(x + 384, y + 320, "Value: " + string(global.ac_library[i][3]) + " Gold")
				
			}
		}
	}
	else if global.current_menu == "key items" {		 // Index 0: ID, Index 1: Type, Index 2: Activate Action
		for (i = 0; i < array_length(global.k_library); i ++) {
			if global.k_library[i][0] == overview_id {
				draw_text(x + 384, y + 256, "Type: " + global.k_library[i][1])
				draw_text(x + 384, y + 288, "On Use: " + string(global.k_library[i][2]))		
			}
		}
	}
	else if global.current_menu == "materials" {		 // Index 0: ID, Index 1: Type, Index 2: Price
		for (i = 0; i < array_length(global.m_library); i ++) {
			if global.m_library[i][0] == overview_id {
				draw_text(x + 384, y + 256, "Used For: " + global.m_library[i][1])
				draw_text(x + 384, y + 288, "Price: " + string(global.m_library[i][2]) + " Gold")		
			}
		}
	}
	else {
		draw_text(x + 384, y + 256, "TBA" )
	}
}