/// @description Engage Trading

if(distance_to_object(obj_player)) <= 32 {
    if keyboard_check(vk_space) && !global.immobile && instance_number(obj_trademenu) == 0 {
        global.immobile = true
		
		// Create Tabs
		instance_create(camera_get_view_x(view_camera[0]) + 67, camera_get_view_y(view_camera[0]), obj_trademenu)
		
		obj_trademenu.stock_list = stock_list
		obj_trademenu.category = category
		obj_trademenu.crafting_category = crafting_category
		obj_trademenu.shop_name = shop_name
		
		obj_trademenu.current_vendor = id

		if crafting_category == "alchemy" { 
			obj_trademenu.recipe_list = crafting_fetch_recipes(recipe_list, "alchemy")
		}
		else if crafting_category == "smithing" { 
			obj_trademenu.recipe_list = crafting_fetch_recipes(recipe_list, "smithing")
		}
		else {
			obj_trademenu.recipe_list = crafting_fetch_recipes(recipe_list, "enchanting")
		}
		
		with instance_create(obj_trademenu.x, obj_trademenu.y+3, obj_tradetab) {
			type = "buy"
		}
		with instance_create(obj_trademenu.x + 80, obj_trademenu.y+3, obj_tradetab) {
			type = "sell"
		}
		
		if crafting {
			// Crafting Tab
			with instance_create(obj_trademenu.x + 160, obj_trademenu.y+3, obj_tradetab) {
				type = "craft"
			}
		}
    }
}