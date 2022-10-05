/// @description inventory_weapons

function inventory_weapon_initialise() {
	// Create Item Library // ID corresponds with Index
	// Index 0: ID, Index 1: Type, Index 3: Damage, Index 4: Price
	global.w_library[0] = [1, "Sword", 10, 10] // Rusted Sword
	global.w_library[1] = [2, "Staff", 10, 10] // Rotten Staff
	global.w_library[2] = [3, "Dagger", 10, 10] // Blunted Dagger
}

function inventory_weapon_add(id, amount) {
	// Adds the specified amount of a Weapon
	owned = false
	for (i = 0; i < array_length(global.weapons)-1; i ++) {
		if global.weapons[i][0] == id {
			global.weapons[i][1] += amount
			owned = true
			break
		}
	}
	
	if !owned {
		array_push(global.weapons, [id, amount])
	}
}

function inventory_weapon_remove(id, amount) {
	// Removes the specified amount of a Weapon
	for (i = 0; i < array_length(global.weapons)-1; i ++) {
		if global.weapons[i][0] == id {
			global.weapons[i][1] -= amount
			
			if global.weapons[i][1] <= 0 { array_delete(global.weapons, i, 1) }
			break
		}
	}
}

function inventory_weapon_delete(id) { 
	// Deletes a record from Weapons
	for (i = 0; i < array_length(global.weapons)-1; i ++) {
		if global.weapons[i][0] == id {
			array_delete(global.weapons, i, 1)
			break
		}
	}
}