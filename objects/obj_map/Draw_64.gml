/// @description draw self

draw_self()

draw_set_font(fnt_textbox)
draw_set_alpha(1)
draw_set_color(c_white)

// Debug Text
draw_text(48, 1032, "X: " + string(x))
draw_text(144, 1032, "Y: " + string(y))
draw_text(240, 1032, "Zoom: " + string((image_xscale)*100) + "%")

draw_set_font(fnt_questlog_large)
draw_text(48, 48, "The Capital")

draw_set_font(fnt_inventory_small)
draw_set_colour(c_ltgrey)
draw_text(64, 108, "City Map")

if current_district != -1 {
	draw_set_font(fnt_questlog_28)
	draw_set_halign(fa_right)
	draw_set_colour(c_ltgrey)
	draw_text(1872, 1032, current_district)
	draw_set_halign(fa_left)
}

switch room {
	case rm_palace_ext:
		draw_sprite_stretched(spr_mapicon_player, 0, x_icon_origin + (1758 * image_xscale), y_icon_origin + (865 * image_yscale), 23 * image_xscale, 36 * image_yscale)
		break
	case rm_palace_gf:
		draw_sprite_stretched(spr_mapicon_player, 0, x_icon_origin + (1800 * image_xscale), y_icon_origin + (905 * image_yscale), 23 * image_xscale, 36 * image_yscale)
		break
	case rm_docks_new_ext:
		draw_sprite_stretched(spr_mapicon_player, 0, x_icon_origin + (1451 * image_xscale), y_icon_origin + (748 * image_yscale), 23 * image_xscale, 36 * image_yscale)
		break
	case rm_docks_promenade_ext:
		draw_sprite_stretched(spr_mapicon_player, 0, x_icon_origin + (1495 * image_xscale), y_icon_origin + (705 * image_yscale), 23 * image_xscale, 36 * image_yscale)
		break
	case rm_docks_south_ext:
		draw_sprite_stretched(spr_mapicon_player, 0, x_icon_origin + (1451 * image_xscale), y_icon_origin + (900 * image_yscale), 23 * image_xscale, 36 * image_yscale)
		break
}

if room == rm_palace_ext {
	
	
	//draw_set_font(fnt_textbox)
	//draw_set_colour(c_black)
	//draw_text(x_icon_origin + (1758 * image_xscale) + 24, y_icon_origin + (865 * image_yscale) - 6, "Player")
} else if room == rm_palace_gf {
	
	
	//draw_set_font(fnt_textbox)
	//draw_set_colour(c_black)
	//draw_text(x_icon_origin + (1800 * image_xscale) + 24, y_icon_origin + (905 * image_yscale) - 6, "Player")
}