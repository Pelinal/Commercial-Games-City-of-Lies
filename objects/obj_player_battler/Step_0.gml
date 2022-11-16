/// @description Attack!

if obj_combatmenu.turn == "Player" {
	if current_move != "Block" && current_move != "Consumable" {
		
		if x > 672 {
			x -= 30
		}
		
		if x <= 672 && image_speed == 0 {
			if current_anim == "Normal" {	
				sprite_index = obj_player.co_sprite
				image_speed = 0.5
			} else {
				sprite_index = obj_player.ca_sprite
				image_speed = 0.5
			}
		}

	} else if current_move == "Consumable" {
		inventory_consumable_use(consumable_to_use)
		exit;
	}
} else {
	image_index = 0
	image_speed = 0
	x = 1568
}

if image_index >= image_number-1 {
	
	image_index = 0
	image_speed = 0
	
	var damage, chance, crit, cost, cripple
	
	if attack_type == "Physical" {
		damage = global.atks_physical[current_move][1]
		chance = global.atks_physical[current_move][5] // AKA Hit Rate
		crit = global.atks_physical[current_move][3]
		cost = global.atks_physical[current_move][2]
		cripple = global.atks_physical[current_move][4]
		
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
			x = 1568
			
			if x >= 1568 {
				// Cripple Check
				if global.enemies[current_target.enemy_id][12] {
					if current_target.enemy_arms && cripple == "Arms" {
						if random(1) < (chance * 0.75) {
							current_target.enemy_arms = false
							current_target.head_text[1] = "CRIPPLED"
						}
					} else if current_target.enemy_legs && cripple == "Legs" {
						if random(1) < (chance * 0.75) {
							current_target.enemy_legs = false
							current_target.head_text[1] = "CRIPPLED"
						}
					}
				}
			}
		} else {
			current_target.head_text[0] = "MISS"
		}
	} else if attack_type == "Special" {
		damage = global.atks_special[current_move][1]
		chance = global.atks_special[current_move][5] // AKA Hit Rate
		crit = global.atks_special[current_move][3]
		cost = global.atks_special[current_move][2]
		cripple = global.atks_special[current_move][4]
		
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
			x = 1568
			
			if x >= 1568 {
				// Cripple Check
				if global.enemies[current_target.enemy_id][12] {
					if current_target.enemy_arms && cripple == "Arms" {
						if random(1) < (chance * 0.75) {
							current_target.enemy_arms = false
							current_target.head_text[1] = "CRIPPLED"
						}
					} else if current_target.enemy_legs && cripple == "Legs" {
						if random(1) < (chance * 0.75) {
							current_target.enemy_legs = false
							current_target.head_text[1] = "CRIPPLED"
						}
					}
				}
			}
		} else {
			current_target.head_text[0] = "MISS"
		}
	} else if attack_type == "Magical" {
		damage = global.atks_magical[current_move][1]
		chance = global.atks_magical[current_move][5] // AKA Hit Rate
		cost = global.atks_magical[current_move][2]
		var type = global.atks_magical[current_move][3]
		var element = global.atks_magical[current_move][4]
		
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
			} else if type == "Self" {
				switch element {
					case "Heal":
						self.head_text[1] = "G" + string(damage)
						damage_hp(damage)
						break
				}
			}
			
			// Damage
			current_target.enemy_hp -= damage
			current_target.head_text[0] = "B" + string(damage)
			
			current_target.alarm[0] = 30
			
			x = 1568
			if x >= 1568 {
				// Cripple Check
				if global.enemies[current_target.enemy_id][12] && type == "Status" && element == "Cripple Random" {
					if current_target.enemy_arms || current_target.enemy_legs {
						if random(1) < 0.5 {
							if random(1) < (chance * 0.75) {
								current_target.enemy_arms = false
								current_target.head_text[1] = "CRIPPLED"
							}
						} else {
							if random(1) < (chance * 0.75) {
								current_target.enemy_legs = false
								current_target.head_text[1] = "CRIPPLED"
							}
						}
					}
				}
			}
		} else {
			current_target.head_text[0] = "MISS"
		}
	}
	
	obj_combatmenu.turn = "None"
	obj_combatmenu.alarm[0] = 120
}