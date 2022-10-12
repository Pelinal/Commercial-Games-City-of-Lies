/// @description Engage Trading

if(distance_to_object(obj_player)) <= 32 {
    if keyboard_check(vk_space) && !global.immobile {
        global.immobile = true
		
		// Create Tabs
		with instance_create(camera_get_view_x(view_camera[0]) + 67, camera_get_view_y(view_camera[0]), obj_trademenu) {
			stock_list = obj_vendor.stock_list
			category = obj_vendor.category
		}
		with instance_create(obj_trademenu.x, obj_trademenu.y+3, obj_tradetab) {
			if type = -1 { type = "buy" }
		}
		with instance_create(obj_trademenu.x + 96, obj_trademenu.y+3, obj_tradetab) {
			if type = -1 { type = "sell" }
		}
		
		if crafting {
			// Crafting Tab (TBA)
			with instance_create(obj_trademenu.x + 258, obj_trademenu.y+3, obj_tradetab) {
				if type = -1 { type = "craft" }
			}
		}
    }
}