/// @description Draw Self + Dmg Nums?

if sprite_index != noone { draw_self() }

draw_set_halign(fa_center)
draw_set_font(fnt_damage_no)
draw_set_colour(combat_text_colour(head_text[0]))
if draw_get_color() != c_white {
	var temp_headtext = string_delete(head_text[0], 1, 1)
	draw_text(x + (sprite_width/2), y + 64, temp_headtext)
} else {
	draw_text(x + (sprite_width/2), y + 64, head_text[0])
}
draw_set_colour(c_white)
draw_text(x + (sprite_width/2), y, head_text[1])
draw_set_halign(fa_left)