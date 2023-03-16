/// @description Insert description here
// You can write your code in this editor

if(distance_to_object(obj_player)) <= 32 {
    if keyboard_check_pressed(vk_space) && !global.immobile && instance_number(obj_messagebox) == 0 {
		global.immobile = true
		in_dialogue = true
		if !quest_active(2) && !quest_completed(2) && !quest_objective_is_complete(2, 0) {
			// Current Objective: NONE
			var temp_name, temp_text
			temp_name[0] = "Bertram"
			temp_text[0] = "Ah a newcomer! Not sure how you managed to get into\n" +
						   "the city, what with the war and all. But I'm always\n" +
						   "happy to greet another outsider. "
			
			message(temp_text, 1)
			message_nametag(temp_name, 1)
			choice_result = "InnKeep01"
		} else if quest_active(2) && !quest_completed(2) && !quest_objective_is_complete(2, 0) {
			var temp_name, temp_text
			temp_name[0] = "Bertram"
			temp_text[0] = "Ah its you, " + global.persona[0] + " I hope you find the killer" +
						   " soon!\nBut... did you need something else? "
			message(temp_text, 1)
			message_nametag(temp_name, 1)
			message_choices(["Rest", "Leave"], id)
		} else {
			global.immobile = false
			in_dialogue = false
		}
	}
}

if choice_result == "Leave" {
	in_dialogue = false
	choice_result = -1
} else if choice_result == "InnKeep01" {
	if instance_number(obj_messagebox) == 0 {
		temp_name[0] = "Bertram"
		temp_text[0] = "I am Bertram and this is my humble establishment,\n" +
						"the Palm Inn. Spirits are sadly low of late, what\n" +
						"with recent events. But... what can I do for you\n" +
						"today? "
		message(temp_text, 1)
		message_nametag(temp_name, 1)
		message_choices(["Recent Events?", "Leave"], id)
	}
	
} else if choice_result == "InnKeep02" {
	if instance_number(obj_messagebox) == 0 {
		var temp_name, temp_text
		temp_name[0] = "Bertram"
		temp_text[0] = "The Prefect does nothing, of course, in fact I\n" +
					   "wouldn't be surprised if he's behind this, the\n" +
					   "swine. But I do know a local detective looking\n" +
					   "into the murders, if you want to help, perhaps\n" +
					   "seek him out, his house is northeast of here. "
		message(temp_text, 1)
		message_nametag(temp_name, 1)
	
		message_choices(["Help", "Leave"], id)
	}
} else if choice_result == "Recent Events?" {
	var temp_name, temp_text
	temp_name[0] = "Bertram"
	temp_text[0] = "Yes... that. Well it seems recently there have been\n" +
				   "a string of murders in the Docklands. Now, crime in\n" +
				   "The Capital is strange in of itself, however these\n" +
				   "murders are doubly so. "
	temp_name[1] = global.persona[0]
	temp_text[1] = "How come? "
	temp_name[2] = "Bertram"
	temp_text[2] = "Well the murderer only seems interested in killing\n" +
				   "us outsiders, with more of us turning up dead each\n" +
				   "fortnight. "
	temp_name[3] = global.persona[0]
	temp_text[3] = "Is animosity towards outsiders common here? "
	temp_name[4] = "Bertram"
	temp_text[4] = "It's mainly the upper echelons of society here who\n" +
				   "harbour such resentment. As a result you won't see\n" +
				   "many non-Novarana residents beyond the docks, since\n" +
				   "outsiders need permission to go elsewhere. " 
			
	message(temp_text, 5)
	message_nametag(temp_name, 5)
	
	choice_result = "InnKeep02"
	
} else if choice_result == "Help" {
	var temp_name, temp_text
	temp_name[0] = "Bertram"
	temp_text[0] = "Oh thank you " + global.persona[3] + "! I wish you luck. "
	
	message(temp_text, 1)
	message_nametag(temp_name, 1)
	
	quest_add(2) // Start Quest: Foreign Aid
	quest_show_objective(2, 0)
	//quest_track(2)
	
	choice_result = -1
	in_dialogue = false
} else if choice_result == "Rest" {
	if instance_number(obj_messagebox) == 0 {
		var temp_name, temp_text
		temp_name[0] = "Bertram"
		temp_text[0] = "Of course, that will be 75 Aurum for the bed. "
		message(temp_text, 1)
		message_nametag(temp_name, 1)
		message_choices(["Accept", "Leave"], id)
	}
} else if choice_result == "Accept" {
	if instance_number(obj_messagebox) == 0 {
		global.hp = global.max_hp
		global.sp = global.max_sp
		global.mp = global.max_mp
	
		inventory_remove(0, 75)
		message_notification(global.library[0][0] + " X 75 removed from Inventory")
		message_notification("HP, SP, and MP were fully restored")
		choice_result = -1
		in_dialogue = false
	}
} else {
	choice_result = -1
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