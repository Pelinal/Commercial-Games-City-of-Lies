/// @description Draw Text

draw_sprite_stretched(spr_button_80_32, anim_index, x_draw , y_draw, 180, 72)
draw_set_font(fnt_textbox)
draw_set_colour(c_white)
draw_set_alpha(1)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_text(x_draw + 80, y_draw + 32, string_ucfirst(type))
draw_set_halign(fa_left)
draw_set_valign(fa_top)