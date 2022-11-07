/// @description Draw Text

draw_self()
draw_set_alpha(1)
draw_set_font(fnt_inventory_small)

if type != -1 {
	draw_set_halign(fa_center)
	draw_text(x + 240, y + 12, string_ucfirst(type))
	draw_set_halign(fa_left)
}