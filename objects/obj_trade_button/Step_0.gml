/// @description Check for trademenu visibility

if obj_trademenu.current_tab != "craft" {
	if obj_trademenu.stock_list[row_id][1] <= 0 && obj_trademenu.current_tab == "buy" {
		array_delete(obj_trademenu.stock_list, row_id, 1)
		instance_destroy(self)
		instance_destroy(obj_trade_button)
		trade_populate("buying")
	}
	if obj_trademenu.current_tab == "sell" && inventory_fetch(item_id) <= 0 {
		instance_destroy(self)
		instance_destroy(obj_trade_button)
		trade_populate(obj_trademenu.category)
	}
}
if obj_trademenu.sprite_to_draw == spr_crafting { sprite_index = spr_button_216_32 } else { sprite_index = spr_button_288_32 }

if y > obj_trademenu.y + 432 || y < obj_trademenu.y + 70 {
	visible = false
} else { visible = true }


if obj_trademenu.can_scroll {
	if mouse_wheel_up() { obj_trademenu.scroll_value -= 1 y -= 32 draw_y -=72 } 
	else if mouse_wheel_down()  { obj_trademenu.scroll_value += 1 y += 32 draw_y += 72}
}

//// failsafe
//if obj_trademenu.scroll_value < 0 { obj_trademenu.scroll_value = 0 }
//if obj_trademenu.scroll_value > obj_trademenu.max_scroll { obj_trademenu.scroll_value = obj_trademenu.max_scroll }