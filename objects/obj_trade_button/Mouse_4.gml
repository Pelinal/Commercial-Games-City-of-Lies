/// @description Respond to Left-Click
if clickable {
	if obj_trademenu.current_tab == "buy" || obj_trademenu.current_tab == "craft" {
		if global.gold >= item_price {
			inventory_remove(0, item_price)
			inventory_add(item_id, 1)
			obj_trademenu.stock_list[row_id][1] --
		}
	}
	else if obj_trademenu.current_tab == "sell" {
		if inventory_fetch(item_id) > 0 {
			inventory_add(0, item_price)
			inventory_remove(item_id, 1)
			array_push(obj_trademenu.stock_list, [item_id, 1])
		}
	}
}
if !clickable {
	if visible {
		obj_trademenu.overview_id = item_id
		clickable = true
	}
}