/// @description Insert description here
// You can write your code in this editor

if position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id) {
	// Check for Mouse Enter
	image_index = 1
	
	obj_combatmenu.skill_overview_id = attack_id
	obj_combatmenu.skill_overview_type = type
	
	if mouse_check_button_pressed(mb_left) {
		
		switch type {
			case "Block":
				obj_player_battler.current_move = "Block"
				obj_combatmenu.current_display = "Attacking"
				obj_combatmenu.alarm[0] = 30
				with obj_combat_button {
					if type != "Block" && type != "Attacks" && type != "Magic" && type != "Items" {
						instance_destroy(self)
					} else {
						visible = false
					}
				}
				break
			case "Attacks":
				obj_combatmenu.current_display = "Attacks"
				with obj_combatmenu { combat_populate_list(current_display) }
				break
			case "Magic":
				if global.class == "mage" {
					obj_combatmenu.current_display = "Magic"
					with obj_combatmenu { combat_populate_list(current_display) }
				}
				break
			case "Items":
				obj_combatmenu.current_display = "Items"
				with obj_combatmenu { combat_populate_list(current_display) }
				break
			case "Physical":
				obj_combatmenu.current_display = "Physical"
				with obj_combatmenu { combat_populate_list(current_display) }
				break
			case "Special":
				obj_combatmenu.current_display = "Special"
				with obj_combatmenu { combat_populate_list(current_display) }
				break
			// ATTACKING
			case "PhysicalAttack":
				if global.sp >= global.atks_physical[attack_id][2] {
					obj_combatmenu.current_display = "AttackSelect"
					obj_player_battler.current_move = attack_id
					obj_player_battler.attack_type = "Physical"
					obj_player_battler.current_anim = "Normal"
				
					with obj_combatmenu { combat_populate_list(current_display) }
				}
				break
			case "SpecialAttack":
				if global.sp >= global.atks_special[attack_id][2] {
					obj_combatmenu.current_display = "AttackSelect"
					obj_player_battler.current_move = attack_id
					obj_player_battler.attack_type = "Special"
					obj_player_battler.current_anim = "Normal"
				
					with obj_combatmenu { combat_populate_list(current_display) }
				}
				break
			case "MagicalAttack":
				if global.mp >= global.atks_magical[attack_id][2] {
					obj_player_battler.current_move = attack_id
					obj_player_battler.attack_type = "Magical"
					obj_player_battler.current_anim = "Magic"
					
					if global.atks_magical[attack_id][3] != "Self" {
						obj_combatmenu.current_display = "AttackSelect"
						with obj_combatmenu { combat_populate_list(current_display) }
					} else {
						obj_combatmenu.current_display = "Attacking"
						obj_combatmenu.current_display = "Attacking"
						obj_combatmenu.alarm[0] = 30
						//obj_player_battler.current_target = enemy_id
						with obj_combat_button {
							if type != "Block" && type != "Attacks" && type != "Magic" && type != "Items" {
								instance_destroy(self)
							} else {
								visible = false
							}
						}
					}
				}
				break
			// ITEMS
			case "ItemButton":
				obj_combatmenu.current_display = "Attacking"
				obj_player_battler.current_move = "Consumable"
				obj_player_battler.consumable_to_use = item_id
				inventory_remove(item_id, 1)
				
				with obj_combat_button {
					if type != "Block" && type != "Attacks" && type != "Magic" && type != "Items" {
						instance_destroy(self)
					} else {
						visible = false
					}
				}
				break
			// CHOSING WHO TO ATTACK
			case "EnemyTarget":
				obj_combatmenu.current_display = "Attacking"
				obj_combatmenu.alarm[0] = 30
				obj_player_battler.current_target = enemy_id
				with obj_combat_button {
					if type != "Block" && type != "Attacks" && type != "Magic" && type != "Items" {
						instance_destroy(self)
					} else {
						visible = false
					}
				}
				break
			case "OKRewards":
				add_xp(obj_combatmenu.kill_xp)
				for (i = 0; i < array_length(obj_combatmenu.rewards_list); i ++) {
					inventory_add(obj_combatmenu.rewards_list[i][0], obj_combatmenu.rewards_list[i][1])
				}
				
				// Add Weapon XP
				if inventory_weapon_type(global.weapon_equipped) != -1 {
					switch inventory_weapon_type(global.weapon_equipped) {
						case "Sword":
							global.blade += random_range(0.05, 0.15)
							break
						case "Axe":
							global.blade += random_range(0.05, 0.15)
							break
						case "Dagger":
							global.blade += random_range(0.05, 0.15)
							break
						case "Bow":
							global.archery += random_range(0.05, 0.15)
							break
						case "Crossbow":
							global.archery += random_range(0.05, 0.15)
							break
						case "Staff":
							global.staves += random_range(0.06, 0.17)
							break
					}
				}
				
				instance_destroy(obj_combat_button)
				instance_destroy(obj_combatmenu)
				instance_destroy(obj_battler)
				instance_destroy(obj_player_battler)
				instance_destroy(obj_enemy_hp)
				global.immobile = false
				//global.hp = global.max_hp
				//global.sp = global.max_sp
				//global.mp = global.max_mp
			case "OKDefeat":
				instance_destroy(obj_combat_button)
				instance_destroy(obj_combatmenu)
				instance_destroy(obj_battler)
				instance_destroy(obj_player_battler)
				instance_destroy(obj_enemy_hp)
				global.immobile = false
				
				// Add Weapon XP
				if inventory_weapon_type(global.weapon_equipped) != -1 {
					switch inventory_weapon_type(global.weapon_equipped) {
						case "Sword":
							global.blade += random_range(0.025, 0.1)
							break
						case "Axe":
							global.blade += random_range(0.025, 0.1)
							break
						case "Dagger":
							global.blade += random_range(0.025, 0.1)
							break
						case "Bow":
							global.archery += random_range(0.025, 0.1)
							break
						case "Crossbow":
							global.archery += random_range(0.025, 0.1)
							break
						case "Staff":
							global.staves += random_range(0.03, 0.12)
							break
					}
				}
				
				global.hp = global.max_hp
				global.sp = global.max_sp
				global.mp = global.max_mp
				instance_destroy(self)
			default:
				if instance_number(obj_combatmenu) > 0 {
					with obj_combat_button {
						if type != "Block" && type != "Attacks" && type != "Magic" && type != "Items" {
							instance_destroy(self)
						}
					}
					obj_combatmenu.current_display = "Default"
				}
				break
		}
	}
} else {
	image_index = 0
}

if type == "OKRewards" || type == "OKDefeat" { 
	depth = -1006
}

if instance_number(obj_combatmenu) > 0 {
	if mouse_check_button_pressed(mb_right) || keyboard_check_pressed(vk_escape) {
		if obj_combatmenu.current_display != "Attacking" {
			with obj_combat_button {
				if type != "Block" && type != "Attacks" && type != "Magic" && type != "Items" {
					instance_destroy(self)
				} else {
					visible = true
				}
			}
			obj_combatmenu.current_display = "Default"
		}
	}

	if obj_combatmenu.scroll_bar {
		if type == "PhysicalAttack" || type == "SpecialAttack" || type == "MagicalAttack" || type == "ItemButton" {
			if y >= 1024 || y < 768 {
				visible = false
			} else {
				visible = true
			}
			if mouse_wheel_up() {
				y -= 64
			} else if mouse_wheel_down() {
				y += 64
			}
		}
	}
}