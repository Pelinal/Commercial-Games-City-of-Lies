/// @description Insert description here
// You can write your code in this editor

if(distance_to_object(obj_player)) <= 32 {
    if keyboard_check_pressed(vk_space) && !global.immobile {
		global.immobile = true
		in_dialogue = true
		if quest_active(0) && !quest_completed(0) && quest_objective_is_visible(0, 2) && !quest_objective_is_complete(0, 2) {
			// Current Objective: "Speak to Prefect Carus"
			var temp_name, temp_text
			temp_name[0] = "Prefect Carus"
			temp_text[0] = "Oh look a foreigner. I thought your kind were barred\n" +
							"from entering the city, but I can see that hasn't\n" +
							"quite worked out. Now speak, I'm waiting. "
			temp_name[1] = global.persona[0]
			temp_text[1] = "*Once again you recite the tale of your quest to\n" +
						   "find your family.* "
			temp_name[2] = "Prefect Carus"
			temp_text[2] = "You came here looking for your family? Even if\n" +
						   "I did know something about them, why would I tell\n" +
						   "you? You are here illegally. You're lucky I haven't\n" +
						   "ordered your arrest yet. I still might... Begone! "
			
			message(temp_text, 3)
			message_nametag(temp_name, 3)
				
			choice_result = "Carus01"
				
			//message_choices(["Tell Him", "Lie"], id)
		} else if quest_active(0) && !quest_completed(0) && quest_objective_is_complete(0, 2) && !quest_objective_is_complete(0, 7) {
			// Current Objective: "Find Blackmail Evidence"
			var temp_name, temp_text
			temp_name[0] = "Prefect Carus"
			temp_text[0] = "I have nothing more to say. "
			message(temp_text, 1)
			message_nametag(temp_name, 1)
				
		} else if quest_active(0) && !quest_completed(0) && quest_objective_is_complete(0, 7) && !quest_objective_is_complete(0, 4) && quest_objective_is_visible(0, 4) {
			// Current Objective: "Blackmail the Prefect"
			var temp_name, temp_text
			temp_name[0] = "Prefect Carus"
			temp_text[0] = "You must enjoy trying my patience... What is it\n" +
						   "now, outsider? "
			temp_name[1] = global.persona[0]
			temp_text[1] = "*You show him the compromising documents, and\n" +
						   "threaten to expose him if he doesn't help* "
			temp_name[2] = "Prefect Carus"
			temp_text[2] = "How dare...! Where did you...? No matter. I will\n " +
						   "tell you what I know. "
			temp_name[3] = "Prefect Carus"
			temp_text[3] = "There is a derelict building on the west side of\n " +
						   "the South Docks, it used to belong to a 'Duqarte'\n" +
						   "family. "
			temp_name[4] = "Prefect Carus"
			temp_text[4] = "There, that's all I know. Now leave my manor and\n " +
						   "do not return. Ever. "
			message(temp_text, 5)
			message_nametag(temp_name, 5)
			
			inventory_remove(113, 1) // Remove Compromising letter
			
			choice_result = "Carus02"
			
		} else {
			global.immobile = false
			in_dialogue = false
		}
	}
}

if choice_result == "Carus01" {
	if instance_number(obj_messagebox) == 0 {
		quest_complete_objective(0, 2) // Complete "Speak to Prefect Carus"
		quest_show_objective(0, 7)	   // Start "Find Blackmail Evidence"
		in_dialogue = false
		choice_result = -1
	}
} else if choice_result == "Carus02" {
	if instance_number(obj_messagebox) == 0 {
		quest_complete_objective(0, 4) // Complete "Blackmail the Prefect"
		quest_show_objective(0, 8)
		//scene_actor_move(id, ["L", "L", "L", "L", "L", "L", "D", "D", "D", "D", "D", "D", "D", "D", "D", "D"], true)
		in_dialogue = false
		choice_result = -1
	}
}

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