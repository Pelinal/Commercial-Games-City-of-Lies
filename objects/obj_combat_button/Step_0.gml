/// @description Insert description here
// You can write your code in this editor

if position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id) {
	// Check for Mouse Enter
	image_index = 1
	
	if mouse_check_button_pressed(mb_left) {
		
		switch type {
			case "Block":
				obj_player_battler.current_move = "Block"
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
				obj_combatmenu.current_display = "AttackSelect"
				obj_player_battler.current_move = attack_id
				obj_player_battler.attack_type = "Physical"
				obj_player_battler.current_anim = "Normal"
				
				with obj_combatmenu { combat_populate_list(current_display) }
				break
			case "SpecialAttack":
				obj_combatmenu.current_display = "AttackSelect"
				obj_player_battler.current_move = attack_id
				obj_player_battler.attack_type = "Special"
				obj_player_battler.current_anim = "Normal"
				
				with obj_combatmenu { combat_populate_list(current_display) }
				break
			case "MagicalAttack":
				obj_combatmenu.current_display = "AttackSelect"
				obj_player_battler.current_move = attack_id
				obj_player_battler.attack_type = "Magical"
				obj_player_battler.current_anim = "Magic"
				
				with obj_combatmenu { combat_populate_list(current_display) }
				break
			// ITEMS
			case "ItemButton":
				obj_combatmenu.current_display = "Attacking"
				obj_player_battler.current_move = "Consumable"
				obj_player_battler.consumable_to_use = item_id
				
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
			default:
				with obj_combat_button {
					if type != "Block" && type != "Attacks" && type != "Magic" && type != "Items" {
						instance_destroy(self)
					}
				}
				obj_combatmenu.current_display = "Default"
				break
		}
	}
} else {
	image_index = 0
}

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