/// @description Dialogue

switch char_type {
	case "Sailor 1":
		up_sprite = spr_sailor_1_up
		dn_sprite = spr_sailor_1_dn
		lr_sprite = spr_sailor_1_lr
		break
	case "Sailor 2":
		up_sprite = spr_sailor_2_up
		dn_sprite = spr_sailor_2_dn
		lr_sprite = spr_sailor_2_lr
		break
	case "Farah":
		up_sprite = spr_farah_up
		dn_sprite = spr_farah_dn
		lr_sprite = spr_farah_lr
		break
	case "Hiram":
		up_sprite = spr_hiram_up
		dn_sprite = spr_hiram_dn
		lr_sprite = spr_hiram_lr
		break
	default:
		up_sprite = spr_sailor_1_up
		dn_sprite = spr_sailor_1_dn
		lr_sprite = spr_sailor_1_lr
		break
}

if(distance_to_object(obj_player)) <= 32 {
    if keyboard_check_pressed(vk_space) && !global.immobile && instance_number(obj_messagebox) == 0 {
		global.immobile = true
		in_dialogue = true
		if char_name == "Farah al-Jidaq" {
			// Promenade Palm Inn #1
			var temp_name, temp_text
			if !met_me {
				temp_name[0] = char_name
				temp_text[0] = "A fellow traveller I see, I guess you're stuck here\n" +
							   "too? I came here to study the ruins from my home in\n" +
							   "Kamara, to the south. But now they won't let me\n" +
							   "leave! "
				temp_name[1] = char_name
				temp_text[1] = "They say it's because of the war on the continent\n" +
							   "making travel dangerous. Bah! They don't care about\n" +
							   "us. However on second thought, crossing a warzone\n" +
							   "to get home probably isn't a great idea. "
			
				message(temp_text, 2)
				message_nametag(temp_name, 2)
				choice_result = "FarahInn01"
			} else {
				var temp_name, temp_text
				temp_name[0] = char_name
				temp_text[0] = "Hello again " + global.persona[0] + " did you want " +
							   "to ask more\nquestions about Kamara? "
			
				message(temp_text, 1)
				message_nametag(temp_name, 1)
				message_choices(["Questions", "Leave"], id)
			}
		} else if char_name == "Hiram Amin" {
			if !met_me {
				// Promenade Palm Inn #2
				var temp_name, temp_text
				temp_name[0] = char_name
				temp_text[0] = "Hmm... what have we here. Tell me my " + global.persona[8] + "\n" +
							   "do you believe in the Architect, mighty creator\n" +
							   "of the universe that now stands before you? "
				message(temp_text, 1)
				message_nametag(temp_name, 1)
				message_choices(["Yes", "No"], id)
			} else {
				var temp_name, temp_text
				temp_name[0] = char_name
				temp_text[0] = "Hello again my child, you are faring well?"
				message(temp_text, 1)
				message_nametag(temp_name, 1)
				//message_choices(["Yes", "No"], id)
			}
		} else {
			global.immobile = false
			in_dialogue = false
		}
	}
}

if char_name == "Farah al-Jidaq" {
	if choice_result == "FarahInn01" {
		if instance_number(obj_messagebox) == 0 {
			met_me = true
			var temp_name, temp_text
			temp_name[0] = char_name
			temp_text[0] = "Sorry, I'll stop ranting, I am Farah al-Jidaq, \n" +
						   "travelling scholar, and you are? "
			message(temp_text, 1)
			message_nametag(temp_name, 1)
			message_choices(["Tell Her", "Leave"], id)
		}
	
	} else if choice_result == "Tell Her" {
		if instance_number(obj_messagebox) == 0 {
			var temp_name, temp_text
			temp_name[0] = char_name
			temp_text[0] = "Nice to meet you " + global.persona[0] +
						   ", with a surname like that\nI take it you're from Terrapacis? "
			temp_name[1] = global.persona[0]
			temp_text[1] = "That's correct. I grew up in the capital, Orevilla. "
			message(temp_text, 2)
			message_nametag(temp_name, 2)
			choice_result = "FarahInn02"
		}
	} else if choice_result == "FarahInn02" {
		if instance_number(obj_messagebox) == 0 {
			var temp_name, temp_text
			temp_name[0] = char_name
			temp_text[0] = "What a delightful city it is! I hope this war is\n" +
						   "a short one so I can visit again. But, if you\n" +
						   "would like to know about my homeland of Kamara\n" +
						   "please do not hesitate to ask. "
			
			message(temp_text, 1)
			message_nametag(temp_name, 1)
		
			message_choices(["Capital?", "History?", "Culture?", "Leave"], id)
		}
	} else if choice_result == "Questions" {
		if instance_number(obj_messagebox) == 0 {
			var temp_name, temp_text
			temp_name[0] = char_name
			temp_text[0] = "I am happy to oblige, of course. What did you\n" +
						   "want to know? "
			message(temp_text, 1)
			message_nametag(temp_name, 1)
		
			message_choices(["Capital?", "History?", "Culture?", "Leave"], id)
		}
	} else if choice_result == "Capital?" {
		if instance_number(obj_messagebox) == 0 {
			var temp_name, temp_text
			temp_name[0] = char_name
			temp_text[0] = "The capital city of Kamara is Kamarabad. It is\n" +
						   "ancient city with many historic monuments and\n" +
						   "palaces there. It is also where I grew up, so\n" +
						   "it saddens me to see it in the state of disrepair\n" +
						   "which it currently lies. "
			
			message(temp_text, 1)
			message_nametag(temp_name, 1)
		
			message_choices(["History?", "Culture?", "Leave"], id)
		}
	} else if choice_result == "Capital?" {
		if instance_number(obj_messagebox) == 0 {
			var temp_name, temp_text
			temp_name[0] = char_name
			temp_text[0] = "The capital city of Kamara is Kamarabad. It is\n" +
						   "ancient city with many historic monuments and\n" +
						   "palaces there. It is also where I grew up, so\n" +
						   "it saddens me to see it in the state of disrepair\n" +
						   "which it currently lies. "
			
			message(temp_text, 1)
			message_nametag(temp_name, 1)
		
			message_choices(["History?", "Culture?", "Leave"], id)
		}
	} else if choice_result == "History?" {
		if instance_number(obj_messagebox) == 0 {
			var temp_name, temp_text
			temp_name[0] = char_name
			temp_text[0] = "The Sovreignty of Kamara has a long and\n" +
						   "fascinating, albiet dark, history. It was once\n" +
						   "the heart of the Dromed Kingdom. They ruled much\n" +
						   "South Kosmos, and threatened to conquer the Human\n" +
						   "realms. "
			
			message(temp_text, 1)
			message_nametag(temp_name, 1)
		
			choice_result = "History?Followup"
		}
	} else if choice_result == "History?Followup" {
		if instance_number(obj_messagebox) == 0 {
			var temp_name, temp_text
			temp_name[0] = char_name
			temp_text[0] = "That is until a series of ruthless policies by\n" +
						   "the king in 2336 AF which led to a coup d'etat\n" +
						   "by disgruntled generals, thus forming the modern\n" +
						   "sovriegnty. " 
			
			message(temp_text, 1)
			message_nametag(temp_name, 1)
			message_choices(["Capital?", "Culture?", "Leave"], id)
		}
	
	} else if choice_result == "Culture?" {
		if instance_number(obj_messagebox) == 0 {
			var temp_name, temp_text
			temp_name[0] = char_name
			temp_text[0] = "The people of Kamara are devout followers of the\n" +
						   "the hero-god Al-Qaar, who is said to have forged\n" +
						   "the realm by flattening the southern badlands of\n" +
						   "the continent. And transforming them into lush\n" +
						   "arable lands for the Kamaran people. "
			temp_name[1] = char_name
			temp_text[1] = "I put more faith in books, myself. "
					   
			message(temp_text, 2)
			message_nametag(temp_name, 2)
		
			choice_result = "Culture?Followup"
		}
	} else if choice_result == "Culture?Followup" {
		if instance_number(obj_messagebox) == 0 {
			temp_name[0] = char_name
			temp_text[0] = "Besides that, since the founding of Kamara its\n" +
							"people have striven to look inwards and improve\n" +
							"the nation internally, through trade, agriculture\n" +
							"or infrastructure. In theory, at least. "
			message(temp_text, 1)
			message_nametag(temp_name, 1)
			message_choices(["History?", "Capital?", "Leave"], id)
		}
	} else {
		choice_result = -1
		in_dialogue = false
	}
} else if char_name == "Hiram Amin" {
	if choice_result == "Yes" {
		if instance_number(obj_messagebox) == 0 {
			temp_name[0] = char_name
			temp_text[0] = "Aha I am glad to hear it my child, too many of\n" +
						   "the faithful are loosing their way of late. This\n" +
						   "dreadful war seems to have diminished people's\n" +
						   "trust in the Architect's divine plan. "
			temp_name[1] = global.persona[0]
			temp_text[1] = "Excuse me Father, but, why exactly are you here\n" +
						   "in The Capital? "
			temp_name[2] = char_name
			temp_text[2] = "Ah yes, while it is true that there aren't many\n" +
						   "of the faithful in this city, I am here to spread\n" +
						   "word of the one true god, and to shepherd those\n" +
						   "who choose the path of righteousness. "
			message(temp_text, 3)
			message_nametag(temp_name, 3)
		
			choice_result = "HiramInn01"
		}
	} else if choice_result == "No" {
		if instance_number(obj_messagebox) == 0 {
			temp_name[0] = char_name
			temp_text[0] = "Yes I am sorry to hear that my child, It is\n" +
						   "something I am hearing more often lately. The\n" +
						   "war has shaken people's trust in the Architect,\n" +
						   "but this is something I aim to rectify. "
			temp_name[1] = global.persona[0]
			temp_text[1] = "Excuse me Father, but, why exactly are you here\n" +
						   "in The Capital? "
			temp_name[2] = char_name
			temp_text[2] = "Ah yes, while it is true that there aren't many\n" +
						   "of the faithful in this city, I am here to spread\n" +
						   "word of the one true god, and to shepherd those\n" +
						   "who choose the path of righteousness. "
					  
			message(temp_text, 3)
			message_nametag(temp_name, 3)
		
			choice_result = "HiramInn01"
		}
	} else if choice_result == "HiramInn01" {
		if instance_number(obj_messagebox) == 0 {
			met_me = true
			temp_name[0] = char_name
			temp_text[0] = "In fact I've been trying to set up a small chapel\n" +
						   "here in the Docklands, but so far to no avail. The\n" +
						   "local Prefect fears 'pervasive outsider influences'\n" +
						   "and has subsequently blocked my efforts. I shall\n" +
						   "not be silenced however, I am resolute in my faith! "
			message(temp_text, 1)
			message_nametag(temp_name, 1)
			message_choices(["Offer Help", "Leave"], id)
		}
	} else if choice_result == "Offer Help" {
		if instance_number(obj_messagebox) == 0 {
			temp_name[0] = char_name
			temp_text[0] = "Such a kind soul! The Architect looks well upon\n" +
						   "kindness. But... alas I fear there is nothing to\n" +
						   "be done. Unless that bigoted Prefect is ousted\n" +
						   "I'm afraid no progress will be made. Perhaps we\n" +
						   "will be granted such a blessing in the future. "
			message(temp_text, 1)
			message_nametag(temp_name, 1)
			message_choices(["Leave"], id)
		}
	}
}

if choice_result == "Leave" {
	in_dialogue = false
	choice_result = -1
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
