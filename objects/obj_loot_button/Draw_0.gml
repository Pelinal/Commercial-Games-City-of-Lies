/// @description Draw Item name, icon and amount

draw_self()
draw_set_alpha(1)
draw_set_colour(c_white)
draw_set_font(fnt_textbox_10)

// Draw Icon
if inventory_is_enchanted(loot) { draw_tile(ts_icons_iconset, 143, 0, x + 4, y + 2) }
draw_tile(ts_icons_iconset_16, global.icons[loot], 0, x + 4, y + 2)

// Draw Text 
draw_text(x + 16, y + 2, global.library[loot][0] + " X" + string(amount))