	/// @description Respond to Right-Click
if visible {
	obj_inventory.overview_id = item_id
	instance_destroy(obj_inventory_dropdown)

	x_point = mouse_x
	y_point = mouse_y

	if global.current_menu != "materials" && global.current_menu != "key items" {
		with instance_create(x_point, y_point, obj_inventory_dropdown) {
			if global.current_menu == "consumables" {
				type = "use"
			}
			else if global.current_menu == "armours" || global.current_menu == "weapons" || global.current_menu == "accessories"  {
				type = "equip"
			}
			
			x_draw = device_mouse_raw_x(0)
			y_draw = device_mouse_raw_y(0)
		}
	
		with instance_create(x_point, y_point + 32, obj_inventory_dropdown) {
			if type = -1 {
				type = "destroy"
			}
			x_draw = device_mouse_raw_x(0)
			y_draw = device_mouse_raw_y(0) + 72
		}
	} else if global.current_menu == "key items" {
		with instance_create(x_point, y_point, obj_inventory_dropdown) {
			x_draw = device_mouse_raw_x(0)
			y_draw = device_mouse_raw_y(0)
		}
		for (i = 0; i < array_length(global.k_library); i ++) {
			if global.k_library[i][0] == item_id {
				obj_inventory_dropdown.type = global.k_library[i][2]
			}
		}
	} else {
		with instance_create(x_point, y_point, obj_inventory_dropdown) {
			type = "destroy"
			x_draw = device_mouse_raw_x(0)
			y_draw = device_mouse_raw_y(0)
		}
	}

	obj_inventory_dropdown.chosen_item = item_id
}