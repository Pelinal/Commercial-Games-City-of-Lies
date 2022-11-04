/// @description Check for Input
if room != rm_setup {
	if (keyboard_check_pressed(vk_tab) || keyboard_check_pressed(ord("I"))) && !visible && !global.immobile {
		visible = true
		x = camera_get_view_x(view_camera[0]) + 67
		y = camera_get_view_y(view_camera[0])
		global.immobile = true
		inventory_populate(global.current_menu)
		scrollbar = false
	
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
					y_draw = 360 + (72 * obj_inventory.i)
				}
			}
			y_margin += 32
		}
	
		if i >= 9 {
			scrollbar = true
		

			max_scroll = (y_margin - 960) / 72
		}
	}

	if keyboard_check_pressed(vk_escape) && visible {
		scrollbar = false
		visible = false
		x = -854
		y = -480
		overview_id = -1
		global.immobile = false

		instance_destroy(obj_inventory_dropdown)
		instance_destroy(obj_inventory_tabs)
	}

	if tab_switched {
		// Create List Buttons
		scrollbar = false
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
					y_draw = 360 + (72 * obj_inventory.i)
				}
			}
			y_margin += 32
		}
	
		if i >= 9 {
			scrollbar = true

			max_scroll = (y_margin - 960) / 72
		}
	
		tab_switched = false
	}
}