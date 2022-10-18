/// @description Draw Icon, Name and Amount

draw_x = (obj_trademenu.draw_x) + (x - obj_trademenu.x) + 30
//draw_y = (obj_trademenu.draw_y) + (y - obj_trademenu.y)

// Draw Amount
if obj_trademenu.current_tab == "sell" {
	current_list = obj_trademenu.pop_list
}
else if obj_trademenu.current_tab == "buy" {
	current_list = obj_trademenu.stock_list
}
else if obj_trademenu.current_tab == "craft" {
	current_list = obj_trademenu.recipe_list
}

if array_length(current_list) > 0 {
	draw_set_alpha(1)
	draw_set_color(c_white)
	draw_set_font(fnt_inventory_small)

	draw_sprite_stretched(sprite_index, anim_index, draw_x, draw_y, sprite_width*2.25, sprite_height*2.25)
	
	// Draw Icon
	if inventory_is_enchanted(item_id) { draw_tile(ts_icons_iconset_64, 143, 0, draw_x, draw_y) }
	draw_tile(ts_icons_iconset_64, global.icons[item_id], 0, draw_x, draw_y)

	// Draw Name
	draw_text(draw_x + 2.25*48, draw_y + 2.25*4, global.library[item_id][0])
	
	if obj_trademenu.current_tab == "buy" {
		draw_text(draw_x + 2.25*152, draw_y + 2.25*4, "x " + string(current_list[row_id][1]))
		
		draw_tile(ts_icons_iconset_64, global.icons[0], 0, draw_x + 2.25*182, draw_y)
		draw_text(draw_x + 2.25*212, draw_y + 2.25*4, string(item_price))
		
		//if inventory_check_equipped(item_id) { draw_text(draw_x + 2.25*220, draw_y + 2.25*4, "(Equipped)")}
	}
	else if obj_trademenu.current_tab == "sell" {
		draw_text(draw_x + 2.25*152, draw_y + 2.25*4, "x " + string(inventory_fetch(item_id)))
		draw_tile(ts_icons_iconset_64, global.icons[0], 0, draw_x + 2.25*182, draw_y)
		draw_text(draw_x + 2.25*212, draw_y + 2.25*4, string(item_price))
		if inventory_check_equipped(item_id) { draw_text(draw_x + 2.25*244, draw_y + 2.25*4, "(Equipped)")}
	}
	else if obj_trademenu.current_tab == "craft" {
		//draw_text(draw_x + 2.25*152, draw_y + 2.25*4, "x " + string(inventory_fetch(item_id)))
		draw_tile(ts_icons_iconset_64, global.icons[0], 0, draw_x + 2.25*165, draw_y)
		draw_text(draw_x + 2.25*195, draw_y + 2.25*4, string(item_price))
		//if inventory_check_equipped(item_id) { draw_text(draw_x + 2.25*244, draw_y + 2.25*4, "(Equipped)")}
	}
}
