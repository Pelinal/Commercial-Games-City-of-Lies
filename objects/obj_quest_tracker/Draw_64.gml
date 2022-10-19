/// @description Draw Tracked Quest

draw_set_alpha(1)
draw_set_colour(c_white)
draw_self()

if quest_tracked_id() >= 0 {
	quest_id = quest_tracked_id()
	
	draw_set_valign(fa_center)
	draw_set_halign(fa_center)
	
	// Draw Quest Name
	draw_set_font(fnt_questlog_28)
	draw_text(x + 216, y + 64, global.quest_library[quest_id][0])
	
	// Draw Current Objective(s)
	
	y_margin = y + 118
	
	draw_set_font(fnt_questlog_small)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	for (i = 0; i < array_length(global.quest_library[quest_id][6]); i ++) {
		if quest_objective_is_visible(quest_id, i) && !quest_objective_is_complete(quest_id, i) {
			draw_tile(ts_icons_iconset, 186, 0, x + 32, y_margin)
			draw_text(x + 72, y_margin, global.quest_library[quest_id][6][i])
			
			y_margin += 32
		}
		
		
	}
	
	
	
}