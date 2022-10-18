/// @description Draw Text

draw_x = ((x - obj_trademenu.x)*2.25) + 150
draw_y = (y - obj_trademenu.y)*2.25

draw_sprite_stretched(spr_tradetab, anim_index, draw_x, draw_y, 180, 108)
draw_set_alpha(1)
draw_set_colour(c_white)
draw_set_font(fnt_inventory_small)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_text(draw_x + 2.25*40, draw_y + 2.25*24, string_ucfirst(type))
draw_set_halign(fa_left)
draw_set_valign(fa_top)