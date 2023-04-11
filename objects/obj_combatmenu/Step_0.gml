/// @description React to Display Changes
global.immobile = true
if current_display == "Attacking" {
	image_index = 1
	if turn == "None" && turn_counter < max_turns {
		battle_text = ["", "", ""]
		if alarm[0] == -1 {
			turn_counter += 1	
			turn = combat_next_id()
			show_debug_message(unmoved_actors)
			exit
		}
	} else if turn == "None" && turn_counter >= max_turns {
		unmoved_actors = []
		with obj_combat_button {
			visible = true
		}
		restore_sp(global.max_sp * 0.1) // Restore 10% of SP Per turn
		restore_mp(global.max_mp * 0.1) // Restore 10% of MP Per turn
		
		with obj_battler {
			enemy_sp += global.enemies[enemy_id][2] * 0.1 // Enemies restore 10 % SP 
			enemy_mp += global.enemies[enemy_id][3] * 0.1 // Enemies restore 10 % MP
			
			if enemy_sp > global.enemies[enemy_id][2] { enemy_sp = global.enemies[enemy_id][2] }
			if enemy_mp > global.enemies[enemy_id][3] { enemy_sp = global.enemies[enemy_id][3] }
		}
		
		unmoved_actors[0] = obj_player_battler.id
		if array_length(obj_enemy_hp.id_list) == 1 {
			unmoved_actors[1] = obj_enemy_hp.id_list[0]
		} else if array_length(obj_enemy_hp.id_list) == 2 {
			unmoved_actors[1] = obj_enemy_hp.id_list[0]
			unmoved_actors[2] = obj_enemy_hp.id_list[1]
		} else if array_length(obj_enemy_hp.id_list) == 3 {
			unmoved_actors[1] = obj_enemy_hp.id_list[0]
			unmoved_actors[2] = obj_enemy_hp.id_list[1]
			unmoved_actors[3] = obj_enemy_hp.id_list[2]
		} else if array_length(obj_enemy_hp.id_list) == 4 {
			unmoved_actors[1] = obj_enemy_hp.id_list[0]
			unmoved_actors[2] = obj_enemy_hp.id_list[1]
			unmoved_actors[3] = obj_enemy_hp.id_list[2]
			unmoved_actors[4] = obj_enemy_hp.id_list[3]
		}
		
		turn_counter = 0
		current_display = "Default"
	}
} else if current_display == "Victory" || current_display == "Defeat" { 
	image_index = 2
	
} else {
	image_index = 0
}

if combat_enemies_defeated() && current_display != "Victory" {
	turn = "None"
	current_display = "Victory"
	obj_player.prev_battle = "Victory"
	depth = -1005
	obj_enemy_hp.visible = false
	instance_destroy(obj_combat_button)
	audio_stop_sound(music_id)
	audio_play_sound(se_victory, 100, 0)
	with instance_create(x + 720, x + 832, obj_combat_button) { 
		type = "OKRewards"
	}
}

if global.hp <= 0 && current_display != "Defeat" {
	turn = "None"
	current_display = "Defeat"
	obj_player.prev_battle = "Defeat"
	depth = -1005
	obj_enemy_hp.visible = false
	instance_destroy(obj_combat_button)
	audio_stop_sound(music_id)
	audio_play_sound(se_defeat, 100, 0)
	with instance_create(x + 720, x + 832, obj_combat_button) { 
		type = "OKDefeat"
	}
}