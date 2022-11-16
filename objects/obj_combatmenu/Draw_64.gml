/// @description Draw Text

draw_sprite(spr_battlebacks, battleback, 0, 0)
draw_self()

draw_set_color(c_white)
draw_set_alpha(1)
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