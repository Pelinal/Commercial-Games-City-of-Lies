/// @description Sprites, Walking and Talking

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
}

// Talking
if instance_number(obj_messagebox) == 0 { in_dialogue = false } 

if(distance_to_object(obj_player)) <= 32 {
    if keyboard_check_pressed(vk_space) && !global.immobile && char_name != "Name" {
		global.immobile = true
		if instance_number(obj_messagebox) == 0 {
			var temp_name, temp_text, criteria, batch_no, choices, choice_enabled
			choice_enabled = false
			criteria = false
			pre_dir = current_dir
			in_dialogue = true
			temp_name[0] = char_name
			switch char_name {
				case "Rasaara":
					if quest_active(0) && !quest_completed(0) && !quest_objective_is_complete(0, 1) && quest_objective_is_visible(0, 1) {
						criteria = true
						temp_text[0] = "Do I know anything about the Duqarte family?\n" +
									   "I might... but I'm afraid my lips are sealed\n" +
									   "and gold is the only cure. "
						batch_no = 1
						choice_enabled = true
						choices = ["Bribe (50)", "Leave"]
					}
					break
				case "Quintas":
					if quest_active(0) && !quest_completed(0) && !quest_objective_is_complete(0, 1) && quest_objective_is_visible(0, 1) {
						criteria = true
						temp_text[0] = "What's that? You want to know about the\n" +
									   "Duqartes? I don't know anything about that.\n" +
									   "Now, if you mind, I'm quite busy. "
						batch_no = 1
					}
					break
				case "Aelian the Drunkard":
					if quest_active(0) && !quest_completed(0) && !quest_objective_is_complete(0, 1) && quest_objective_is_visible(0, 1) {
						criteria = true
						temp_text[0] = "Two-cart-whatnow? Leaf me bee! I'm takin' in\n" +
									   "the sytes an' yoor in the wey! Bee gyon! *burp*  "
						batch_no = 1
					}
					break
				default:
					break
			}
			
			if criteria {
				message(temp_text, batch_no)
				message_nametag(temp_name, batch_no)
				if choice_enabled {
					message_choices(choices, id)
				}
			}
		}
	}
}

if choice_result == "Bribe (50)" && char_name == "Rasaara" {
	if inventory_fetch(0) >= 50 {
		inventory_remove(0, 50)
		var temp_name, temp_text
		temp_name[0] = "Rasaara"
		temp_text[0] = "Ahh thats much better! It's all coming back to\n" +
						"me. You need to speak with my boss, Meriaas.\n" +
						"He hangs around on the Promenade, just east of\n" +
						"here. He'll know something for sure. "
		message(temp_text, 1)
		message_nametag(temp_name, 1)
		quest_complete_objective(0, 1) // Complete "Ask Around Port"
		quest_show_objective(0, 3)	   // Add Objective "Speak to Meriaas"
		choice_result = -1
	} else {
		var temp_name, temp_text
		temp_name[0] = "Rasaara"
		temp_text[0] = "That's nice... but it seems you're a little low\n" +
						"on coin at the moment. Come back when you can\n" +
						"afford my information. "
		message(temp_text, 1)
		message_nametag(temp_name, 1)
		choice_result = -1
	}
} else {
	choice_result = -1
	global.immobile = false
}

// Walking
if walk_axis == "X" {
	image_xscale = current_dir * -1
	sprite_index = lr_sprite
} else if walk_axis == "Y" {
	if current_dir == -1 {
		sprite_index = up_sprite
	} else {
		sprite_index = dn_sprite
	}
}

if alarm[0] == -1 && !in_dialogue {
	
	if walk_axis == "X" && ((abs(x - obj_player.x) > 32 || abs(y - obj_player.y) > 8)) {
		image_speed = 0.3
		x += walk_speed * current_dir
		
		if current_dir == 1 && x >= origin_x + walk_distance { alarm[0] = wait_time * 60 }
		else if current_dir == -1 && x <= origin_x - walk_distance { alarm[0] = wait_time * 60 }
	} else if walk_axis = "Y" && ((abs(x - obj_player.x) > 8 || abs(y - obj_player.y) > 64)) {
		image_speed = 0.3
		y += walk_speed * current_dir
		
		if current_dir == 1 && y >= origin_y + walk_distance { alarm[0] = wait_time * 60 }
		else if current_dir == -1 && y <= origin_y - walk_distance { alarm[0] = wait_time * 60 }
	} else {
		image_speed = 0
		image_index = 0
	}
} else {
	image_speed = 0
	image_index = 0
}

if in_dialogue {
	alarm[0] = 30
	
	var player_diff_x, player_diff_y
	player_diff_x = x - obj_player.x
	player_diff_y = y - obj_player.y
	
	if abs(player_diff_x) > abs(player_diff_y) {
		// If X diff is larger than Y diff
		current_dir = sign(player_diff_x) // Either -1 or 1
		sprite_index = lr_sprite
		image_xscale = current_dir
	} else {
		// If Y diff is larger than X diff
		current_dir = sign(player_diff_y) // Either -1 or 1
		if current_dir == -1 {
			sprite_index = dn_sprite
		} else {
			sprite_index = up_sprite
		}
	}
}