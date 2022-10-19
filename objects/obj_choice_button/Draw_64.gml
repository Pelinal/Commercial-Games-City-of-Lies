/// @description Draw Button

draw_self()
draw_set_alpha(1)
draw_set_color(c_white)

// draw choice text
draw_set_font(fnt_textbox)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_text(x + 64, y + 16, choice_text) // choice text
draw_set_halign(fa_left)
draw_set_valign(fa_top)