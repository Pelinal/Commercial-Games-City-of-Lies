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
			} else {
				choice_result = "Q1O1"
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
	temp_text[1] =  "*You tell him of the mission to discover your long\n" +
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
		var temp_name, temp_text
		temp_name[0] = "Harbourmaster Farso"
		temp_text[0] = "In any case I recommend asking around the port,\n" +
					   "someone is bound to know something. Alternatively,\n" +
					   "speak to the local Prefect, though be warned, he\n" +
					   "is not very welcoming to foreigners. "
		
		message(temp_text, 1)
		message_nametag(temp_name, 1)
		message_choices(["Questions", "Leave"], id)
		
	}
} else if choice_result == "Leave" {
	quest_complete_objective(0, 0)
	quest_show_objective(0, 1)
	quest_show_objective(0, 2)
	choice_result = -1
} else if choice_result == "Questions" || choice_result == "[Back]" {
	if instance_number(obj_messagebox) < 1 {
		var temp_name, temp_text
		temp_name[0] = "Harbourmaster Farso"
		temp_text[0] = "You have questions? What did you want to ask me? "
	
		
		message(temp_text, 1)
		message_nametag(temp_name, 1)
		message_choices(["Background", "City", "Prefect", "Leave"], id)
	}
	
} else if choice_result == "Background" {
	if instance_number(obj_messagebox) < 1 {
		var temp_name, temp_text
		temp_name[0] = "Harbourmaster Farso"
		temp_text[0] = "You want to know about me? Well there isn't\n" +
					   "really much to say. I was born here in the city,\n" +
					   "and like all citizens, I am not able to leave. "
		temp_name[1] = "Harbourmaster Farso"
		temp_text[1] = "Though being a part of the Silver Marines does\n" +
					   "allow me to see more than most who live here, as\n" +
					   "We are tasked with the security of our ports and\n" +
					   "meet foreigners regularly for trade purposes. "
		temp_name[2] = "Harbourmaster Farso"
		temp_text[2] = "Perhaps you wonder 'don't you desire freedom?',\n" +
					   "but then I'd ask: freedom from what? The safety\n" +
					   "of our walled city? The prosperity of our nation?\n" +
					   "The way I see it, I'm in the best place I can be. "
	
		
		message(temp_text, 3)
		message_nametag(temp_name, 3)
	}
	
	if (obj_messagebox.batch_counter >= obj_messagebox.batch) && !(obj_messagebox.choices_enabled) { 
		message_choices(["City", "Prefect", "[Back]"], id)
	}
} else if choice_result == "City" {
	if instance_number(obj_messagebox) < 1 {
		var temp_name, temp_text
		temp_name[0] = "Harbourmaster Farso"
		temp_text[0] = "Ahh you wish to know about our fair city? I am\n" +
					   "happy to oblige, of course. "
		temp_name[1] = "Harbourmaster Farso"
		temp_text[1] = "The Capital is an ancient city, dating back to the\n" +
					   "time of the Founders. It served as their capital\n" +
					   "city, and was the beating heart of the Founder\n" +
					   "Empire, which spanned all of Kosmos. "
		temp_name[2] = "Harbourmaster Farso"
		temp_text[2] = "The city was abandoned after the Founders'\n" +
					   "mysterious downfall, and it would take another\n" +
					   "2000 years for the city to be reinhabited. And\n" +
					   "under the leadership of our ancestors, it was\n " +
					   "restored almost to its former glory. "
		temp_name[3] = "Harbourmaster Farso"
		temp_text[3] = "So this is our great purpose. Under the watchful\n" +
					   "leadership of the Vox, Church and our God, we must\n" +
					   "endeavour to reclaim the past, and uncover the lost\n" +
					   "wonders of the Founder race and their technology. " 
	
		message(temp_text, 4)
		message_nametag(temp_name, 4)
	}
	
	if (obj_messagebox.batch_counter >= obj_messagebox.batch) && !(obj_messagebox.choices_enabled) { 
		message_choices(["Background", "Prefect", "[Back]"], id)
	}
} else if choice_result == "Prefect" {
	if instance_number(obj_messagebox) < 1 {
		var temp_name, temp_text
		temp_name[0] = "Harbourmaster Farso"
		temp_text[0] = "Hmm... you want to know about Prefect Carus? He\n" +
						"is our local governor, of sorts. It's his duty to\n " +
						"manage the day to day affairs of the Docklands -\n" +
						"one of the many prefectures by which the city is \n" +
						"divided. "
		temp_name[1] = "Harbourmaster Farso"
		temp_text[1] = "All Prefects are elected from members of the Vox,\n" +
						"our governing body. Carus is a traditionalist, and\n" +
						"is heavily against reform, especially concerned you\n" +
						"outsiders. "
		temp_name[2] = "Harbourmaster Farso"
		temp_text[2] = "If you want to get him to answer your questions\n" +
						"you may need to resort to blackmail, I would\n" +
						"search his office, perhaps you can find something\n" +
						"there you can use against him. "
				   
		
		message(temp_text, 3)
		message_nametag(temp_name, 3)
	}
	
	if (obj_messagebox.batch_counter >= obj_messagebox.batch) && !(obj_messagebox.choices_enabled) { 
		message_choices(["Background", "City", "[Back]"], id)
	}
}