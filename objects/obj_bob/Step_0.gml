/// @description Bob unique vendor

/// @description Engage Trading

if(distance_to_object(obj_player)) <= 32 {
    if keyboard_check_pressed(vk_space) && !global.immobile {
		global.immobile = true
		if instance_number(obj_messagebox) == 0 {
			if !quest_active(0) && !quest_completed(0) {
				temp_name[0] = "Bob"
				temp_text[0] = "Hello there friend! May I interest you in my wares?\nOr perhaps you wish to help me with something...? "
				message(temp_text, 1)
				message_nametag(temp_name, 1)
				message_choices(["Trade", "Help?", "Leave"], id)
			}
			else if quest_active(0) && !quest_completed(0) && !quest_objective_is_visible(0, 2) {
				temp_name[0] = "Bob"
				temp_text[0] = "Hello again! Have you found those herbs yet? Or do\nyou wish to trade or craft? "
				message(temp_text, 1)
				message_nametag(temp_name, 1)
				message_choices(["Trade", "Leave"], id)
			}
			else if quest_active(0) && !quest_completed(0) && quest_objective_is_visible(0, 2) {
				temp_name[0] = "Bob"
				temp_text[0] = "Aha! I see you have the herbs I need! Please let\nme make the potion now "
				temp_name[1] = "Bob"
				temp_text[1] = "Et voila! It is complete. Thank you for your help\ntake these SP Potions for your time. "
				message(temp_text, 2)
				message_nametag(temp_name, 2)
				quest_change_desc(0, "You completed Bob's Errand.")
				quest_complete_objective(0, 2)
				quest_complete(0) // Complete Quest + Obtain rewards
			}
			else if quest_completed(0) {
				choice_result = "Trade"	
			}
		}
		
    }
}

if choice_result == "Trade" {
	global.immobile = true
		
	// Create Tabs
	with instance_create(camera_get_view_x(view_camera[0]) + 67, camera_get_view_y(view_camera[0]), obj_trademenu) {
		stock_list = obj_vendor.stock_list
		category = obj_vendor.category
		crafting_category = obj_vendor.crafting_category
		shop_name = obj_vendor.shop_name

		if crafting_category == "alchemy" { 
			recipe_list = crafting_fetch_recipes(obj_vendor.recipe_list, "alchemy")
		}
		else if crafting_category == "smithing" { 
			recipe_list = crafting_fetch_recipes(obj_vendor.recipe_list, "smithing")
		}
		else {
			recipe_list = crafting_fetch_recipes(obj_vendor.recipe_list, "enchanting")
		}
	}
	with instance_create(obj_trademenu.x, obj_trademenu.y+3, obj_tradetab) {
		if type = -1 { type = "buy" }
	}
	with instance_create(obj_trademenu.x + 80, obj_trademenu.y+3, obj_tradetab) {
		if type = -1 { type = "sell" }
	}
		
	if crafting {
		// Crafting Tab
		with instance_create(obj_trademenu.x + 160, obj_trademenu.y+3, obj_tradetab) {
			if type = -1 { type = "craft" }
		}
	}
	
	choice_result = -1
} else if choice_result == "Help?" {
	message(["Ah yes, I need some help making more potions for my\n" +
					"customers. Would you find some herbs for me so I\ncan" +
					"craft them? I will reward you for your troubles\nof course. "], 1)
	quest_add(0) // Add Quest to craft health potion
	choice_result = -1
} else if choice_result == "Leave" {
	global.immobile = false
}