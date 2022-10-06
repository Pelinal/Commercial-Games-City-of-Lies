/// @description inventory_weapons

function inventory_weapon_initialise() {
	// Create Item Library // ID corresponds with Index
	// Index 0: ID, Index 1: Type, Index 3: Damage, Index 4: Price
	global.w_library[0] = [1, "Sword", 10, 10] // Rusted Sword
	global.w_library[1] = [2, "Staff", 10, 10] // Rotten Staff
	global.w_library[2] = [3, "Dagger", 10, 10] // Blunted Dagger
	
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
	
	if (type == "Sword" || type == "Axe") && global.class == "warrior"  { global.weapon_equipped = item }
	if type  == "Staff" && global.class == "mage"						{ global.weapon_equipped = item }
	if (type == "Dagger" || type == "Bow") && global.class == "rogue"	{ global.weapon_equipped = item }
}

function inventory_weapon_unequip() {
	// Unequip your weapon
	global.weapon_equipped = -1
}

function inventory_weapon_check_equipped(item) {
	// Checks if specific weapon is equipped
	if global.weapon_equipped == item { return true }
}