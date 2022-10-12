/// @description Draw Text

draw_self()
draw_set_alpha(1)
draw_set_colour(c_white)
draw_set_font(fnt_inventory_12)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_text(x + 48, y + 24, string_ucfirst(type))
draw_set_halign(fa_left)
draw_set_valign(fa_top)