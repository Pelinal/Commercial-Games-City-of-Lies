/// @description Draw Text

image_xscale = 2
image_yscale = 2
draw_self()
draw_set_font(fnt_textbox)
draw_set_colour(c_white)
draw_set_alpha(1)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_text(x + 80, y + 32, string_ucfirst(type))
draw_set_halign(fa_left)
draw_set_valign(fa_top)