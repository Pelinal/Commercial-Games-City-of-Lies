/// @description Insert description here
// You can write your code in this editor

if(distance_to_object(obj_player)) <= 48 {
    if keyboard_check_pressed(vk_space) && !global.immobile {
		global.immobile = true
		if instance_number(obj_messagebox) == 0 {
			if quest_active(0) && !quest_completed(0) && !quest_objective_is_complete(0, 0) {
				var temp_name, temp_text
				temp_name[0] = "Harbourmaster Farso"
				temp_text[0] = "Hmm... a newcomer, eh? Haven't seen many of you\n" +
							   "lot since refugees were refused access to city.\n" +
							   "I won't bother asking how you got here, but I need\n" +
							   "you to register your arrival. Name please. "
				
				message(temp_text, 1)
				message_nametag(temp_name, 1)
				message_choices(["Tell Him", "Lie"], id)
			}
		}
	}
}

if choice_result == "Tell Him" || choice_result == "Lie" {
	var temp_name, temp_text
	temp_name[0] = "Harbourmaster Farso"
	if choice_result == "Tell Him" {
		temp_text[0] = "So your name is " + global.persona[0] + " Duqarte? Curious indeed...\n" +
					   "*Ahem* What is your business in The Capital, our\n" +
					   "shining city? "
	} else {
		temp_text[0] = "Right... I'll add that to my logbook " + global.persona[3] + ". *Ahem*\n" +
					   "What is your business in The Capital, our shining\n" +
					   "city? "
	}
	temp_name[1] =  global.persona[0]
	temp_text[1] =  "*You tell him of your mission to discover you long\n" +
					"lost family, and how it led to this city* "
	temp_name[2] =  "Harbourmaster Farso"
	temp_text[2] =  "Ahh, so it is your family you seek? Well yes... I\n" +
					"could have sworn I'd heard of the Duqarte family.\n" +
					"Not quite sure how or why though, how odd. "
	//temp_name[3] =  "Harbourmaster Farso"
	//temp_text[3] =	"In any case I recommend asking around the port,\n" +
	//				"someone is bound to know something. Alternatively,\n" +
	//				"speak to the local Prefect, though be warned, he\n" +
	//				"is not very welcoming to foreigners. "
				
	message(temp_text, 3)
	message_nametag(temp_name, 3)
	choice_result = "Q1O1"
} else if choice_result == "Q1O1" {
	if instance_number(obj_messagebox) < 1 {
		var temp_name
		temp_name[0] = "Harbourmaster Farso"
		temp_text[0] = "In any case I recommend asking around the port,\n" +
					   "someone is bound to know something. Alternatively,\n" +
					   "speak to the local Prefect, though be warned, he\n" +
					   "is not very welcoming to foreigners. "
		message_nametag(temp_name, 1)
		message(temp_text, 1)
		message_choices(["Thanks"], id)
		
	}
} else if choice_result == "Thanks" {
	quest_complete_objective(0, 0)
	quest_show_objective(0, 1)
	quest_show_objective(0, 2)
	choice_result = -1
}