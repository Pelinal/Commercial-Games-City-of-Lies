/// @description Draw Overview

draw_x = 150
draw_y = 0
draw_offset = 2.2222
draw_sprite(spr_inventory, 0, draw_x, draw_y)
draw_set_alpha(1)
draw_set_colour(c_white)

// Gold, Other Currencies (TBA), Health etc.
draw_set_font(fnt_inventory_small)
draw_tile(ts_icons_iconset_64, global.icons[0], 0, draw_x + 384*draw_offset, draw_y + 398*draw_offset)
draw_text(draw_x + 416*draw_offset, draw_y + 404*draw_offset, string(global.gold))

draw_tile(ts_icons_iconset_64, 257, 0, draw_x + 456*draw_offset, draw_y + 398*draw_offset)
draw_text(draw_x + 488*draw_offset, draw_y + 404*draw_offset, string(global.frags))

draw_tile(ts_icons_iconset_64, 269, 0, draw_x + 528*draw_offset, draw_y + 398*draw_offset)
draw_text(draw_x + 560*draw_offset, draw_y + 404*draw_offset, string(global.supplies))

draw_tile(ts_icons_iconset_64, 270, 0, draw_x + 600*draw_offset, draw_y + 398*draw_offset)
draw_text(draw_x + 632*draw_offset, draw_y + 404*draw_offset, string(global.contraband))


draw_sprite_stretched(spr_attributebars, 4, draw_x + 864, draw_y + 952, 384, 38)	// HP Background
draw_sprite_stretched(spr_attributebars, 2, draw_x + 864, draw_y + 992, 384, 38)	// MP Background
draw_sprite_stretched(spr_attributebars, 0, draw_x + 864, draw_y + 1032, 384, 38)	// SP Background

draw_sprite_stretched(spr_attributebars, 5, draw_x + 864, draw_y + 952, 384 * (global.hp / global.max_hp), 38)	// HP Bar
draw_sprite_stretched(spr_attributebars, 3, draw_x + 864, draw_y + 992, 384 * (global.mp / global.max_mp), 38)    // MP Bar
draw_sprite_stretched(spr_attributebars, 1, draw_x + 864, draw_y + 1032, 384 * (global.sp / global.max_sp), 38)	// SP Bar

draw_set_halign(fa_center)
draw_set_font(fnt_trademenu_small)
draw_text(draw_x + 1056, draw_y + 956, string(global.hp) + "/" + string(global.max_hp))
draw_text(draw_x + 1056, draw_y + 996, string(global.mp) + "/" + string(global.max_mp))
draw_text(draw_x + 1056, draw_y + 1036, string(global.sp) + "/" + string(global.max_sp))
draw_set_halign(fa_left)

//draw_set_colour(c_grey)
//draw_rectangle(draw_x + 384*draw_offset, draw_y + 420*draw_offset, (draw_x + 384*draw_offset) + (global.max_hp) * 3, draw_y + 432*draw_offset, false) 
//draw_set_colour(c_red)
//draw_rectangle(draw_x + 384*draw_offset, draw_y + 420*draw_offset, (draw_x + 384*draw_offset) + (global.hp) * 3, draw_y + 432*draw_offset, false)

//draw_set_colour(c_grey)
//draw_rectangle(draw_x + 384*draw_offset, draw_y + 440*draw_offset, (draw_x + 384*draw_offset) + (global.max_mp) * 3, draw_y + 452*draw_offset, false) 
//draw_set_colour(c_blue)
//draw_rectangle(draw_x + 384*draw_offset, draw_y + 440*draw_offset, (draw_x + 384*draw_offset) + (global.mp) * 3, draw_y + 452*draw_offset, false)

//draw_set_colour(c_grey)
//draw_rectangle(draw_x + 384*draw_offset, draw_y + 460*draw_offset, (draw_x + 384*draw_offset) + (global.max_sp) * 3, draw_y + 472*draw_offset, false) 
//draw_set_colour(c_green)
//draw_rectangle(draw_x + 384*draw_offset, draw_y + 460*draw_offset, (draw_x + 384*draw_offset) + (global.sp) * 3, draw_y + 472*draw_offset, false)

if overview_id != -1 {
	// Name
	draw_set_colour(c_white)
	draw_set_font(fnt_inventory_large)
	draw_text(draw_x + 384*draw_offset, draw_y + 160*draw_offset, global.library[overview_id][0])
	
	// Icon
	draw_tile(ts_icons_iconset_64, global.icons[overview_id], 0, draw_x + 644*draw_offset, draw_y + 160*draw_offset)
	
	// Description
	draw_set_font(fnt_inventory_small)
	draw_text(draw_x + 384*draw_offset, draw_y + 192 *draw_offset, global.library[overview_id][1])
	
	// Stats
	if global.current_menu == "consumables" {		 // Index 0: ID, Index 1: Effect, Index 2: Effect Value, Index 3: Price
		for (i = 0; i < array_length(global.c_library); i ++) {
			if global.c_library[i][0] == overview_id {
				draw_text(draw_x + 384*draw_offset, draw_y + 256*draw_offset, "Effect:" + global.c_library[i][1])
				draw_text(draw_x + 384*draw_offset, draw_y + 288*draw_offset, "Strength: " + string(global.c_library[i][2]) + " PTS")
				draw_text(draw_x + 384*draw_offset, draw_y + 320*draw_offset, "Value: " + string(global.c_library[i][3]) + " Gold")
				
			}
		}
	}
	else if global.current_menu == "weapons" {		 // Index 0: ID, Index 1: Type, Index 2: Damage, Index 3: Price
		for (i = 0; i < array_length(global.w_library); i ++) {
			if global.w_library[i][0] == overview_id {
				draw_text(draw_x + 384*draw_offset, draw_y + 256*draw_offset, "Type: " + global.w_library[i][1])
				draw_text(draw_x + 384*draw_offset, draw_y + 288*draw_offset, "Damage: " + string(global.w_library[i][2]) + " PTS")
				draw_text(draw_x + 384*draw_offset, draw_y + 320*draw_offset, "Value: " + string(global.w_library[i][3]) + " Gold")
				
				if global.w_library[i][4] != noone {
					draw_text(draw_x + 512*draw_offset, draw_y + 256*draw_offset, "Enchantment: " + global.w_library[i][4])
					draw_tile(ts_icons_iconset_64, 143, 0, draw_x + 644*draw_offset, draw_y + 160*draw_offset)
					draw_tile(ts_icons_iconset_64, global.icons[overview_id], 0, draw_x + 644*draw_offset, draw_y + 160*draw_offset)
				}
				if global.w_library[i][5] != noone { draw_text(draw_x + 512*draw_offset, draw_y + 288*draw_offset, "Enchant Power: " + string(global.w_library[i][5]) + " PTS") }
			}
		}
	}
	else if global.current_menu == "armours" {		 // Index 0: ID, Index 1: Type, Index 2: Armour Rating, Index 3: Price
		for (i = 0; i < array_length(global.ar_library); i ++) {
			if global.ar_library[i][0] == overview_id {
				draw_text(draw_x + 384*draw_offset, draw_y + 256*draw_offset, "Type: " + global.ar_library[i][1])
				draw_text(draw_x + 384*draw_offset, draw_y + 288*draw_offset, "Slot: " + string(global.ar_library[i][4]))
				draw_text(draw_x + 384*draw_offset, draw_y + 320*draw_offset, "Armour: " + string(global.ar_library[i][2]) + " PTS")
				draw_text(draw_x + 384*draw_offset, draw_y + 352*draw_offset, "Value: " + string(global.ar_library[i][3]) + " Gold")
				
				if global.ar_library[i][5] != noone { 
					draw_text(draw_x + 512*draw_offset, draw_y + 256*draw_offset, "Enchantment: " + global.ar_library[i][5]) 
					draw_tile(ts_icons_iconset_64, 143, 0, draw_x + 644*draw_offset, draw_y + 160*draw_offset)
					draw_tile(ts_icons_iconset_64, global.icons[overview_id], 0, draw_x + 644*draw_offset, draw_y + 160*draw_offset)
				}
				if global.ar_library[i][6] != noone { draw_text(draw_x + 512*draw_offset, draw_y + 288*draw_offset, "Enchant Power: " + string(global.ar_library[i][6]) + " PTS") }
			}
		}
	}
	else if global.current_menu == "accessories" {		 // Index 0: ID, Index 1: Type, Index 2: Effect, Index 3: Price
		for (i = 0; i < array_length(global.ac_library); i ++) {
			if global.ac_library[i][0] == overview_id {
				draw_text(draw_x + 384*draw_offset, draw_y + 256*draw_offset, "Type: " + global.ac_library[i][1])
				draw_text(draw_x + 384*draw_offset, draw_y + 288*draw_offset, "Effect: " + string(global.ac_library[i][2]))
				draw_text(draw_x + 384*draw_offset, draw_y + 320*draw_offset, "Value: " + string(global.ac_library[i][3]) + " Gold")
				
				if global.ac_library[i][4] != noone {
					draw_text(draw_x + 512*draw_offset, draw_y + 256*draw_offset, "Enchantment: " + global.ac_library[i][4]) 
					draw_tile(ts_icons_iconset_64, 143, 0, draw_x + 644*draw_offset, draw_y + 160*draw_offset)
					draw_tile(ts_icons_iconset_64, global.icons[overview_id], 0, draw_x + 644*draw_offset, draw_y + 160*draw_offset)
				}
				if global.ac_library[i][5] != noone { draw_text(draw_x + 512*draw_offset, draw_y + 288*draw_offset, "Enchant Power: " + string(global.ac_library[i][5]) + " PTS") }
			}
		}
	}
	else if global.current_menu == "key items" {		 // Index 0: ID, Index 1: Type, Index 2: Activate Action
		for (i = 0; i < array_length(global.k_library); i ++) {
			if global.k_library[i][0] == overview_id {
				draw_text(draw_x + 384*draw_offset, draw_y + 256*draw_offset, "Type: " + global.k_library[i][1])
				draw_text(draw_x + 384*draw_offset, draw_y + 288*draw_offset, "On Use: " + string(global.k_library[i][2]))		
			}
		}
	}
	else if global.current_menu == "materials" {		 // Index 0: ID, Index 1: Type, Index 2: Price
		for (i = 0; i < array_length(global.m_library); i ++) {
			if global.m_library[i][0] == overview_id {
				draw_text(draw_x + 384*draw_offset, draw_y + 256*draw_offset, "Used For: " + global.m_library[i][1])
				draw_text(draw_x + 384*draw_offset, draw_y + 288*draw_offset, "Price: " + string(global.m_library[i][2]) + " Gold")		
			}
		}
	}
	else {
		draw_text(draw_x + 384*draw_offset, draw_y + 256*draw_offset, "TBA" )
	}
}