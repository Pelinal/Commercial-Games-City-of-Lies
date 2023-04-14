/// @description Insert description here
// You can write your code in this editor

if(distance_to_object(obj_player)) <= 32 {
    if keyboard_check_pressed(vk_space) && !global.immobile {
		if quest_active(1) && quest_objective_is_visible(1, 2) && !quest_objective_is_complete(1, 2) {
			global.immobile = true
			in_dialogue = true
			var temp_name, temp_text
			temp_name[0] =  "Erasmus"
			temp_text[0] =  string_wordwrap_width("So, you're the one that Mattia allowed to tag along? Hmm, not up to me, even if I disagree with his decision. You'll need to take it up with the boss once we get out of here. ", 452, "\n")
			temp_name[1] =  global.persona[0]
			temp_text[1] =  string_wordwrap_width("Well it was sort of a coincidence that I happened to be captured, and put in the same cell as Mattia just as you were freeing him. But thank you, regardless. ", 452, "\n")
			temp_name[2] =  "Erasmus"
			temp_text[2] =  string_wordwrap_width("Don't thank me yet. The way I came in is no longer useable, the ladder broke and I'd need rope to repair it. But more importantly, you'll need a better weapon than whatever... that is. Thankfully, I can craft you one. ", 452, "\n")	
			temp_name[3] =  "Erasmus"
			temp_text[3] =  string_wordwrap_width("Here, take this pickaxe and gather some of the copper ore around here, should look like pale grey rocks with green veins on them. There's plenty in this cave, though three chunks ought to do it. After that, we can focus on repairing the ladder. ", 452, "\n")
			
			quest_complete_objective(1, 2)
			quest_show_objective(1, 3)
			quest_change_desc(1, "After speaking with our savior, Erasmus, he has tasked me with retrieving three pieces of copper ore from the cave. They are pale rocks with green speckles on them.")
			message(temp_text, 4)
			message_nametag(temp_name, 4)
	
		} else if quest_active(1) && quest_objective_is_visible(1, 4) && !quest_objective_is_complete(1, 4) && quest_objective_is_complete(1, 3) {
			// Collected enough ore 
			in_dialogue = true
			var temp_name, temp_text
			temp_name[0] =  "Erasmus"
			temp_text[0] =  string_wordwrap_width("Got the ore? Good, here's the rest of the materials we'll need. Let's get it done then. ", 452, "\n")
			message(temp_text, 1)
			message_nametag(temp_name, 1)
		
			inventory_add(21, 5)
			inventory_add(22, 5)
			quest_complete_objective(1, 4)
			quest_show_objective(1, 5)
			choice_result = "MQ2FirstCraft"
		} else if quest_active(1) && quest_objective_is_visible(1, 5) && !quest_objective_is_complete(1, 5) {
			// Collected enough ore 
			in_dialogue = true
			var temp_name, temp_text
			temp_name[0] =  "Erasmus"
			temp_text[0] =  string_wordwrap_width("What are you waiting for, do you not want a new weapon? Come on, let's make it. ", 452, "\n")
			message(temp_text, 1)
			message_nametag(temp_name, 1)
			
			choice_result = "MQ2FirstCraft"
		} else if quest_active(1) && quest_objective_is_visible(1, 6) && !quest_objective_is_complete(1, 6) {
			// Need to get a rope
			in_dialogue = true
			var temp_name, temp_text
			temp_name[0] =  "Erasmus"
			temp_text[0] =  string_wordwrap_width("I hope you like the new weapon, should keep you better protected from whatever vermin infest these caves. ", 452, "\n")
			temp_name[1] =  "Erasmus"
			temp_text[1] =  string_wordwrap_width("Next thing we'll need to get out of here, as  I said, is a rope. I would wager there would be some in that ruin east of here, haven't been down there yet myself. Usually avoid such places, so be careful if you go there. ", 452, "\n")
			message(temp_text, 2)
			message_nametag(temp_name, 2)
		} else if quest_active(1) && quest_objective_is_visible(1, 7) && !quest_objective_is_complete(1, 7) {
			// Got a rope
			in_dialogue = true
			var temp_name, temp_text
			temp_name[0] =  "Erasmus"
			temp_text[0] =  string_wordwrap_width("Ah I see you found a rope! It's a bit old, but it should do the trick. Give me a moment and I'll repair the ladder. ", 452, "\n")
			//scene_screen_fade(0.035)
			message(temp_text, 1)
			message_nametag(temp_name, 1)
			
			inventory_remove(116, 1)
			
			choice_result = "MQ2ErasmusRope"
		}
	}
}

if choice_result == "MQ2FirstCraft" {
	if instance_number(obj_messagebox) == 0 && instance_number(obj_trademenu) == 0 {
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
		
		///obj_trademenu.current_tab = "craft"
		
		choice_result = -1
	}

} else if choice_result == "MQ2ErasmusRope" {
	if instance_number(obj_messagebox) == 0 && instance_number(obj_fade) == 0 {
		global.immobile = true
		
		in_dialogue = true
		var temp_name, temp_text
		temp_name[0] =  "Erasmus"
		temp_text[0] =  string_wordwrap_width("There, it's all fixed, you should be able to use the eastern exit to the surface now. You two go and speak with the boss, I have some errands I need to run here before I follow. ", 452, "\n")
		temp_name[1] =  "Mattia"
		temp_text[1] =  string_wordwrap_width("I'll meet you there as well, I'm going to search for some more treasure before I leave! Good luck with the boss! ", 452, "\n")
		
		with obj_mattia_arosio {
			sprite_index = up_sprite
		}
		
		message(temp_text, 2)
		message_nametag(temp_name, 2)
		
		choice_result = "MQ2QuestUpdateRope"
	}
} else if choice_result == "MQ2QuestUpdateRope" {
	if instance_number(obj_messagebox) == 0 {
		quest_complete_objective(1, 7)
		quest_show_objective(1, 8)
		quest_change_desc(1, "The ladder has been repaired, and I can finally escape the caves! Erasmus said the exit was on the eastern side of the cave.")
	}
}

if instance_number(obj_messagebox) == 0 && choice_result == -1 { in_dialogue = false }

if in_dialogue {
	//alarm[0] = 30
	
	var player_diff_x, player_diff_y
	player_diff_x = x - obj_player.x
	player_diff_y = y - obj_player.y
	
	if abs(player_diff_x) > abs(player_diff_y) {
		// If X diff is larger than Y diff
		sprite_index = lr_sprite
		image_xscale = sign(player_diff_x) // Either -1 or 1
	} else {
		// If Y diff is larger than X diff
		if sign(player_diff_y) == -1 {
			sprite_index = dn_sprite
		} else {
			sprite_index = up_sprite
		}
	}
}