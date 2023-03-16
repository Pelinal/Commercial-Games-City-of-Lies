/// @description Insert description here
// You can write your code in this editor

if(distance_to_object(obj_player)) <= 32 {
    if keyboard_check_pressed(vk_space) && !global.immobile {
		global.immobile = true
		
		if quest_active(0) && !quest_completed(0) && quest_objective_is_complete(0, 1) && !quest_objective_is_complete(0, 3) {
			// Current Objective: "Speak to Meriaas"
			var temp_name, temp_text
			temp_name[0] = "Meriaas"
			temp_text[0] = "What's that? Rasaara told you to come and see me, \n" +
							"did she? Very well, I will tell you what I know\n" +
							"about the Duqartes. But only after you perform a\n" +
							"small favour for me. "
			temp_name[1] = "Meriaas"
			temp_text[1] = "You see, I'm what you'd call a businessman, of\n" +
							"sorts... And recently some former trade partners\n" +
							"of mine decided they didn't need to pay me. I\n" +
							"want you to teach them the error of their ways. "
			temp_name[2] = "Meriaas"
			temp_text[2] = "They're holed up in an abandoned warehouse\n" +
							"just south of here, the third one to be precise.\n" +
							"Return to me when you've dealt with them, and\n" +
							"I'll give you what you ask. "
				
			message(temp_text, 3)
			message_nametag(temp_name, 3)
				
			choice_result = "Meriaas01"
				
			//message_choices(["Tell Him", "Lie"], id)
		} else if quest_active(0) && !quest_completed(0) && quest_objective_is_complete(0, 3) && !quest_objective_is_complete(0, 5) {
			// Current Objective: "Clear Warehouse of Ruffians"
			var temp_name, temp_text
			temp_name[0] = "Meriaas"
			temp_text[0] = "Well, what are you standing around for? You do\n" +
							"want that information about your family, don't\n" +
							"you? "
			message(temp_text, 1)
			message_nametag(temp_name, 1)
				
		} else if quest_active(0) && !quest_completed(0) && quest_objective_is_complete(0, 5) && !quest_objective_is_complete(0, 6) {
			// Current Objective: "Return to Meriaas"
			var temp_name, temp_text
			temp_name[0] = "Meriaas"
			temp_text[0] = "So you've returned, then I can only assume our\n" +
							"little task is complete. Excellent. And as ever\n" +
							"I am a man of my word, so I shall give you what\n" + 
							"you need. "
			temp_name[1] = "Meriaas"
			temp_text[1] = "I myself do not know where to find your family,\n" +
							"but I know the Prefect does. And I happen to be\n" +
							"willing to part with a very interesting letter\n" + 
							"concerning our friend in the manor. Threaten him\n" +
							"with this and he'll do anything you want. "
			temp_name[2] = "Meriaas"
			temp_text[2] = "A pleasure doing business. So long. " 
			message(temp_text, 3)
			message_nametag(temp_name, 3)
			
			choice_result = "Meriaas02"
			
		} else {
			// Current Objective: NONE
			var temp_name, temp_text
			temp_name[0] = "Meriaas"
			temp_text[0] = "Sorry, I have no business with you. Good day."
			message(temp_text, 1)
			message_nametag(temp_name, 1)	
		}
	}
}

if choice_result == "Meriaas01" {
	if instance_number(obj_messagebox) == 0 {
		quest_show_objective(0, 5)
		quest_complete_objective(0, 3)
		choice_result = -1
	}
} else if choice_result == "Meriaas02" {
	if instance_number(obj_messagebox) == 0 {
		inventory_add(113, 1) // Add compromising letter
		message_notification(global.library[113][0] + " X 1 added to Inventory")
		quest_change_desc(0, "I have received compromising documents on Carus' illegal activities, this should be enough to get him to talk.")
		quest_complete_objective(0, 6)
		//scene_actor_move(id, ["L", "L", "L", "L", "L", "L", "D", "D", "D", "D", "D", "D", "D", "D", "D", "D"], false) // REDO this so that it takes [Direction, AmountX32] input instead
		//scene_screen_to_black(1)
		//alarm[0] = 75
		
		choice_result = -1
	}
}