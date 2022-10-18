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
}