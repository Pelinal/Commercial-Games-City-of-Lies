/// @description Insert description here
// You can write your code in this editor

if(distance_to_object(obj_player)) <= 32 {
    if keyboard_check_pressed(vk_space) && !global.immobile && instance_number(obj_messagebox) == 0 {
		global.immobile = true
		if quest_active(1) && !quest_completed(1) && !quest_objective_is_complete(1, 0) {
			// Current Objective: NONE
			in_dialogue = true
			var temp_name, temp_text
			temp_name[0] = "Mattia"
			temp_text[0] = string_wordwrap_width("So he tricked you too? Heh, that racist old man has it out for us it seems. What did you do to get put in here? ", 450, "\n")
			
			message(temp_text, 1)
			message_nametag(temp_name, 1)
			message_choices(["Tell Him", "Who Are You?"], id)
		} else if quest_active(1) && !quest_completed(1) && quest_objective_is_visible(1, 2) && room != rm_docks_promenade_manor_ruins {
			in_dialogue = true
			var temp_name, temp_text
			temp_name[0] = "Mattia"
			temp_text[0] = string_wordwrap_width("My friend! I am afraid we're not homefree just yet, you'll want to speak with Erasmus. He's just here. ", 450, "\n")
			
			message(temp_text, 1)
			message_nametag(temp_name, 1)
		} else if !quest_active(3) && !quest_completed(3) && room == rm_docks_promenade_manor_ruins {
			in_dialogue = true
			var temp_name, temp_text
			temp_name[0] = "Mattia"
			temp_text[0] = string_wordwrap_width("Ah my new friend. Look at these underground ruins, imagine what we could find down here! Whaddaya say, up for a little treasure-hunting? ", 450, "\n")
			
			message(temp_text, 1)
			message_nametag(temp_name, 1)
			message_choices(["Absolutely!", "Not Now"], id)
		} else if quest_active(3) && !quest_completed(3) && !quest_objective_is_complete(3, 0) && room == rm_docks_promenade_manor_ruins {
			in_dialogue = true
			var temp_name, temp_text
			temp_name[0] = "Mattia"
			temp_text[0] = string_wordwrap_width("Check out this monolith, I can't read the text. But I bet it has something to do with that door in the middle of room. And if I know anything about locked doors, it's that there's probably something valuable behind them! ", 450, "\n")
			temp_name[1] = global.persona[0]
			temp_text[1] = string_wordwrap_width("You can't read this? Isn't it in Kosmic? ", 450, "\n")
			temp_name[2] = "Mattia"
			temp_text[2] = string_wordwrap_width("Hah, good one, for a second there I thought you mistook the Founder script for common Kosmic! Wait... you can read it? You didn't tell me you were an ancient scholar! ", 450, "\n")
			temp_name[3] = global.persona[0]
			temp_text[3] = string_wordwrap_width("It... looks like Kosmic to me, I've never learnt the Founder language so how can I read it? ", 450, "\n")
			temp_name[4] = "Mattia"
			temp_text[4] = string_wordwrap_width("Ah who cares how? All that matters is that you can, and that means you can solve this puzzle and lead us to the treasure! ", 450, "\n")
			temp_name[5] = global.persona[0]
			temp_text[5] = string_wordwrap_width("Right. Let's see if we can open that door. ", 450, "\n")
			
			
			message(temp_text, 6)
			message_nametag(temp_name, 6)
			choice_result = "SQ2InitialObj"
		} else if quest_active(3) && !quest_completed(3) && quest_objective_is_complete(3, 2) && room == rm_docks_promenade_manor_ruins {
			in_dialogue = true
			var temp_name, temp_text
			temp_name[0] = "Mattia"
			temp_text[0] = string_wordwrap_width("What's that, you found something? Is it treasure?! ", 450, "\n")
			temp_name[1] = global.persona[0]
			temp_text[1] = string_wordwrap_width("I don't think so, looks like some sort of data storage device. I can read it but none of makes any sense, perhaps it's encrypted. ", 450, "\n")
			temp_name[2] = "Mattia"
			temp_text[2] = string_wordwrap_width("Argh! Damn it! I was hoping for something else, something more... golden. Ah well, it was an adventure, wasn't it? You can keep the prize, that kind of item is only valuable to scholars you know. ", 450, "\n")
			temp_name[3] = "Mattia"
			temp_text[3] = string_wordwrap_width("In fact if you're curious, I'd bet the Archaeology Society in Centralis can decipher it for you, maybe go there when you get a chance. ", 450, "\n")
			temp_name[4] = global.persona[0]
			temp_text[4] = string_wordwrap_width("Maybe I will, thanks Mattia. ", 450, "\n")
			
			message(temp_text, 5)
			message_nametag(temp_name, 5)
			
			choice_result = "SQ2Complete"
		} else {
			global.immobile = false
			in_dialogue = false
		}
	}
}

if choice_result == "Leave" {
	if instance_number(obj_messagebox) == 0 {
		audio_play_sound(se_transfer, 10, false)
		in_dialogue = false
		choice_result = -1
	}
} else if choice_result == "Tell Him" {
	if instance_number(obj_messagebox) == 0 {
		temp_name[0] = "Mattia"
		temp_text[0] = string_wordwrap_width("So you're looking for your missing family, and he locked you up for sneaking into the city? For future reference, never trust Carus, he is a known back-stabber. He's a pariah among the Prefects, and that's saying something ", 500, "\n")
		temp_name[1] = "Mattia"
		temp_text[1] = string_wordwrap_width("But where are my manners! The name's Mattia Arosio, professional 'procurer' of goods... ", 500, "\n")
		temp_name[2] = global.persona[0]
		temp_text[2] = string_wordwrap_width("So you're a criminal? ", 500, "\n")
	
		message(temp_text, 3)
		message_nametag(temp_name, 3)
		choice_result = "MattiaC1"
	}
	
} else if choice_result == "Who Are You?" {
	if instance_number(obj_messagebox) == 0 {
		sprite_index = lr_sprite
		image_xscale = -1
		temp_name[0] = "Mattia"
		temp_text[0] = string_wordwrap_width("Ah of course where are my manners! The name's Mattia Arosio, professional 'procurer' of goods... ", 500, "\n")
		temp_name[1] = global.persona[0]
		temp_text[1] = string_wordwrap_width("So you're a criminal? ", 500, "\n")
		message(temp_text, 2)
		message_nametag(temp_name, 2)
		choice_result = "MattiaC1"
	}
} else if choice_result == "MattiaC1" {
	if instance_number(obj_messagebox) == 0 {
		sprite_index = lr_sprite
		image_xscale = -1
		var temp_name, temp_text
		temp_name[0] = "Mattia"
		temp_text[0] = string_wordwrap_width("Oh, you wound me " + global.persona[3] + "! And do remember, we're both in prison here. I'd say that makes us BOTH criminals, doesn't it? ", 500, "\n")	
			
		message(temp_text, 1)
		message_nametag(temp_name, 1)
		message_choices(["Introduce Self", "I'm Innocent!"], id)
	}
} else if choice_result == "Introduce Self" {
	if instance_number(obj_messagebox) == 0 {
		var temp_name, temp_text
		temp_name[0] = global.persona[0]
		temp_text[0] = string_wordwrap_width("Right. I'm " + global.persona[0] + " Duqarte by the way, nice to meet you.", 500, "\n")
		temp_name[1] = "Mattia"
		temp_text[1] = string_wordwrap_width("Ah who would have thought to find such good manners from a prisoner? Say... I like you, and I can tell you that I'm not expecting to remain here for very long. In fact I should be leaving quite soon ", 500, "\n")
		temp_name[2] = "Mattia"
		temp_text[2] = string_wordwrap_width("Yes I think I've outgrown this cell, and I'd like to extend an offer of freedom to you as well. Can't find your family if you're stuck in here... So whaddya say, shall we get out of here? ", 500, "\n")
		temp_name[3] = global.persona[0]
		temp_text[3] = string_wordwrap_width("Well of course I want to get out of here. But how, exactly, are we going to do that? ", 500, "\n")

	
		message(temp_text, 4)
		message_nametag(temp_name, 4)
	
		choice_result = "MattiaC2"
	}
} else if choice_result == "I'm Innocent!" {
	if instance_number(obj_messagebox) == 0 {
		var temp_name, temp_text
		temp_name[0] = global.persona[0]
		temp_text[0] =  string_wordwrap_width("You may be one, but I am certainly NOT a criminal. I was unjustly put here but a corrupt official! ", 500, "\n")
		temp_name[1] = "Mattia"
		temp_text[1] = string_wordwrap_width("The 'justice' you speak of does not exist in this city, just those with power, and those without. But... I like you, and I can tell you that I'm not expecting to remain here for very long. In fact I should be leaving quite soon ", 500, "\n")
		temp_name[2] = "Mattia"
		temp_text[2] = string_wordwrap_width("Yes I think I've outgrown this cell, and I'd like to extend an offer of freedom to you as well. Can't find your family if you're stuck in here... So whaddya say, shall we get out of here? ", 500, "\n")
		temp_name[3] = global.persona[0]
		temp_text[3] = string_wordwrap_width("Well of course I want to get out of here. But how, exactly, are we going to do that? ", 500, "\n")
		
		message(temp_text, 4)
		message_nametag(temp_name, 4)
		
		choice_result = "MattiaC2"
	}
} else if choice_result == "MattiaC2" {
	if instance_number(obj_messagebox) == 0 {
		temp_name[0] = "Mattia"
		temp_text[0] = string_wordwrap_width("With the help of friends of course. Simply count to three and then we'll be homefree! ", 500, "\n")
		message(temp_text, 1)
		message_nametag(temp_name, 1)
		message_choices(["1,2,3..."], id)
	}
} else if choice_result == "1,2,3..." {
	if instance_number(obj_messagebox) == 0 {
		// Face both toward boulder
		in_dialogue = false
		quest_show_objective(1,1)
		quest_complete_objective(1,0)
		
		obj_player.sprite_index = obj_player.up_sprite
		obj_player.image_xscale = 1
		
		audio_play_sound(se_explosion, 10, false)
		scene_screen_fade(0.01, noone, x, y, noone, obj_boulder)
		
		sprite_index = up_sprite
		choice_result = "MattiaMQ2Walk1"
	}
} else if choice_result == "MattiaMQ2Walk1" {
	if instance_number(obj_boulder) == 0 && instance_number(obj_messagebox) == 0 {
		temp_name[0] = "Mattia"
		temp_text[0] = string_wordwrap_width("What did I tell you, just in time! Come now, let's get out of here! ", 450, "\n")
		message(temp_text, 1)
		message_nametag(temp_name, 1)
		with obj_door{
			if conditional {
				condition = true
			}
		}
		choice_result = "MattiaMQ2Walk2"
	}
} else if choice_result == "MattiaMQ2Walk2" {
	if instance_number(obj_boulder) == 0 && instance_number(obj_messagebox) == 0 {
		
		move_list = ["U", "U", "END"]
		moving = true
		move_i = 0
		move_x = x
		move_y = y
		alarm[0] = 1
		
		choice_result = "Leave"
	}
} else if choice_result == "Absolutely!" {
	// Start SQ2 (q4): 'Ruins of Pontastra'
	if instance_number(obj_messagebox) == 0 {
		temp_name[0] = "Mattia"
		temp_text[0] = string_wordwrap_width("Aha I knew you'd be interested, now what are we waiting for! ", 444, "\n")
		message(temp_text, 1)
		message_nametag(temp_name, 1)
		
		quest_add(3)
		quest_show_objective(3, 0)
		quest_track(3)
		
		choice_result = "MattiaSQ2Dissapear"
	}
} else if choice_result == "MattiaSQ2Dissapear" {
	if instance_number(obj_messagebox) == 0 && instance_number(obj_fade) == 0 {	
		scene_screen_fade(0.02, noone, 2096, 352, se_transfer, noone, id)
		choice_result = "MattiaSQ2DissapearResult"
	}
} else if choice_result == "MattiaSQ2DissapearResult" {
	if instance_number(obj_messagebox) == 0 && instance_number(obj_fade) == 0 {	
		sprite_index = up_sprite
		temp_name[0] = global.persona[0]
		temp_text[0] = string_wordwrap_width("Aaand he's rushed off. Guess I'd better catch up. ", 444, "\n")
		obj_player.sprite_index = obj_player.lr_sprite
		obj_player.image_index = 1
		message(temp_text, 1)
		message_nametag(temp_name, 1)
		
		choice_result = -1
	}
} else if choice_result == "SQ2InitialObj" {
	if instance_number(obj_messagebox) == 0 {
		quest_complete_objective(3, 0)
		quest_show_objective(3, 1)
		quest_change_desc(3, "Apparently I can read Founder script, and this ruin is full of it. Seems like the key to opening the central door is something to do with these monoliths...")
		choice_result = -1
	}
} else if choice_result == "SQ2Complete" {
	if instance_number(obj_messagebox) == 0 {
		quest_complete_objective(3, 3)
		quest_change_desc(3, "I retrieved an ancient Founder Codex from a ruin below the Promenade. Mattia says the Archaeology Society in Centralis might help decipher it.")
		quest_complete(3)
		choice_result = -1
		in_dialogue = false
	}
} else if choice_result == "Not Now" {
	choice_result = -1
} 

if choice_result == -1 && instance_number(obj_messagebox) == 0 { in_dialogue = false }


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