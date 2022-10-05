/// @description Draw Overview

draw_self()
draw_set_alpha(1)
draw_set_colour(c_white)

if overview_id != -1 {
	// Name
	draw_set_font(fnt_inventory_20)
	draw_text(x + 384, y + 160, global.library[overview_id][0])
	
	// Icon
	draw_tile(ts_icons_iconset, global.icons[overview_id], 0, x + 384, y + 400)
	
	// Description
	draw_set_font(fnt_inventory_12)
	draw_text(x + 384, y + 192, global.library[overview_id][1])
	
	// Stats
	if global.current_menu == "consumables" {		 // Index 0: ID, Index 1: Effect, Index 3: Effect Value, Index 4: Price
		for (i = 0; i < array_length(global.c_library); i ++) {
			if global.c_library[i][0] == overview_id {
				draw_text(x + 384, y + 256, global.c_library[i][1] + " Potion")
				draw_text(x + 384, y + 288, "Heals for " + string(global.c_library[i][2]) + "HP")
				draw_text(x + 384, y + 320, "Value: " + string(global.c_library[i][3]) + " Gold")
				
			}
		}
	}
	else {
		draw_text(x + 384, y + 256, "TBA" )
	}
}