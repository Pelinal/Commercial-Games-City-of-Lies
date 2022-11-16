/// @description Draw Names/HP

draw_self()

draw_set_alpha(1)
draw_set_color(c_white)
draw_set_font(fnt_inventory_small)
draw_set_halign(fa_left)

// Enemy Names
if instance_number(obj_battler) >= 1 {
	draw_text(24, 40, global.enemies[enemy_list[0]][0])
	
	// HP Display
	draw_sprite_stretched(spr_attributebars, 4, x + 192, y + 40, 360, 40)	// Background
	draw_sprite_stretched(spr_attributebars, 5, x + 192, y + 40, 360 * (id_list[0].enemy_hp / global.enemies[enemy_list[0]][1]), 40)	// Bar
	
	draw_set_halign(fa_center)
	draw_text(x + 372, y + 44, string(id_list[0].enemy_hp) + "/" + string(global.enemies[enemy_list[0]][1]))
	draw_set_halign(fa_left)
}
if instance_number(obj_battler) >= 2 {
	draw_text(24, 80, global.enemies[enemy_list[1]][0])
	
	// HP Display
	draw_sprite_stretched(spr_attributebars, 4, x + 192, y + 80, 360, 40)	// Background
	draw_sprite_stretched(spr_attributebars, 5, x + 192, y + 80, 360 * (id_list[1].enemy_hp / global.enemies[enemy_list[1]][1]), 40)	// Bar
	
	draw_set_halign(fa_center)
	draw_text(x + 372, y + 84, string(id_list[1].enemy_hp) + "/" + string(global.enemies[enemy_list[1]][1]))
	draw_set_halign(fa_left)
}
if instance_number(obj_battler) >= 3 {
	draw_text(24, 120, global.enemies[enemy_list[2]][0])
	
	// HP Display
	draw_sprite_stretched(spr_attributebars, 4, x + 192, y + 120, 360, 40)	// Background
	draw_sprite_stretched(spr_attributebars, 5, x + 192, y + 120, 360 * (id_list[2].enemy_hp / global.enemies[enemy_list[2]][1]), 40)	// Bar
	
	draw_set_halign(fa_center)
	draw_text(x + 372, y + 124, string(id_list[2].enemy_hp) + "/" + string(global.enemies[enemy_list[2]][1]))
	draw_set_halign(fa_left)
}
if instance_number(obj_battler) >= 4 {
	draw_text(24, 160, global.enemies[enemy_list[3]][0])
	
	// HP Display
	draw_sprite_stretched(spr_attributebars, 4, x + 192, y + 160, 360, 40)	// Background
	draw_sprite_stretched(spr_attributebars, 5, x + 192, y + 160, 360 * (id_list[3].enemy_hp / global.enemies[enemy_list[3]][1]), 40)	// Bar
	
	draw_set_halign(fa_center)
	draw_text(x + 372, y + 164, string(id_list[3].enemy_hp) + "/" + string(global.enemies[enemy_list[3]][1]))
	draw_set_halign(fa_left)
}

