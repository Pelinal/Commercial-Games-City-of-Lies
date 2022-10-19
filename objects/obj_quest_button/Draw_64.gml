/// @description Draw Button

draw_self()
draw_set_alpha(1)
draw_set_color(c_white)

// draw active icon
if global.quest_library[quest_id][1] != "Completed" {
	draw_sprite(spr_activeicon, tracked, x + 16, y + 16)
}
// draw quest name and location
draw_set_font(fnt_inventory_small)
draw_text(x + 64, y + 16, global.quest_library[quest_id][0]) // name
draw_set_font(fnt_trademenu_small)
draw_text(x + 64, y + 48, global.quest_library[quest_id][4]) // location
