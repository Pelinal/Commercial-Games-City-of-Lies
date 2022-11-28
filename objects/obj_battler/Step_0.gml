/// @description Attack!

//if obj_combatmenu.turn == enemy_no && keyboard_check_pressed(vk_space) {
//	if random(2) < (global.luk/2) {
//		obj_player_battler.head_text[1] = "EVADE"
		
//	}
//}

if not dead {
	if obj_combatmenu.turn == enemy_no {
		if x < 1300 {
			x += 30
		}
	
		current_movetype = irandom_range(0, array_length(global.atks_enemy[enemy_id])-1)
		current_move = irandom_range(0, array_length(global.atks_enemy[enemy_id][current_movetype])-1)
	
		if current_movetype == 2 {
			current_anim = "Cast"
		} else {
			current_anim = "Normal"
		}
	
		if x >= 1300 && image_speed == 0 {
			if current_anim == "Normal" {	
				image_speed = 0.5
			} else {
				sprite_index = global.enemies[enemy_id][14]
				image_speed = 0.5
			}
		} else if current_move == "Consumable" {
			inventory_consumable_use(consumable_to_use)
			exit;
		}
	} else {
		image_index = 0
		image_speed = 0
	//	x = start_x
		if x > start_x {
			x -= 30
		}
	}

	if image_index >= image_number-1 {
	
		image_index = 0
		image_speed = 0
	
		var damage, chance, crit, cost, cripple
	
		if current_movetype == 0 {
			damage = global.atks_physical[current_move][1] * enemy_atk
			chance = global.atks_physical[current_move][5] // AKA Hit Rate
			crit = global.atks_physical[current_move][3] * global.enemies[enemy_id][11]
			cost = global.atks_physical[current_move][2]
			cripple = global.atks_physical[current_move][4]
		
			if obj_player_battler.blocking {
				if random(1) > 0.5 { // Either Mitigate 50% or 80% Damage
					damage *= 0.5 
				} else {
					damage *= 0.8
				}
			}
		
			// Take Cost
			if (enemy_sp - cost) >= 0 {
				enemy_sp -= cost
				// Deal Damage, Potentially
				if random(1) < chance {
					// If Attack Succeeds
			
					damage -= (global.def / 4)
					if damage < 0 { damage = 0 }
			
					if random(1) < crit {
						// If Crit Succeeds
						damage_hp(damage * 1.5) // Crit Damage
						obj_player_battler.head_text[0] = "Y" + string(damage)
					} else {
						// If Crit Doesn't Succeed
						damage_hp(damage)
						obj_player_battler.head_text[0] = string(damage)
					}
			
					obj_player_battler.alarm[0] = 30
				
			
					if x >= 1300 {
						// Cripple Check
						if obj_player_battler.player_arms && cripple == "Arms" {
							if random(1) < (chance * 0.75) {
								obj_player_battler.player_arms = false
								obj_player_battler.head_text[1] = "CRIPPLED"
								obj_player_battler.alarm[0] = 30
							}
						} else if obj_player_battler.player_arms && cripple == "Legs" {
							if random(1) < (chance * 0.75) {
								obj_player_battler.player_arms = false
								obj_player_battler.head_text[1] = "CRIPPLED"
								obj_player_battler.alarm[0] = 30
							}
						}
					}
				} else {
					obj_player_battler.head_text[0] = "MISS"
					obj_player_battler.alarm[0] = 30
				}
			} else {
				head_text[0] = "FAILED"
				obj_player_battler.alarm[0] = 30
			}
		} else if current_movetype == 1 {
			damage = global.atks_special[current_move][1] * enemy_stk
			chance = global.atks_special[current_move][5] // AKA Hit Rate
			crit = global.atks_special[current_move][3] * global.enemies[enemy_id][11]
			cost = global.atks_special[current_move][2]
			cripple = global.atks_special[current_move][4]
		
			if obj_player_battler.blocking {
				if random(1) > 0.5 { // Either Mitigate 50% or 80% Damage
					damage *= 0.5 
				} else {
					damage *= 0.8
				}
			}
		
			// Take Cost
			if (enemy_sp - cost) >= 0 {
				enemy_sp -= cost
				// Deal Damage, Potentially
				if random(1) < chance {
					// If Attack Succeeds
			
					damage -= (global.sdf / 4)
					if damage < 0 { damage = 0 }
			
					if random(1) < crit {
						// If Crit Succeeds
						damage_hp(damage * 1.5) // Crit Damage
						obj_player_battler.head_text[0] = "Y" + string(damage)
					} else {
						// If Crit Doesn't Succeed
						damage_hp(damage)
						obj_player_battler.head_text[0] = string(damage)
					}
			
					obj_player_battler.alarm[0] = 30
				
			
					if x >= 1300 {
						// Cripple Check
						if obj_player_battler.player_arms && cripple == "Arms" {
							if random(1) < (chance * 0.75) {
								obj_player_battler.player_arms = false
								obj_player_battler.head_text[1] = "CRIPPLED"
								obj_player_battler.alarm[0] = 30
							}
						} else if obj_player_battler.player_arms && cripple == "Legs" {
							if random(1) < (chance * 0.75) {
								obj_player_battler.player_arms = false
								obj_player_battler.head_text[1] = "CRIPPLED"
								obj_player_battler.alarm[0] = 30
							}
						}
					}
				} else {
					obj_player_battler.head_text[0] = "MISS"
					obj_player_battler.alarm[0] = 30
				}
			} else {
				head_text[0] = "FAILED"
				alarm[0] = 30
			}
		} else if current_movetype == 2 {
			damage = global.atks_magical[current_move][1] * enemy_mtk
			chance = global.atks_magical[current_move][5] // AKA Hit Rate
			crit = global.atks_magical[current_move][3] * global.enemies[enemy_id][11]
			cost = global.atks_magical[current_move][2]
			cripple = global.atks_magical[current_move][4]
		
			if obj_player_battler.blocking {
				if random(1) > 0.5 { // Either Mitigate 50% or 80% Damage
					damage *= 0.5 
				} else {
					damage *= 0.8
				}
			}
		
			// Take Cost
			if (enemy_mp - cost) >= 0 {
				enemy_mp -= cost
				// Deal Damage, Potentially
				if random(1) < chance {
					// If Attack Succeeds
			
					damage_hp(damage)
					obj_player_battler.head_text[0] = "B" + string(damage)
					obj_player_battler.alarm[0] = 30
				
			
					if x >= 1300 {
						// Cripple Check
						if obj_player_battler.player_arms && cripple == "Arms" {
							if random(1) < (chance * 0.75) {
								obj_player_battler.player_arms = false
								obj_player_battler.head_text[1] = "CRIPPLED"
								obj_player_battler.alarm[0] = 30
							}
						} else if obj_player_battler.player_arms && cripple == "Legs" {
							if random(1) < (chance * 0.75) {
								obj_player_battler.player_arms = false
								obj_player_battler.head_text[1] = "CRIPPLED"
								obj_player_battler.alarm[0] = 30
							}
						}
					}
				} else {
					obj_player_battler.head_text[0] = "MISS"
					obj_player_battler.alarm[0] = 30
				}
			} else {
				head_text[0] = "FAILED"
				alarm[0] = 30
			}
		}
	
		obj_combatmenu.turn = "None"
		obj_combatmenu.alarm[0] = 120
	}
}

if dead {
	visible = false
	
	if obj_combatmenu.turn == enemy_no {
		obj_combatmenu.turn = "None"
		obj_combatmenu.alarm[0] = 15
	}
}