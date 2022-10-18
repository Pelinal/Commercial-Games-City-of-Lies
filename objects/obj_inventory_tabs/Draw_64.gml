/// @description Draw Text

draw_x = ((x - obj_inventory.x) * 2.25) + 150
draw_y = ((y - obj_inventory.y) * 2.25) 

draw_sprite_stretched(spr_icontabs, anim_index, draw_x, draw_y, 216, 216)
draw_set_font(fnt_inventory_small)
draw_set_alpha(1)
draw_set_colour(c_white)

draw_set_halign(fa_center)
draw_text(draw_x + 108, draw_y + 165, string_ucfirst(tab))
draw_set_halign(fa_left)