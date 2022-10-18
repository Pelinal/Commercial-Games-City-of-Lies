/// @description Respond to Right-Click
if visible {
	obj_trademenu.overview_id = item_id
	instance_destroy(obj_inventory_dropdown)
	instance_destroy(obj_plusminus)
	
	if current_list[row_id][1] < 1 {
		array_delete(obj_trademenu.stock_list, row_id, 1)
		instance_destroy(self)
		instance_destroy(obj_trade_button)
	
		if obj_trademenu.current_tab = "buy" {
			trade_populate("buying")
		}
		else if obj_trademenu.current_tab = "sell" {
			trade_populate(obj_trademenu.category)
		}
	}
	
	x_point = mouse_x
	y_point = mouse_y

	if obj_trademenu.current_tab == "buy" {
		with instance_create(x_point, y_point, obj_inventory_dropdown) {
			type = "buy"
			x_draw = device_mouse_raw_x(0)
			y_draw = device_mouse_raw_y(0)
		}
	} else if obj_trademenu.current_tab == "sell" {
		with instance_create(x_point, y_point, obj_inventory_dropdown) {
			type = "sell"
			x_draw = device_mouse_raw_x(0)
			y_draw = device_mouse_raw_y(0)
		}
	} else {
		with instance_create(x_point, y_point, obj_inventory_dropdown) {
			type = "craft"
			x_draw = device_mouse_raw_x(0)
			y_draw = device_mouse_raw_y(0)
		}
		obj_inventory_dropdown.ingred_list = obj_trademenu.recipe_list[row_id]
	}

	obj_inventory_dropdown.chosen_item = item_id
	obj_inventory_dropdown.stock_row = row_id
}