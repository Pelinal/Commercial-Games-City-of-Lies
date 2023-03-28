/// @description Draw Text

//draw_sprite(spr_battlebacks, battleback, 0, 0)
draw_set_alpha(0.5)
draw_rectangle_color(0, 0, 1920, 1080, c_black, c_black, c_black, c_black, false)
draw_set_alpha(1)
draw_self()
draw_set_color(c_white)
draw_set_font(fnt_inventory_small)

if current_display == "Default" {
	draw_text(x + 720, y + 768, global.persona[0] + " Duqarte")

	// Resource Bars
	draw_text(x + 720, y + 832, "Health  (HP):")
	draw_text(x + 720, y + 896, "Mana    (MP):")
	draw_text(x + 720, y + 960, "Stamina (SP):")

	draw_sprite_stretched(spr_attributebars, 4, x + 960, y + 832, 864, 48)	// HP Background
	draw_sprite_stretched(spr_attributebars, 2, x + 960, y + 896, 864, 48)	// MP Background
	draw_sprite_stretched(spr_attributebars, 0, x + 960, y + 960, 864, 48)	// SP Background

	draw_sprite_stretched(spr_attributebars, 5, x + 960, y + 832, 864 * (global.hp / global.max_hp), 48)	// HP Bar
	draw_sprite_stretched(spr_attributebars, 3, x + 960, y + 896, 864 * (global.mp / global.max_mp), 48)	// MP Bar
	draw_sprite_stretched(spr_attributebars, 1, x + 960, y + 960, 864 * (global.sp / global.max_sp), 48)	// SP Bar

	draw_set_halign(fa_center)
	draw_text(x + 1392, y + 836, string(global.hp) + "/" + string(global.max_hp))
	draw_text(x + 1392, y + 900, string(global.mp) + "/" + string(global.max_mp))
	draw_text(x + 1392, y + 964, string(global.sp) + "/" + string(global.max_sp))
	draw_set_halign(fa_left)
} 

if obj_combatmenu.current_display == "Physical" && skill_overview_id != -1 {
	draw_set_font(fnt_inventory_small)
	draw_tile(ts_icons_iconset_128, global.atks_physical[skill_overview_id][7], 0, x + 1700, y + 768)
	draw_text(x + 1392, y + 768, "Name: " + string(global.atks_physical[skill_overview_id][0])) // Skill Name
	draw_text(x + 1392, y + 832, "Damage: " + string(global.atks_physical[skill_overview_id][1] * global.atk)) // Damage
	draw_text(x + 1392, y + 896, "SP Cost: " + string(global.atks_physical[skill_overview_id][2])) // SP Cost
	draw_text(x + 1392, y + 960, "Critical: " + string(global.atks_physical[skill_overview_id][3]*100) + "%") // Crit Chance
	draw_text(x + 1640, y + 960, "Cripple?: " + string(global.atks_physical[skill_overview_id][4])) // Crit Chance
}
if obj_combatmenu.current_display == "Special" && skill_overview_id != -1 {
	draw_set_font(fnt_inventory_small)
	draw_tile(ts_icons_iconset_128, global.atks_special[skill_overview_id][7], 0, x + 1700, y + 768)
	draw_text(x + 1392, y + 768, "Name: " + string(global.atks_special[skill_overview_id][0])) // Skill Name
	draw_text(x + 1392, y + 832, "Damage: " + string(global.atks_special[skill_overview_id][1] * global.atk)) // Damage
	draw_text(x + 1392, y + 896, "SP Cost: " + string(global.atks_special[skill_overview_id][2])) // SP Cost
	draw_text(x + 1392, y + 960, "Critical: " + string(global.atks_special[skill_overview_id][3]*100) + "%") // Crit Chance
	draw_text(x + 1640, y + 960, "Cripple?: " + string(global.atks_special[skill_overview_id][4])) // Crit Chance
}
if obj_combatmenu.current_display == "Magic" && skill_overview_id != -1 {
	draw_set_font(fnt_inventory_small)
	draw_tile(ts_icons_iconset_128, global.atks_magical[skill_overview_id][7], 0, x + 1700, y + 768)
	draw_text(x + 1392, y + 768, "Name: " + string(global.atks_magical[skill_overview_id][0])) // Skill Name
	draw_text(x + 1392, y + 832, "Damage: " + string(global.atks_magical[skill_overview_id][1] * global.atk)) // Damage
	draw_text(x + 1392, y + 896, "MP Cost: " + string(global.atks_magical[skill_overview_id][2])) // MP Cost
	draw_text(x + 1392, y + 960, "Type: " + string(global.atks_magical[skill_overview_id][3])) // Type
	draw_text(x + 1640, y + 960, "Element: " + string(global.atks_magical[skill_overview_id][4])) // element
}

if current_display == "Attacking" {
	draw_text(x + 384, y + 768, global.persona[0] + " Duqarte")

	// Resource Bars
	draw_text(x + 384, y + 832, "Health  (HP):")
	draw_text(x + 384, y + 896, "Mana    (MP):")
	draw_text(x + 384, y + 960, "Stamina (SP):")

	draw_sprite_stretched(spr_attributebars, 4, x + 624, y + 832, 864, 48)	// HP Background
	draw_sprite_stretched(spr_attributebars, 2, x + 624, y + 896, 864, 48)	// MP Background
	draw_sprite_stretched(spr_attributebars, 0, x + 624, y + 960, 864, 48)	// SP Background

	draw_sprite_stretched(spr_attributebars, 5, x + 624, y + 832, 864 * (global.hp / global.max_hp), 48)	// HP Bar
	draw_sprite_stretched(spr_attributebars, 3, x + 624, y + 896, 864 * (global.mp / global.max_mp), 48)	// MP Bar
	draw_sprite_stretched(spr_attributebars, 1, x + 624, y + 960, 864 * (global.sp / global.max_sp), 48)	// SP Bar

	draw_set_halign(fa_center)
	draw_text(x + 1056, y + 836, string(global.hp) + "/" + string(global.max_hp))
	draw_text(x + 1056, y + 900, string(global.mp) + "/" + string(global.max_mp))
	draw_text(x + 1056, y + 964, string(global.sp) + "/" + string(global.max_sp))
}

if current_display == "Victory" {
	draw_set_color(c_white)
	draw_set_font(fnt_questlog_28)
	draw_set_halign(fa_center)
	draw_text(x + 960, y + 128, "Victory")
	draw_set_halign(fa_left)
	draw_set_font(fnt_inventory_small)
	draw_text(384, 256, "XP Gained: " + string(kill_xp))
	y_margin = 320
	for (i = 0; i < array_length(rewards_list); i ++) {
		draw_tile(ts_icons_iconset_64, global.icons[rewards_list[i][0]], 0, 384, y_margin)
		draw_text(456, y_margin, string(global.library[rewards_list[i][0]][0]) + " x" + string(rewards_list[i][1]))
		y_margin += 64
	}
}

if current_display == "Defeat" {
	draw_set_color(c_white)
	draw_set_font(fnt_questlog_28)
	draw_set_halign(fa_center)
	draw_text(x + 960, y + 128, "Defeat")
	draw_set_halign(fa_left)
	draw_set_font(fnt_inventory_small)
	draw_text(384, 256, "You ran out of HP and blacked out...")
}