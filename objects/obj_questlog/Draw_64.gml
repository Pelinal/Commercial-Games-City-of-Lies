/// @description Draw Overview

draw_set_colour(c_black)
draw_set_alpha(0.6)
draw_rectangle(0, 0, 1920, 1080, false)

// Menu Sprite & Title
draw_set_font(fnt_questlog_large)
draw_set_color(c_white)
draw_set_alpha(1)
//draw_sprite(spr_questlog, 0, draw_x, draw_y)
draw_self()

draw_text(64, 32, "Quest Log")
draw_set_font(fnt_questlog_28)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_text(x + 240, y + 48, current_tab)
draw_set_halign(fa_left)
draw_set_valign(fa_top)

if overview_id != -1 {
	// Draw quest stuff in right panel
	draw_set_valign(fa_center)
	draw_set_halign(fa_center)
	draw_set_font(fnt_questlog_xlarge)
	draw_text(x + 1176, y + 96, global.quest_library[overview_id][0])	// quest name
	draw_set_font(fnt_questlog_28)
	draw_set_color(c_ltgrey)
	draw_text(x + 1176, y + 152, global.quest_library[overview_id][4]) // quest location
	draw_set_color(c_white)
	//// END of Header
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
	draw_set_font(fnt_inventory_small)
	// Body
	draw_text(x + 576, y + 192, string_wordwrap_width(global.quest_library[overview_id][2], 1120, "\n", false)) // description
	draw_set_font(fnt_questlog_medium)
	draw_text(x + 576, y + 360, "Objectives")
	obj_y = y + 420
	draw_set_font(fnt_inventory_small)
	for (i = 0; i < array_length(global.quest_library[overview_id][6]); i ++) {
		if global.quest_objectives[overview_id][0][i] {
			if !quest_objective_is_complete(overview_id, i) {	
				draw_tile(ts_icons_iconset, 186, 0, x + 576, obj_y)
			} else {
				draw_tile(ts_icons_iconset, 189, 0, x + 576, obj_y)
			}
			draw_text(x + 640, obj_y, global.quest_library[overview_id][6][i]) // objectives
			obj_y += 32
		}
	}
		
	draw_set_font(fnt_questlog_medium)
	draw_text(x + 576, y + 720, "Rewards")
	rew_x = x + 576
	for (i = 0; i < array_length(global.quest_library[overview_id][5]); i ++) {
		draw_tile(ts_icons_iconset_64, global.icons[global.quest_library[overview_id][5][i][0]], 0, rew_x, y + 770) // Fetches icon of rewards
		draw_set_font(fnt_questlog_small)
		draw_set_halign(fa_center)
		draw_text(rew_x+32, y + 842, global.library[global.quest_library[overview_id][5][i][0]][0] + "\n x" + string(global.quest_library[overview_id][5][i][1])) // Fetches name and amount of rewards
		
		draw_set_halign(fa_left)
		
		rew_x += 128
	}
	
	// Bonus
	
	draw_set_halign(fa_right)
	draw_set_font(fnt_questlog_small)
	if quest_tracked(overview_id) { draw_text(x + 1776, y + 842, "(Tracked)") }
	if global.quest_library[overview_id][3] != "None" {
		draw_text(x + 1776, y + 360, "Quest Giver")
		draw_set_font(fnt_inventory_small)
		draw_set_halign(fa_center)
		draw_text(x + 1650, y + 410, global.quest_library[overview_id][3])
	}
	draw_set_halign(fa_left)
	
}