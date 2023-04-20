/// @description Sprites, Walking and Talking

switch char_type {
	case "Sailor 1":
		if !dead {
			up_sprite = spr_sailor_1_up
			dn_sprite = spr_sailor_1_dn
			lr_sprite = spr_sailor_1_lr
		} else {
			up_sprite = spr_sailor_1_dd
			dn_sprite = spr_sailor_1_dd
			lr_sprite = spr_sailor_1_dd
			image_speed = 0
			image_index = 0
			current_dir = 1
			walk_speed = 0
			walk_distance = 0
		}
		break
	case "Sailor 2":
		up_sprite = spr_sailor_2_up
		dn_sprite = spr_sailor_2_dn
		lr_sprite = spr_sailor_2_lr
		break
	case "Cpt Neman":
		if !dead {
			up_sprite = spr_cpt_neman
			dn_sprite = spr_cpt_neman
			lr_sprite = spr_cpt_neman
		} else {
			up_sprite = spr_cpt_neman_dd
			dn_sprite = spr_cpt_neman_dd
			lr_sprite = spr_cpt_neman_dd
			image_speed = 0
			image_index = 0
			current_dir = 1
			walk_speed = 0
			walk_distance = 0
		}
		break
	case "Bat":
		if !dead {
			up_sprite = spr_bat_up
			dn_sprite = spr_bat_dn
			lr_sprite = spr_bat_lr
		} else {
			instance_destroy(self)
		}
		break
	case "Rat":
		if !dead {
			up_sprite = spr_rat_up
			dn_sprite = spr_rat_dn
			lr_sprite = spr_rat_lr
		} else {
			instance_destroy(self)
		}
		break
	case "Hydra":
		if !dead {
			up_sprite = spr_snakeboss_lr
			dn_sprite = spr_snakeboss_lr
			lr_sprite = spr_snakeboss_lr
		} else {
			instance_destroy(self)
		}
		break
	default:
		break
}

// Talking
if instance_number(obj_messagebox) == 0 { in_dialogue = false } 

if(distance_to_object(obj_player)) <= 32 {
	global.immobile = true
	if instance_number(obj_messagebox) == 0 && !autoevent_fired {
		var temp_name, temp_text, criteria, batch_no, choices, choice_enabled
		choice_enabled = false
		criteria = false
		pre_dir = current_dir
		in_dialogue = true
		temp_name[0] = char_name
		switch char_name {
			case "Junius":
				criteria = true
				temp_text[0] = "Oh no, the Syndicate found us! Attack! "
				batch_no = 1
				//choice_enabled = true
				//choices = ["Bribe (50)", "Leave"]
				choice_result = "Q1Battle1"
				autoevent_fired = true
				break
			case "Petrus":
				criteria = true
				temp_text[0] = "Ahh! You won't take me alive Syndicate dog! "
				batch_no = 1
				
				choice_result = "Q1Battle1"
				autoevent_fired = true
				//choice_enabled = true
				//choices = ["Bribe (50)", "Leave"]
				break
			case "Captain Neman":
				criteria = true
				temp_text[0] = "So you are the one they sent to deal with me,\n" +
							   "I can't say that I'm flattered. You don't look\n" +
							   "like much to me... Tell you what, you can still\n" +
							   "walk away from this, I'll leave town and your\n" +
							   "employers will be none the wiser. What say you? "
				batch_no = 1
				choice_enabled = true
				autoevent_fired = true
				choices = ["Accept", "[Attack]"]
				break
			case "Cave Bat": 
				criteria = true
				temp_text[0] = "*The bat swoops in to attack!*"
				batch_no = 1
				choice_enabled = false
				
				choice_result = "BatBattle"
				autoevent_fired = true
				break
			case "Cave Rat": 
				criteria = true
				temp_text[0] = "*The rat lunges at you!*"
				batch_no = 1
				choice_enabled = false
				
				choice_result = "RatBattle"
				autoevent_fired = true
				break
			case "Ancient Hydra": 
				criteria = true
				temp_text[0] = "*A fury of snake-heads attack!*"
				batch_no = 1
				choice_enabled = false
				
				choice_result = "HydraBattle"
				autoevent_fired = true
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

if choice_result == "Accept" && char_name == "Captain Neman" {
	inventory_add(0, 75)
	message_notification("Aurum x75 Added to Inventory")
		
	var temp_name, temp_text
	temp_name[0] = "Captain Neman"
	temp_text[0] = "Smart choice, now go and tell your superior that\n" +
					"I am dead. And I won't be around here for much\n" +
					"longer, that much is certain. "
	message(temp_text, 1)
	message_nametag(temp_name, 1)
	quest_complete_objective(0, 5) // Complete "Clear Warehouse of Ruffians"
	quest_show_objective(0, 6)	   // Add Objective "Return to Meriaas"
	choice_result = -1
} else if choice_result == "[Attack]" && char_name == "Captain Neman" {
	var temp_name, temp_text
	temp_name[0] = "Captain Neman"
	temp_text[0] = "How disappointing. Very well... "
	
	message(temp_text, 1)
	message_nametag(temp_name, 1)
	choice_result = "Q1Battle2"
} else if choice_result == "Q1Battle1" {
	if instance_number(obj_messagebox) == 0 {
		combat_start(0, ms_combat_1, 2, noone, noone, noone, [[0, 25]])
		choice_result = "Q1Battle1Result"
	}
} else if choice_result == "Q1Battle2" {
	if instance_number(obj_messagebox) == 0 {
		combat_start(0, ms_combat_1, 3, noone, noone, noone, [[0, 25]])
		choice_result = "Q1Battle2Result"
	}
} else if choice_result == "Q1Battle1Result" {
	if obj_player.prev_battle == "Victory" {
		sprite_index = spr_sailor_1_dd
		dead = true
		walk_speed = 0
		obj_player.prev_battle = noone
		choice_result = -1
	} else if obj_player.prev_battle == "Defeat" {
		find_nearest_inn() 
		obj_player.prev_battle = noone
		choice_result = -1
	}
} else if choice_result == "Q1Battle2Result" {
	if obj_player.prev_battle == "Victory" {
		quest_complete_objective(0, 5) // Complete "Clear Warehouse of Ruffians"
		quest_show_objective(0, 6)	   // Add Objective "Return to Meriaas"
		obj_player.prev_battle = noone
		dead = true
		choice_result = -1
	} else if obj_player.prev_battle == "Defeat" {
		find_nearest_inn() 
		obj_player.prev_battle = noone
		choice_result = -1
	}
} else if choice_result == "BatBattle" {
	if instance_number(obj_messagebox) == 0 {
		combat_start(0, ms_combat_1, 5, noone, noone, noone, [[22, irandom(3)], [36, irandom(2)]])
		choice_result = "GenericBattleResult"
	}
} else if choice_result == "RatBattle" {
	if instance_number(obj_messagebox) == 0 {
		combat_start(0, ms_combat_1, 0, noone, noone, noone, [[22, irandom(2)], [36, choose(0,0,0,1,1)]])
		choice_result = "GenericBattleResult"
	}
} else if choice_result == "HydraBattle" {
	if instance_number(obj_messagebox) == 0 {
		combat_start(0, ms_combat_luxia, 6, noone, noone, noone, [[22, irandom(4)], [36, irandom(3)], [0, irandom(80)]])
		choice_result = "GenericBattleResult"
	}
} else if choice_result = "GenericBattleResult" {
	if obj_player.prev_battle == "Victory" {
		dead = true
		walk_speed = 0
		obj_player.prev_battle = noone
		choice_result = -1
	} else if obj_player.prev_battle == "Defeat" {
		find_nearest_inn() 
		obj_player.prev_battle = noone
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

if alarm[0] == -1 && !in_dialogue && instance_number(obj_combatmenu) == 0 {
	
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
		if char_type != "Bat" {
			image_speed = 0
			image_index = 0
		}
	}
} else {
	if char_type != "Bat" {
		image_speed = 0
		image_index = 0
	}
}

if char_type == "Hydra" { image_speed = 0.2 }

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