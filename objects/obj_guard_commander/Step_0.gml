/// @description Insert description here
// You can write your code in this editor

if(distance_to_object(obj_player)) <= 32 {
    if keyboard_check_pressed(vk_space) && !global.immobile {
		if room == rm_docks_promenade_manor_gf {
			global.immobile = true
			in_dialogue = true
			var temp_name, temp_text
			temp_name[0] = "Commander Luxia"
			temp_text[0] =  "Look, if you have business with the Prefect be \n" +
							"swift, he does not tolerate the presence of\n" +
							"outsiders for long and neither do I. "
				
			message(temp_text, 1)
			message_nametag(temp_name, 1)
		}
	} else if room == rm_docks_south_derelict_home && distance_to_object(obj_player) < 128 && !quest_objective_is_complete(0, 8) {
		global.immobile = true
		in_dialogue = true
		var temp_name, temp_text
		temp_name[0] = "Commander Luxia"
		temp_text[0] = string_wordwrap_width("Ah so you decided to come here after all, foolish." +
											 " Did you really think Carus would simply allow an" +
											 " outsider to go sticking their nose into city business?" +
											 " I'm here to teach you the consequences of your actions... Prepare yourself! ", 452, "\n", false)
		message(temp_text, 1)
		message_nametag(temp_name, 1)
		
		choice_result = "MQ1BossBattle"
		quest_complete_objective(0, 8) // Entered Derelict Building
		quest_show_objective(0, 9) // Defend yourself!
	}
}

if choice_result == "MQ1BossBattle" {
	if instance_number(obj_messagebox) == 0 {
		combat_start(0, ms_combat_luxia, 4, noone, noone, noone, [[]])
		choice_result = "MQ1BossBattleResult"
	}
} else if choice_result == "MQ1BossBattleResult" {
	
	if obj_player.prev_battle == "Victory" {
		// You cannot win this
		var temp_name, temp_text
		temp_name[0] = "Commander Luxia"
		temp_text[0] = string_wordwrap_width("What? How! I have never been defeated in single" +
											 "combat, let alone by a filthy outsider! Sieze them guards! ", 472, "\n", false)
		message(temp_text, 1)
		message_nametag(temp_name, 1)
		
		global.hp = global.max_hp
		global.sp = global.max_sp
		global.mp = global.max_mp
		
		// Go to Prison
		obj_player.prev_battle = noone
		choice_result = "MQ1BossEnd"
	} else if obj_player.prev_battle == "Defeat" {
		// Go to Prison
		
		var temp_name, temp_text
		temp_name[0] = "Commander Luxia"
		temp_text[0] = string_wordwrap_width("As expected, weak. Throw this outsider into the dungeons. ", 550, "\n", false)
		
		message(temp_text, 1)
		message_nametag(temp_name, 1)
		
		global.hp = global.max_hp
		global.sp = global.max_sp
		global.mp = global.max_mp
		
		obj_player.prev_battle = noone
		choice_result = "MQ1BossEnd"
	}
	
	
} else if choice_result == "MQ1BossEnd" {
	if instance_number(obj_messagebox) == 0 {
		quest_complete_objective(0, 9) // Quest Complete
		quest_complete(0) // Complete Quest in Log
		quest_add(1) // Start MQ2 - 'The Syndicate'
		quest_show_objective(1, 0)
		quest_track(1)
		scene_screen_fade(0.05, rm_docks_promenade_manor_1b, 880, 112)
		choice_result = -1
	}
}

if instance_number(obj_messagebox) == 0 && choice_result == -1 { in_dialogue = false }

//if !onetimemove {
//	// If they havent yet moved
//	move_list = ["D", "D", "D", "D", ]
//	moving = true
//	move_i = 0
//	move_x = x
//	move_y = y
//	alarm[0] = 1
//}

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