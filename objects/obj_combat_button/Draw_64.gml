/// @description Draw Text

draw_self()
draw_set_alpha(1)
draw_set_font(fnt_inventory_small)

if type == "PhysicalAttack" { 
	draw_tile(ts_icons_iconset_64, global.atks_physical[attack_id][7], 0, x, y) // Attack Icon
	draw_text(x + 72, y + 12, global.atks_physical[attack_id][0])				// Attack Name
} else if type == "SpecialAttack" { 
	draw_tile(ts_icons_iconset_64, global.atks_special[attack_id][7], 0, x, y)	// Attack Icon
	draw_text(x + 72, y + 12, global.atks_special[attack_id][0])				// Attack Name
} else if type == "MagicalAttack" { 
	draw_tile(ts_icons_iconset_64, global.atks_magical[attack_id][7], 0, x, y)	// Attack Icon
	draw_text(x + 72, y + 12, global.atks_magical[attack_id][0])				// Attack Name
} else if type == "ItemButton" { 
	draw_tile(ts_icons_iconset_64, global.icons[item_id], 0, x, y)				// Item Name + Icon + Amount
	draw_text(x + 72, y + 12, global.library[item_id][0])
	draw_text(x + 360, y + 12, "x " + string(inventory_fetch(item_id)))
} else if type == "Physical" {
	draw_text(x + 24, y + 12, "Physical")
} else if type == "Special" {
	draw_text(x + 24, y + 12, "Special")
} else if type == "Magic" {
	if global.class != "mage" {
		draw_set_halign(fa_center)
		draw_set_colour(c_grey)
		draw_text(x + 240, y + 12, string_ucfirst(type))
		draw_set_halign(fa_left)
		draw_set_colour(c_white)
	} else {
		draw_set_halign(fa_center)
		draw_set_colour(c_white)
		draw_text(x + 240, y + 12, string_ucfirst(type))
		draw_set_halign(fa_left)
	}

} else if type == "EnemyTarget" {
	draw_set_halign(fa_center)
	draw_text(x + 240, y + 12, global.enemies[enemy_id.enemy_id][0])
	draw_set_halign(fa_left)
} else if type == "OKRewards" || type == "OKDefeat" {
	draw_set_halign(fa_center)
	draw_text(x + 240, y + 12, "Ok")
	draw_set_halign(fa_left)
} else {
	draw_set_halign(fa_center)
	draw_text(x + 240, y + 12, string_ucfirst(type))
	draw_set_halign(fa_left)
}