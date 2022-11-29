/// @description Attack!

if obj_combatmenu.turn == "Player" {
	blocking = false
	if current_move != "Block" && current_move != "Consumable" && current_anim == "Normal" {
		
		if x > 672 {
			x -= 30
		} else {
			x  = 672
		}
		
		if x <= 672 && image_speed == 0 {
			sprite_index = obj_player.co_sprite
			image_speed = 0.5
		}
	} else if current_move == "Consumable" {
		inventory_consumable_use(consumable_to_use)
		obj_combatmenu.turn = "None"
		obj_combatmenu.alarm[0] = 120
		exit;
	} else if current_move == "Block" {
		// Posibility to add a custom animation in here
		blocking = true
		head_text[1] = "BLOCK"
		alarm[0] = 45
		obj_combatmenu.turn = "None"
		obj_combatmenu.alarm[0] = 120
	} else if current_anim != "Normal" {
		sprite_index = obj_player.ca_sprite
		image_speed = 0.5
	} 
} else {
	image_index = 0
	image_speed = 0
	//x = 1568
	
	if x < 1568 {
		x += 30
	} else {
		x = 1568
	}
}

if image_index >= image_number-1 {
	
	image_index = 0
	image_speed = 0
	
	var damage, chance, crit, cost, cripple
	
	if attack_type == "Physical" {
		damage = global.atks_physical[current_move][1] * global.atk
		chance = global.atks_physical[current_move][5] + (combat_fetch_weapon_skill() / 60)
		crit = global.atks_physical[current_move][3] * global.luk
		cost = global.atks_physical[current_move][2]
		cripple = global.atks_physical[current_move][4]
		
		if global.sp - cost >= 0 {
			// Take Cost
			damage_sp(cost)
		
			// Deal Damage, Potentially
			if random(1) < chance {
				// If Attack Succeeds
			
				damage -= (current_target.enemy_def / 2)
				if damage < 0 { damage = 0 }
			
				if random(1) < crit {
					// If Crit Succeeds
					current_target.enemy_hp -= damage * (1 + (0.05 * global.luk)) // Crit Damage
					current_target.head_text[0] = "Y" + string(damage)
				} else {
					// If Crit Doesn't Succeed
					current_target.enemy_hp -= damage
					current_target.head_text[0] = string(damage)
				}
			
				current_target.alarm[0] = 30
				//x = 1568

				if x >= 1568 {
					// Cripple Check
					if global.enemies[current_target.enemy_id][12] {
						if current_target.enemy_arms && cripple == "Arms" {
							if random(1) < (chance * 0.75) {
								current_target.enemy_arms = false
								current_target.head_text[1] = "CRIPPLED"
								current_target.alarm[0] = 30
							}
						} else if current_target.enemy_legs && cripple == "Legs" {
							if random(1) < (chance * 0.75) {
								current_target.enemy_legs = false
								current_target.head_text[1] = "CRIPPLED"
								current_target.alarm[0] = 30
							}
						}
					}
				}
			} else {
				current_target.head_text[0] = "MISS"
				current_target.alarm[0] = 30
			}
		} else {
			head_text[1] = "FAILED"
			alarm[0] = 30
		}
	} else if attack_type == "Special" {
		damage = global.atks_special[current_move][1] * global.stk
		chance = global.atks_special[current_move][5] + (combat_fetch_weapon_skill() / 60)
		crit = global.atks_special[current_move][3] * global.luk
		cost = global.atks_special[current_move][2]
		cripple = global.atks_special[current_move][4]
		
		if global.sp - cost >= 0 {
			// Take Cost
			damage_sp(cost)
		
			// Deal Damage, Potentially
			if random(1) < chance {
				// If Attack Succeeds
			
				damage -= (current_target.enemy_sdf / 2)
				if damage < 0 { damage = 0 }
			
				if random(1) < crit {
					// If Crit Succeeds
					current_target.enemy_hp -= damage * (1 + (0.05 * global.luk)) // Crit Damage
					current_target.head_text[0] = "Y" + string(damage)
				} else {
					// If Crit Doesn't Succeed
					current_target.enemy_hp -= damage
					current_target.head_text[0] = string(damage)
				}
			
				current_target.alarm[0] = 30
			

				if x >= 1568 {
					// Cripple Check
					if global.enemies[current_target.enemy_id][12] {
						if current_target.enemy_arms && cripple == "Arms" {
							if random(1) < (chance * 0.75) {
								current_target.enemy_arms = false
								current_target.head_text[1] = "CRIPPLED"
								current_target.alarm[0] = 30
							}
						} else if current_target.enemy_legs && cripple == "Legs" {
							if random(1) < (chance * 0.75) {
								current_target.enemy_legs = false
								current_target.head_text[1] = "CRIPPLED"
								current_target.alarm[0] = 30
							}
						}
					}
				}
			} else {
				current_target.head_text[0] = "MISS"
				current_target.alarm[0] = 30
			}
		} else {
			head_text[1] = "FAILED"
			alarm[0] = 30
		}
	} else if attack_type == "Magical" {
		damage = global.atks_magical[current_move][1] * global.mtk
		chance = global.atks_magical[current_move][5] + (combat_fetch_weapon_skill() / 60)
		cost = global.atks_magical[current_move][2] * global.luk
		var type = global.atks_magical[current_move][3]
		var element = global.atks_magical[current_move][4]
		
		if global.mp - cost >= 0 {
			// Take Cost
			damage_mp(cost)
		
			// Deal Damage/Perform Ability
			if random(1) < chance {
				if type == "Attack" {
					// If Attack Succeeds
					damage -= (current_target.enemy_mdf / 2)
					if element == global.enemies[current_target.enemy_id][13] {
						damage *= 1 - global.enemies[current_target.enemy_id][14]
					}
					if damage < 0 { damage = 0 }
					// Damage
					current_target.enemy_hp -= damage
					current_target.head_text[0] = "B" + string(damage)
					current_target.alarm[0] = 30
				} else if type == "Self" {
					switch element {
						case "Heal":
							self.head_text[0] = "G" + string(damage)
							alarm[0] = 30
							restore_hp(global.max_hp * global.atks_magical[current_move][1])
							break
					}
				}
			
				if x >= 1568 && type != "Self" {
					// Cripple Check
					if global.enemies[current_target.enemy_id][12] && type == "Status" && element == "Cripple Random" {
						if current_target.enemy_arms || current_target.enemy_legs {
							if random(1) < 0.5 {
								if random(1) < (chance * 0.75) {
									current_target.enemy_arms = false
									current_target.head_text[1] = "CRIPPLED"
									current_target.alarm[0] = 30
								}
							} else {
								if random(1) < (chance * 0.75) {
									current_target.enemy_legs = false
									current_target.head_text[1] = "CRIPPLED"
									current_target.alarm[0] = 30
								}
							}
						}
					}
				}
			} else {
				current_target.head_text[0] = "MISS"
				current_target.alarm[0] = 30
			}
		} else {
			head_text[1] = "FAILED"
			alarm[0] = 30
		}
	}
	
	if current_target.enemy_hp <= 0 {
		current_target.dead = true
	}
	
	obj_combatmenu.turn = "None"
	obj_combatmenu.alarm[0] = 120
}