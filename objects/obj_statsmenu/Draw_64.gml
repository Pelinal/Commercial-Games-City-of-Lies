/// @description Draw Menu
// Darken Screen BG
draw_set_colour(c_black)
draw_set_alpha(0.6)
draw_rectangle(0, 0, 1920, 1080, false)

// Self
draw_set_color(c_white)
draw_set_alpha(1)
draw_self()

// Title
draw_set_font(fnt_questlog_large)
draw_text(64, 32, "Stats")

// Draw Resource Bars
draw_set_font(fnt_inventory_small)

draw_sprite_stretched(spr_attributebars, 4, x + 120, y + 48, 408, 48)	// HP Background
draw_sprite_stretched(spr_attributebars, 2, x + 120, y + 96, 408, 48)	// MP Background
draw_sprite_stretched(spr_attributebars, 0, x + 120, y + 144, 408, 48)	// SP Background

draw_sprite_stretched(spr_attributebars, 5, x + 120, y + 48, 408 * (global.hp / global.max_hp), 48) // HP Bar
draw_sprite_stretched(spr_attributebars, 3, x + 120, y + 96, 408 * (global.mp / global.max_mp), 48)	// MP Bar
draw_sprite_stretched(spr_attributebars, 1, x + 120, y + 144, 408 * (global.sp / global.max_sp), 48)	// SP Bar

// Draw Resource Bar text
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_text(x + 336, y + 72, string(global.hp) + "/" + string(global.max_hp))
draw_text(x + 336, y + 120, string(global.mp) + "/" + string(global.max_mp))
draw_text(x + 336, y + 168, string(global.sp) + "/" + string(global.max_sp))
draw_set_halign(fa_left)

draw_text(x + 48, y + 76, "HP:")
draw_text(x + 48, y + 124, "MP:")
draw_text(x + 48, y + 172, "SP:")
draw_set_valign(fa_top)


// Draw Name, Level, EXP, and Class
draw_text(x + 48, y + 288, "Name: " + global.persona[0])
draw_sprite_stretched(spr_attributebars, 6, x + 192, y + 384, 336, 48)
draw_sprite_stretched(spr_attributebars, 7, x + 192, y + 384, 336 * (global.exp / global.exp_req), 48)
draw_text(x + 48, y + 336, "Class: " + string_ucfirst(global.class))

draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_text(x + 360, y + 408, string(global.exp) + "/" + string(global.exp_req))
draw_set_halign(fa_left)

draw_text(x + 48, y + 408, "Level: " + string(global.level))
draw_set_valign(fa_top)

// Draw Main Attributes
draw_text(x + 48, y + 528, "Endurance:")
draw_text(x + 48, y + 576, "Intelligence:")
draw_text(x + 48, y + 624, "Dexterity:")
draw_text(x + 48, y + 672, "Speed:")
draw_text(x + 48, y + 720, "Luck:")

draw_set_halign(fa_right)

draw_text(x + 527, y + 528, string(global.edr))
draw_text(x + 527, y + 576, string(global.int))
draw_text(x + 527, y + 624, string(global.dex))
draw_text(x + 527, y + 672, string(global.spd))
draw_text(x + 527, y + 720, string(global.luk))

draw_set_halign(fa_left)

// Draw Skills
draw_set_font(fnt_questlog_medium)
draw_text(x + 672, y + 48, "Skills")
draw_text(x + 1248, y + 48, "Combat Stats")
draw_set_font(fnt_inventory_small)

draw_text(x + 672, y + 144, "Smithing:")
draw_text(x + 672, y + 192, "Alchemy:")
draw_text(x + 672, y + 240, "Enchanting:")
draw_text(x + 672, y + 336, "Blades:")
draw_text(x + 672, y + 384, "Archery:")
draw_text(x + 672, y + 432, "Staves:")
draw_text(x + 672, y + 528, "Barter:")
draw_text(x + 672, y + 576, "Lockpicking:")
draw_text(x + 672, y + 624, "Archaeology:")

draw_text(x + 1248, y + 144, "Attack:")
draw_text(x + 1248, y + 192, "Defense:")
draw_text(x + 1248, y + 240, "Sp. Attack:")
draw_text(x + 1248, y + 336, "Sp. Defense:")
draw_text(x + 1248, y + 384, "M. Attack:")
draw_text(x + 1248, y + 432, "M. Defense:")

// Skill Level text
draw_set_halign(fa_right)
draw_text(x + 876, y + 144, string(global.smithing div 1))
draw_text(x + 876, y + 192, string(global.alchemy div 1))
draw_text(x + 876, y + 240, string(global.enchanting div 1))
draw_text(x + 876, y + 336, string(global.blade div 1))
draw_text(x + 876, y + 384, string(global.archery div 1))
draw_text(x + 876, y + 432, string(global.staves div 1))
draw_text(x + 876, y + 528, string(global.barter div 1))
draw_text(x + 876, y + 576, string(global.locks div 1))
draw_text(x + 876, y + 624, string(global.archaeology div 1))

// Draw Combat Stats Text
draw_text(x + 1727, y + 144, string(global.atk div 1))
draw_text(x + 1727, y + 192, string(global.def div 1))
draw_text(x + 1727, y + 240, string(global.stk div 1))
draw_text(x + 1727, y + 336, string(global.sdf div 1))
draw_text(x + 1727, y + 384, string(global.mtk div 1))
draw_text(x + 1727, y + 432, string(global.mdf div 1))
draw_set_halign(fa_left)

// Draw Skill XP bars
draw_sprite_stretched(spr_attributebars, 6, x + 888, y + 144, 312, 48)
draw_sprite_stretched(spr_attributebars, 6, x + 888, y + 192, 312, 48)
draw_sprite_stretched(spr_attributebars, 6, x + 888, y + 240, 312, 48)
draw_sprite_stretched(spr_attributebars, 6, x + 888, y + 336, 312, 48)
draw_sprite_stretched(spr_attributebars, 6, x + 888, y + 384, 312, 48)
draw_sprite_stretched(spr_attributebars, 6, x + 888, y + 432, 312, 48)
draw_sprite_stretched(spr_attributebars, 6, x + 888, y + 528, 312, 48)
draw_sprite_stretched(spr_attributebars, 6, x + 888, y + 576, 312, 48)
draw_sprite_stretched(spr_attributebars, 6, x + 888, y + 624, 312, 48)
// BarWidth * (global.skillname - (global.skillname div 1)) // USE this for skill xp 
draw_sprite_stretched(spr_attributebars, 7, x + 889, y + 144, 312 * (global.smithing - (global.smithing div 1)), 48)
draw_sprite_stretched(spr_attributebars, 7, x + 889, y + 192, 312 * (global.alchemy - (global.alchemy div 1)), 48)
draw_sprite_stretched(spr_attributebars, 7, x + 889, y + 240, 312 * (global.enchanting - (global.enchanting div 1)), 48)
draw_sprite_stretched(spr_attributebars, 7, x + 889, y + 336, 312 * (global.blade - (global.blade div 1)), 48)
draw_sprite_stretched(spr_attributebars, 7, x + 889, y + 384, 312 * (global.archery - (global.archery div 1)), 48)
draw_sprite_stretched(spr_attributebars, 7, x + 889, y + 432, 312 * (global.staves - (global.staves div 1)), 48)
draw_sprite_stretched(spr_attributebars, 7, x + 889, y + 528, 312 * (global.barter - (global.barter div 1)), 48)
draw_sprite_stretched(spr_attributebars, 7, x + 889, y + 576, 312 * (global.locks - (global.locks div 1)), 48)
draw_sprite_stretched(spr_attributebars, 7, x + 889, y + 624, 312 * (global.archaeology - (global.archaeology div 1)), 48)

// Draw Skill Bar Text
draw_set_halign(fa_center)

draw_text(x + 1044, y + 150, string((global.smithing - (global.smithing div 1)) * 100) + "/100")

temp_string = string((global.alchemy - (global.alchemy div 1)) * 100)
temp_string = string_delete(temp_string, string_length(temp_string)-3, 3) + "/100"

draw_text(x + 1044, y + 198, temp_string)
draw_text(x + 1044, y + 246, string((global.enchanting - (global.enchanting div 1)) * 100) + "/100")
draw_text(x + 1044, y + 342, string((global.blade - (global.blade div 1)) * 100) + "/100")
draw_text(x + 1044, y + 390, string((global.archery - (global.archery div 1)) * 100) + "/100")
draw_text(x + 1044, y + 438, string((global.staves - (global.staves div 1)) * 100) + "/100")
draw_text(x + 1044, y + 534, string((global.barter - (global.barter div 1)) * 100) + "/100")
draw_text(x + 1044, y + 582, string((global.locks - (global.locks div 1)) * 100) + "/100")
draw_text(x + 1044, y + 630, string((global.archaeology - (global.archaeology div 1)) * 100) + "/100")

draw_set_halign(fa_left)