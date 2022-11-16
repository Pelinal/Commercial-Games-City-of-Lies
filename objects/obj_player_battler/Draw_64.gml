/// @description Draw Self

draw_self()

draw_set_halign(fa_center)
draw_set_font(fnt_damage_no)
draw_set_colour(combat_text_colour(head_text[0]))
head_text[0] = string_delete(head_text[0], 0, 1)
draw_text(x + (sprite_width/2), y + 64, head_text[0])
draw_set_colour(c_white)
draw_text(x + (sprite_width/2), y, head_text[1])
draw_set_halign(fa_left)