/// @description Insert description here
// You can write your code in this editor

if(distance_to_object(obj_player)) <= 32 {
    if keyboard_check_pressed(vk_space) && !global.immobile {
		global.immobile = true
		in_dialogue = true
		if quest_active(0) && !quest_completed(0) && quest_objective_is_visible(0, 2) && !quest_objective_is_complete(0, 2) {
			// Current Objective: "Speak to Prefect Carus"
			var temp_name, temp_text
			temp_name[0] =  "Sofia"
			temp_text[0] =  "How does the Prefect expect me to sort all\n" +
							"this paperwork?! It doesn't even have the\n" +
							"simplest form of organisation. But... don't\n" +
							"mind me. Speak to Carus, if you will. "
				
			message(temp_text, 1)
			message_nametag(temp_name, 1)
		} else if quest_active(0) && !quest_completed(0) && quest_objective_is_complete(0, 2) && !quest_objective_is_complete(0, 7) {
			// Current Objective: "Find Blackmail Evidence"
			if persaude != "failed" {
				var temp_name, temp_text
				temp_name[0] =  "Sofia"
				temp_text[0] =  "You again? Didn't I just say I was busy?\n" +
								"Or perhaps I didn't... what can Carus'\n" +
								"slav... *ahem* secretary do for you? "
				
				message(temp_text, 1)
				message_nametag(temp_name, 1)
				message_choices(["Evidence", "Leave"], id)
			} else {
				var temp_name, temp_text
				temp_name[0] =  "Sofia"
				temp_text[0] =  "I already told you I can't! Now\n" +
								"please leave me alone before he\n" +
								"suspects something. "
		
				message(temp_text, 1)
				message_nametag(temp_name, 1)
			}
		}
	}
}

if choice_result == "Evidence" {
	if instance_number(obj_messagebox) < 1 {
		var temp_name, temp_text
		temp_name[0] =  "Sofia"
		temp_text[0] =  "What?! You wan't me to help you to\n" +
						"blackmail my boss? No way! As much\n" +
						"as I'd like to see him squirm, it\n" +
						"isn't worth risking my job over."
					
		message(temp_text, 1)
		message_nametag(temp_name, 1)
		message_choices(["Persaude (25%)", "Leave"], id)
	}
} else if choice_result == "Persaude (25%)" {
	if random(1) <= 0.25 {
		var temp_name, temp_text
		temp_name[0] =  "Sofia"
		temp_text[0] =  "Oh alright! I wan't to see him\n" +
						"get what he deserves anyway, so\n" +
						"here. A letter with highly illegal\n" +
						"activities that the Prefect had a\n" +
						"hand in. Now go. We never spoke. "
		
		message(temp_text, 1)
		message_nametag(temp_name, 1)
		
		persaude = "success"
		inventory_add(113, 1) // Add "Compromising Letter"
		choice_result = -1
	} else {
		var temp_name, temp_text
		temp_name[0] =  "Sofia"
		temp_text[0] =  "I already told you I can't! Now\n" +
						"please leave me alone before he\n" +
						"suspects something. "
		
		message(temp_text, 1)
		message_nametag(temp_name, 1)
		
		persaude = "failed"
		choice_result = -1
	}
} else {
	choice_result = -1
}

if instance_number(obj_messagebox) == 0 {
	in_dialogue = false
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