/// @description inventory_weapons

function inventory_weapon_initialise() {
	// Create Item Library // ID corresponds with Index
	// Index 0: ID, Index 1: Type, Index 2: Damage, Index 3: Price, Index 4 (optional): Enchant Effect, Index 5: Enchant Strength
	global.w_library[0] = [1, "Sword", 10, 10, noone, noone] // Rusted Sword
	global.w_library[1] = [2, "Staff", 10, 10, noone, noone] // Rotten Staff
	global.w_library[2] = [3, "Dagger", 7, 10, noone, noone] // Blunted Dagger
	// Items added w/ crafting
	global.w_library[3] = [79, "Sword", 20, 80, noone, noone]		// Bronze Sword
	global.w_library[4] = [80, "Dagger", 15, 40, noone, noone]	// Bronze Dagger
	global.w_library[5] = [81, "Axe", 25, 60, noone, noone]		// Bronze Axe
	global.w_library[6] = [82, "Staff", 20, 60, noone, noone]		// Wooden Staff
	global.w_library[7] = [83, "Staff", 30, 100, noone, noone]	// Reinforced Staff
	global.w_library[8] = [84, "Bow", 15, 40, noone, noone]		// Wooden Bow
	global.w_library[9] = [85, "Bow", 25, 60, noone, noone]		// Reinforced Bow
	global.w_library[10] = [115, "Staff", 25, 80, noone, noone]		// Bronze Staff
	
	// Create Global Equipped Weapon Variable
	global.weapon_equipped = -1
}

function inventory_weapon_add(item, amount, equipped = false) {
	// Adds the specified amount of a Weapon
	owned = false
	for (i = 0; i < array_length(global.weapons); i ++) {
		if global.weapons[i][0] == item {
			global.weapons[i][1] += amount
			owned = true
			break
		}
	}
	
	if !owned {
		array_push(global.weapons, [item, amount, equipped])
	}
}

function inventory_weapon_remove(item, amount) {
	// Removes the specified amount of a Weapon
	for (i = 0; i < array_length(global.weapons); i ++) {
		if global.weapons[i][0] == item {
			global.weapons[i][1] -= amount
			
			if global.weapons[i][1] <= 0 { array_delete(global.weapons, i, 1) }
			break
		}
	}
}

function inventory_weapon_delete(item) { 
	// Deletes a record from Weapons
	for (i = 0; i < array_length(global.weapons); i ++) {
		if global.weapons[i][0] == item {
			array_delete(global.weapons, i, 1)
			break
		}
	}
}

/// Unique Functions ///
function inventory_weapon_equip(item) {
	// Equip Specified Weapon
	
	for (i = 0; i < array_length(global.w_library); i ++) {
		if global.w_library[i][0] == item { type = global.w_library[i][1] } 
	}
	
	if type == "Sword" && global.class == "warrior" {
		global.weapon_equipped = item
		
		if global.persona[1] == "Male" {
			obj_player.co_sprite = spr_m_warrior_sw
		} else {
			obj_player.co_sprite = spr_f_warrior_sw
		}
	}
	else if type == "Axe" && global.class == "warrior" {
		global.weapon_equipped = item
		
		if global.persona[1] == "Male" {
			obj_player.co_sprite = spr_m_warrior_ax
		} else {
			obj_player.co_sprite = spr_f_warrior_ax
		}
	}
	else if type  == "Staff" && global.class == "mage" {
		global.weapon_equipped = item
		
		if global.persona[1] == "Male" {
			obj_player.co_sprite = spr_m_mage_st
		} else {
			obj_player.co_sprite = spr_f_mage_st
		}
	}
	else if type == "Dagger" && global.class == "rogue" {
		global.weapon_equipped = item
		
		if global.persona[1] == "Male" {
			obj_player.co_sprite = spr_m_rogue_da
		} else {
			obj_player.co_sprite = spr_f_rogue_da
		}
	}
	else if (type == "Crossbow" || type == "Bow") && global.class == "rogue" {
		global.weapon_equipped = item
		
		if global.persona[1] == "Male" {
			obj_player.co_sprite = spr_m_rogue_bo
		} else {
			obj_player.co_sprite = spr_f_rogue_bo
		}
	}
}

function inventory_weapon_unequip() {
	// Unequip your weapon
	global.weapon_equipped = -1
}

function inventory_weapon_check_equipped(item) {
	// Checks if specific weapon is equipped
	if global.weapon_equipped == item { return true }
}

function inventory_weapon_get_damage(item) {
	for (i = 0; i < array_length(global.w_library); i ++) {
		// Searches for weapon and returns damage value
		if global.w_library[i][0] == item { return global.w_library[i][2] }
	}
	
	return 0
}

function inventory_weapon_get_enchant(item) {
	// Returns the name of the enchantment on a weapon
	for (i = 0; i < array_length(global.w_library); i ++) {
		if global.w_library[i][0] == item {
			return global.w_library[i][4]
		}
	}
	
	return noone
}

function inventory_weapon_get_enchant_damage(item) {
	for (i = 0; i < array_length(global.w_library); i ++) {
		// Searches for weapon and returns damage value
		if global.w_library[i][0] == item {
			if global.w_library[i][4] == "Fire Damage" || global.w_library[i][4] == "Frost Damage" || global.w_library[i][4] == "Poison Damage" {
				global.mtk_type = global.w_library[i][4]
				return global.w_library[i][5]
			}
		}
	}
	
	return 0
}

function inventory_weapon_type(weapon) {
	for (i = 0; i < array_length(global.w_library); i ++) {
		// Searches for weapon and returns type
		if global.w_library[i][0] == weapon {
			return global.w_library[i][1]
		}
	}
	
	return noone
}