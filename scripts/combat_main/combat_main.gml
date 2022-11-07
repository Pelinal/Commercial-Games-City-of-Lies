/// @description combat_main()
function combat_initialise(){
	// Create enemy/attack arrays
	// Index 0: Name, Index 1: MHP, Index 2: MSP, Index 3: MMP, Index 4: Base Attack, Index 5: Base Defense, 
	// Index 6: Sp. Attack, Index 7: Sp. Defense, Index 8: M. Attack, Index 9: M. Defense, Index 10: Speed, Index 11: Crit Rate, Index 12: Humanoid(true/false)?
	global.enemies[0] = ["Rat", 30, 30, 0, 5, 5, 5, 5, 0, 0, 8, .1, false]
	global.enemies[1] = ["Mugger", 50, 70, 0, 7, 5, 7, 5, 0, 0, 5, .2, true]
	
	// Physical Attacks
	// Index 0: Name, Index 1: Damage, Index 2: Stamina Cost, Index 3: Crit Chance, Index 4: Limb Targeted, Index 5: Hit Rate, Index 6: Learnt(true/false)?
	global.atks_physical[0] = ["Basic Attack", global.atk, 10, global.luk / 60, "None", 0.9, true]
	global.atks_physical[1] = ["Low Kick", 1.05 * global.atk, 25, global.luk / 60, "Legs", 0.7, false]
	global.atks_physical[2] = ["Shoulder Bash", 1.05 * global.atk, 25, global.luk / 60, "Arms", 0.7, false]
	global.atks_physical[3] = ["Slash", 1.1 * global.atk, 30, global.luk / 45, "None", 0.4 + (combat_fetch_weapon_skill() / 60), true]
	
	// Special Attacks
	// Index 0: Name, Index 1: Damage, Index 2: Stamina Cost, Index 3: Crit Chance, Index 4: Limb Targeted, Index 5: Hit Rate, Index 6: Learnt(true/false)?
	global.atks_special[0] = ["Rapid Strike", 0.95 * global.atk, 15, 0.5, "None", 1, true]
	global.atks_special[1] = ["Fury", 1.25 * global.atk, 45, global.luk / 45, "None", 0.6, false]
	global.atks_special[2] = ["Cleave", 1.2 * global.atk, 40, global.luk / 60, "Arms", 0.9, false]
	global.atks_special[3] = ["Feint", 1.2 * global.atk, 40, global.luk / 60, "Legs", 0.9, false]
	
	// Magical Attacks
	// Index 0: Name, Index 1: Magnitude, Index 2: MP Cost, Index 3: Type, Index 4: Element, Index 5: Hit Rate, Index 6: Learn (true/false)?
	global.atks_magical[0] = ["Fireball", 1.2 * global.atk, 30, "Attack", "Fire", 0.6 + (combat_fetch_weapon_skill() / 90), true]
	global.atks_magical[1] = ["Ice Spike", 1.2 * global.atk, 30, "Attack", "Frost", 0.6 + (combat_fetch_weapon_skill() / 90), false]
	global.atks_magical[2] = ["Acid Bomb", 1.2 * global.atk, 30, "Attack", "Poison", 0.6 + (combat_fetch_weapon_skill() / 90), false]
	global.atks_magical[3] = ["Healing", global.max_hp * 0.3, 40, "Self", "Heal", 1, true]
	global.atks_magical[4] = ["Cripple", 1, 40, "Status", "Cripple Random", 0.3 + (combat_fetch_weapon_skill() / 90), true]
	
	// Battlers
	global.battlers[0] = spr_battler_rat
	global.battlers[1] = spr_battler_mugger
}

function combat_start(location, music, enemy1, enemy2=noone, enemy3=noone, enemy4=noone) {
	instance_destroy(obj_combat_button)
	instance_destroy(obj_combatmenu)
	instance_destroy(obj_battler)
	instance_destroy(obj_enemy_hp)
	
	instance_create(0, 0, obj_combatmenu)
	
	obj_combatmenu.battleback = location
	obj_combatmenu.battler_list = [enemy1, enemy2, enemy3, enemy4]
	audio_play_sound(music, 100, true)
	
	instance_create(obj_combatmenu.x, obj_combatmenu.y, obj_enemy_hp)
	
	with obj_combatmenu {
		
		// Create Battlers
		x_margin = x + 288
		y_margin = y + 512
		
		for (i = 0; i < array_length(battler_list); i ++) {
			if battler_list[i] != noone {
				with instance_create(x_margin, y_margin, obj_battler) {
					if enemy_id == -1 {
						enemy_id = obj_combatmenu.battler_list[obj_combatmenu.i]
						enemy_hp = global.enemies[obj_combatmenu.battler_list[obj_combatmenu.i]][1]			// Current Enemy HP
						enemy_sp = global.enemies[obj_combatmenu.battler_list[obj_combatmenu.i]][2]			// Current Enemy SP
						enemy_mp = global.enemies[obj_combatmenu.battler_list[obj_combatmenu.i]][3]			// Current Enemy MP
						enemy_atk = global.enemies[obj_combatmenu.battler_list[obj_combatmenu.i]][4]		// Current Enemy Attack
						enemy_def = global.enemies[obj_combatmenu.battler_list[obj_combatmenu.i]][5]		// Current Enemy Defense
						sprite_index = global.battlers[obj_combatmenu.battler_list[obj_combatmenu.i]]		// Enemy Battler Sprite
						
						obj_enemy_hp.id_list[obj_combatmenu.i] = id
						obj_enemy_hp.enemy_list[obj_combatmenu.i] = obj_combatmenu.battler_list[obj_combatmenu.i]
					}
				}
			}
			
			x_margin += 128
			y_margin -= 128
		}
		
		with instance_create(x + 1568, y + 544, obj_player_battler) {
			sprite_index = obj_player.co_sprite
		}
		
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