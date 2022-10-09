/// @description Check for Input

if (keyboard_check_pressed(vk_tab) || keyboard_check_pressed(ord("I"))) && !visible {
	visible = true
	x = camera_get_view_x(view_camera[0]) + 67
	y = camera_get_view_y(view_camera[0])
	global.immobile = true
	inventory_populate(global.current_menu)
	
	// Create List Buttons
	x_margin = obj_inventory.x + 32
	y_margin = obj_inventory.y + 160
	
	if global.current_menu == "consumables"			{ current_list = global.consumables }
	else if global.current_menu == "weapons"		{ current_list = global.weapons     }
	else if global.current_menu == "armours"		{ current_list = global.armours     }
	else if global.current_menu == "accessories"	{ current_list = global.accessories }
	else if global.current_menu == "key items"		{ current_list = global.keyitems    }
	else if global.current_menu == "materials"		{ current_list = global.materials   }

	for (i = 0; i < array_length(current_list); i ++) {
		with instance_create(x_margin, y_margin, obj_inventory_button) {
			if row_id == -1 {	
				row_id = obj_inventory.i
				item_id = obj_inventory.current_list[obj_inventory.i][0]
			}
		}
		y_margin += 32
	}
	
	if y_margin > 432 {
		obj_inventory.scrollbar = true
		
		instance_create(obj_inventory.x+348, obj_inventory.y+170, obj_scrollbar)
		obj_scrollbar.max_scroll = (y_margin - 432) / 32
	}
}

if keyboard_check_pressed(vk_escape) && visible {
	visible = false
	x = -854
	y = -480
	overview_id = -1
	global.immobile = false

	instance_destroy(obj_inventory_dropdown)
	instance_destroy(obj_scrollbar)
	instance_destroy(obj_inventory_tabs)
}

if tab_switched {
	// Create List Buttons
	x_margin = obj_inventory.x + 32
	y_margin = obj_inventory.y + 160
	
	if global.current_menu == "consumables"			{ current_list = global.consumables }
	else if global.current_menu == "weapons"		{ current_list = global.weapons     }
	else if global.current_menu == "armours"		{ current_list = global.armours     }
	else if global.current_menu == "accessories"	{ current_list = global.accessories }
	else if global.current_menu == "key items"		{ current_list = global.keyitems    }
	else if global.current_menu == "materials"		{ current_list = global.materials   }

	for (i = 0; i < array_length(current_list); i ++) {
		with instance_create(x_margin, y_margin, obj_inventory_button) {
			if row_id == -1 {	
				row_id = obj_inventory.i
				item_id = obj_inventory.current_list[obj_inventory.i][0]
			}
		}
		y_margin += 32
	}
	
	if y_margin > 432 {
		obj_inventory.scrollbar = true
		
		instance_create(obj_inventory.x+348, obj_inventory.y+170, obj_scrollbar)
		obj_scrollbar.max_scroll = (y_margin - 432) / 32
	}
	
	tab_switched = false
}