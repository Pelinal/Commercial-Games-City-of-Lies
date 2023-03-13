/// @description combat_main()
function combat_initialise(){
	// Create enemy/attack arrays
	// Index 0: Name, Index 1: MHP, Index 2: MSP, Index 3: MMP, Index 4: Base Attack, Index 5: Base Defense, 
	// Index 6: Sp. Attack, Index 7: Sp. Defense, Index 8: M. Attack, Index 9: M. Defense, Index 10: Speed, Index 11: Luck, 
	// Index 12: Humanoid(true/false)?, Index 13: Elemental Resistance (Fire/Frost/Poison), Index 14: Casting Sprite (if applicable), Index 15: XP from Kill
	global.enemies[0] = ["Rat", 30, 30, 0, 20, 3, 3, 3, 0, 0, 1, 0, false, [0, 0, 0], noone, 50]
	global.enemies[1] = ["Mugger", 50, 70, 0, 5, 6, 3, 10, 0, 0, 0, 3, true, [0, 0, 0.1], noone, 75]
	global.enemies[2] = ["Sailor", 50, 70, 0, 5, 6, 6, 10, 0, 0, 0, 3, true, [0, 0, 0.1], noone, 75]
	global.enemies[3] = ["Cpt. Neman", 75, 85, 0, 8, 8, 7, 10, 0, 0, 0, 3, true, [0, 0, 0.25], noone, 150]
	
	///////// 0.833333333 crit chance == GUARANTEED CRIT
	
	// Physical Attacks
	// Index 0: Name, Index 1: Damage (Multiplier), Index 2: Stamina Cost, Index 3: Crit Chance, Index 4: Limb Targeted, Index 5: Hit Rate, Index 6: Learnt(true/false)?, Index 7: Icon Index
	global.atks_physical[0] = ["Basic Attack", 1, 0, 0.1, "None", 0.9, true, 115]
	global.atks_physical[1] = ["Low Kick", 1.05, 10, 0.2, "Legs", 0.7, false, 116]
	global.atks_physical[2] = ["Shoulder Bash", 1.05, 15, 0.2, "Arms", 0.7, false, 116]
	global.atks_physical[3] = ["Slash", 1.1, 20, 0.45, "None", 0.25, true, 115]
	global.atks_physical[4] = ["Cleave", 1.1, 20, 0.45, "None", 0.25, true, 115]
	
	// Special Attacks
	// Index 0: Name, Index 1: Damage (Multiplier), Index 2: Stamina Cost, Index 3: Crit Chance, Index 4: Limb Targeted, Index 5: Hit Rate, Index 6: Learnt(true/false)?, Index 7: Icon Index
	global.atks_special[0] = ["Rapid Strike", 0.95, 15, 0.25, "None", 1, true, 12]
	global.atks_special[1] = ["Fury", 1.25, 45, 0.2, "None", 0.6, false, 14]
	global.atks_special[2] = ["Quickdraw", 1.2, 40, 0.25, "Arms", 0.9, false, 116]
	global.atks_special[3] = ["Feint", 1.2, 40, 0.5, "Legs", 0.9, false, 5]
	
	// Magical Attacks
	// Index 0: Name, Index 1: Magnitude (multiplier), Index 2: MP Cost, Index 3: Type, Index 4: Element, Index 5: Hit Rate, Index 6: Learn (true/false)?, Index 7: Icon Index
	global.atks_magical[0] = ["Fireball", 1.2, 30, "Attack", "Fire", 0.6 + (combat_fetch_weapon_skill() / 90), true, 96]
	global.atks_magical[1] = ["Ice Spike", 1.2, 30, "Attack", "Frost", 0.6 + (combat_fetch_weapon_skill() / 90), false, 97]
	global.atks_magical[2] = ["Acid Bomb", 1.2, 30, "Attack", "Poison", 0.6 + (combat_fetch_weapon_skill() / 90), false, 2]
	global.atks_magical[3] = ["Healing", 0.3, 40, "Self", "Heal", 1, true, 140]
	global.atks_magical[4] = ["Cripple", 1, 40, "Status", "Cripple Random", 0.3 + (combat_fetch_weapon_skill() / 90), false, 11]
	
	// Battlers
	global.battlers[0] = spr_battler_rat
	global.battlers[1] = spr_battler_mugger
	global.battlers[2] = spr_battler_sailor
	global.battlers[3] = spr_battler_neman
	
	// Create Enemy Attack Array
	// Index 0: Attack ID, Index 1: Known Physical Attacks, Index 2: Known Special Attacks, Index 3: Known Magical Attacks
	global.atks_enemy[0] = [[0]]
	global.atks_enemy[1] = [[0], [0]]
	global.atks_enemy[2] = [[0], [0]]
	global.atks_enemy[3] = [[0], [0]]
}

function combat_start(location, music, enemy1, enemy2=noone, enemy3=noone, enemy4=noone, reward_array=[0,10]) {
	instance_destroy(obj_combat_button)
	instance_destroy(obj_combatmenu)
	instance_destroy(obj_battler)
	instance_destroy(obj_enemy_hp)
	
	instance_create(48, 48, obj_combatmenu)
	
	obj_combatmenu.battleback = location
	obj_combatmenu.battler_list = [enemy1, enemy2, enemy3, enemy4]
	audio_pause_all()
	audio_play_sound(music, 100, true)
	
	instance_create(obj_combatmenu.x, obj_combatmenu.y, obj_enemy_hp)
	obj_combatmenu.music_id = music
	with obj_combatmenu {
		
		// Create Battlers
		x_margin = x + 288
		y_margin = y + 480
		
		for (i = 0; i < array_length(battler_list); i ++) {
			if battler_list[i] != noone {
				kill_xp += global.enemies[battler_list[i]][15]
				with instance_create(x_margin, y_margin, obj_battler) {
					if enemy_id == -1 {
						enemy_id = obj_combatmenu.battler_list[obj_combatmenu.i]
						enemy_hp = global.enemies[obj_combatmenu.battler_list[obj_combatmenu.i]][1]			// Current Enemy HP
						enemy_sp = global.enemies[obj_combatmenu.battler_list[obj_combatmenu.i]][2]			// Current Enemy SP
						enemy_mp = global.enemies[obj_combatmenu.battler_list[obj_combatmenu.i]][3]			// Current Enemy MP
						enemy_atk = global.enemies[obj_combatmenu.battler_list[obj_combatmenu.i]][4]		// Current Enemy Attack
						enemy_def = global.enemies[obj_combatmenu.battler_list[obj_combatmenu.i]][5]		// Current Enemy Defense
						enemy_stk = global.enemies[obj_combatmenu.battler_list[obj_combatmenu.i]][6]		// Current Enemy Special Attack
						enemy_sdf = global.enemies[obj_combatmenu.battler_list[obj_combatmenu.i]][7]		// Current Enemy Special Defense
						enemy_mtk = global.enemies[obj_combatmenu.battler_list[obj_combatmenu.i]][8]		// Current Enemy Magic Attack
						enemy_mdf = global.enemies[obj_combatmenu.battler_list[obj_combatmenu.i]][9]		// Current Enemy Magic Defense
						enemy_spd = global.enemies[obj_combatmenu.battler_list[obj_combatmenu.i]][10]		// Current Enemy Speed
						sprite_index = global.battlers[obj_combatmenu.battler_list[obj_combatmenu.i]]		// Enemy Battler Sprite
						start_x = x
						
						if global.enemies[obj_combatmenu.battler_list[obj_combatmenu.i]][12] {
							// Cripple Variables
							enemy_arms = true
							enemy_legs = true
						}
						
						enemy_no = "Enemy " + string(obj_combatmenu.i + 1)
						
						obj_enemy_hp.id_list[obj_combatmenu.i] = id
						obj_enemy_hp.enemy_list[obj_combatmenu.i] = obj_combatmenu.battler_list[obj_combatmenu.i]
					}
				}
			}
			
			x_margin += 128
			y_margin -= 128
		}
		
		obj_combatmenu.rewards_list = reward_array
		
		with instance_create(x + 1568, y + 544, obj_player_battler) {
			sprite_index = obj_player.co_sprite
		}
		
		unmoved_actors = [obj_player_battler.id]
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
		
		max_turns = array_length(obj_enemy_hp.id_list) + 1
		
		// Create Buttons
		x_margin = x + 96
		y_margin = y + 768
		
		with instance_create(x + 96, y + 768, obj_combat_button) {
			if type == -1 {
				type = "Block"
			}
		}
		with instance_create(x + 96, y + 832, obj_combat_button) {
			if type == -1 {
				type = "Attacks"
			}
		}
		with instance_create(x + 96, y + 896, obj_combat_button) {
			if type == -1 {
				type = "Magic"
			}
		}
		with instance_create(x + 96, y + 960, obj_combat_button) {
			if type == -1 {
				type = "Items"
			}
		}
	}
}

function combat_next_id() {
	// Finds the next battler to move and returns their id
	
	if obj_combatmenu.unmoved_actors[0] != obj_player_battler.id {
		fastest = obj_combatmenu.unmoved_actors[0]
		for (i = 0; i < array_length(obj_combatmenu.unmoved_actors); i ++) {
			current = obj_combatmenu.unmoved_actors[i]
			if current.enemy_spd > fastest.enemy_spd {
					fastest = current
			}
		}
		
		for (i = 0; i < array_length(obj_combatmenu.unmoved_actors); i ++) {
			if obj_combatmenu.unmoved_actors[i] == fastest {
				array_delete(unmoved_actors, i, 1)
			}
		}
		
		return fastest.enemy_no
		
	} else {
		fastest = obj_combatmenu.unmoved_actors[1]
		for (i = 1; i < array_length(obj_combatmenu.unmoved_actors); i ++) {
			current = obj_combatmenu.unmoved_actors[i]
			if current.enemy_spd > fastest.enemy_spd {
					fastest = current
			}
		}
		
		if fastest.enemy_spd > global.spd {
			array_delete(obj_combatmenu.unmoved_actors, i, 1)
			return fastest.enemy_no
		} else {
			array_delete(obj_combatmenu.unmoved_actors, 0, 1)
			return "Player"
		}
	}
}

function combat_populate_list(category) {
	
	obj_combatmenu.scroll_bar = false
	with obj_combat_button {
		if type != "Block" && type != "Attacks" && type != "Magic" && type != "Items" {
			instance_destroy(self)
		}
	}
	
	if category == "Attacks" {
		// Attack Type Select
		with instance_create(x + 720, y + 768, obj_combat_button) {
			if type == -1 {
				type = "Physical"
			}
		}
		with instance_create(x + 720, y + 832, obj_combat_button) {
			if type == -1 {
				type = "Special"
			}
		}
	} else if category == "Physical" {
		// Lists Known Physical Abilities
		with obj_combatmenu {
			
			x_margin = obj_combatmenu.x + 720
			y_margin = obj_combatmenu.y + 768
			
			for (i = 0; i < array_length(global.atks_physical); i ++) {
				if global.atks_physical[i][6] {
					with instance_create(x_margin, y_margin, obj_combat_button) {
						if type == -1 {
							type = "PhysicalAttack"
							attack_id = obj_combatmenu.i
						}
					}
					y_margin += 64
				}
			}
			
			if y_margin > 1024 {
				scroll_bar = true
			}
		}
	} else if category == "Special" {
		// Lists Known Special Abilities
		with obj_combatmenu {
			
			x_margin = obj_combatmenu.x + 720
			y_margin = obj_combatmenu.y + 768
			
			for (i = 0; i < array_length(global.atks_special); i ++) {
				if global.atks_special[i][6] {
					with instance_create(x_margin, y_margin, obj_combat_button) {
						if type == -1 {
							type = "SpecialAttack"
							attack_id = obj_combatmenu.i
						}
					}
					y_margin += 64
				}
			}
			
			if y_margin > 1024 {
				scroll_bar = true
			}
		}
	} else if category == "Magic" {
		// Lists Known Magic Abilities
		with obj_combatmenu {
			
			x_margin = obj_combatmenu.x + 720
			y_margin = obj_combatmenu.y + 768
			
			for (i = 0; i < array_length(global.atks_magical); i ++) {
				if global.atks_magical[i][6] {
					with instance_create(x_margin, y_margin, obj_combat_button) {
						if type == -1 {
							type = "MagicalAttack"
							attack_id = obj_combatmenu.i
						}
					}
					y_margin += 64
				}
			}
			
			if y_margin > 1024 {
				scroll_bar = true
			}
		}
	} else if category == "Items" {
		// Attack Type Select
		with obj_combatmenu {
			
			x_margin = obj_combatmenu.x + 720
			y_margin = obj_combatmenu.y + 768
			
			for (i = 0; i < array_length(global.consumables); i ++) {
				with instance_create(x_margin, y_margin, obj_combat_button) {
					if type == -1 {
						type = "ItemButton"
						item_id = global.consumables[obj_combatmenu.i][0]
					}
				}
					y_margin += 64
			}
			
			if y_margin > 1024 {
				scroll_bar = true
			}
		}
	} else if category == "AttackSelect" {
		// Attack Type Select
		with obj_combatmenu {
			
			x_margin = obj_combatmenu.x + 720
			y_margin = obj_combatmenu.y + 768
			
			for (i = 0; i < array_length(obj_enemy_hp.id_list); i ++) {
				with instance_create(x_margin, y_margin, obj_combat_button) {
					if type == -1 {
						type = "EnemyTarget"
						enemy_id = obj_enemy_hp.id_list[obj_combatmenu.i]
					}
				}
					y_margin += 64
			}
			
			if y_margin > 1024 {
				scroll_bar = true
			}
		}
	}
}

function combat_fetch_weapon_skill() {
	// Finds the skill corresponding to the player's equipped weapon and returns it
	
	if global.weapon_equipped != -1 {
		switch inventory_weapon_type(global.weapon_equipped) {
			case "Sword":
				return global.blade
				break
			case "Axe":
				return global.blade
				break
			case "Dagger":
				return global.blade
				break
			case "Bow":
				return global.archery
				break
			case "Crossbow":
				return global.archery
				break
			case "Staff":
				return global.staves
				break
		}
	} else {
		return 0
	}
}

function combat_text_colour(text) {
	// Finds out what colour to draw text in
	if string_char_at(text, 1) == "Y" {
		return c_yellow
	} else if string_char_at(text, 1) == "G" {
		return c_lime
	} else if string_char_at(text, 1) == "B" {
		return c_aqua
	} else {
		return c_white
	}
}

function combat_enemies_defeated() {
	var dead_count = 0
	for (i = 0; i < array_length(obj_enemy_hp.id_list); i ++) {
		// Check all enemies to see if they have the 'dead' boolean as true
		if obj_enemy_hp.id_list[i].dead {
			dead_count += 1
		}
	}
	
	if dead_count >= array_length(obj_enemy_hp.id_list) {
		return true
	} else {
		return false
	}
}