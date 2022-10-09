/// @description inventory_accessories

function inventory_accessory_initialise() {
	// Create Item Library // ID corresponds with Index
	// Index 0: ID, Index 1: Type, Index 2: Effect, Index 3: Price
	global.ac_library[0] = [7, "Ring", "None", 0] // Signet Ring
	global.ac_library[1] = [68, "Necklace", "None", 50]		// Robe Charm
	global.ac_library[2] = [69, "Necklace", "None", 80]		// Lariat
	global.ac_library[3] = [70, "Necklace", "None", 180]	// Silver Lariat
	global.ac_library[4] = [71, "Necklace", "None", 340]	// Gold Pendant
	
	// Create Global Equipped Accessories List
	global.accessory_equipped[0] = -1	// 0 - Ring 1
	global.accessory_equipped[1] = -1	// 1 - Ring 2
	global.accessory_equipped[2] = -1	// 2 - Necklace
}

function inventory_accessory_add(item, amount) {
	// Adds the specified amount of an Accessory
	owned = false
	for (i = 0; i < array_length(global.accessories); i ++) {
		if global.accessories[i][0] == item {
			global.accessories[i][1] += amount
			owned = true
			break
		}
	}
	
	if !owned {
		array_push(global.accessories, [item, amount])
	}
}

function inventory_accessory_remove(item, amount) {
	// Removes the specified amount of an Accessory
	for (i = 0; i < array_length(global.accessories); i ++) {
		if global.accessories[i][0] == item {
			global.accessories[i][1] -= amount
			
			if global.accessories[i][1] <= 0 { array_delete(global.accessories, i, 1) }
			break
		}
	}
}

function inventory_accessory_delete(item) { 
	// Deletes a record from Accessories
	for (i = 0; i < array_length(global.accessories); i ++) {
		if global.accessories[i][0] == item {
			array_delete(global.accessories, i, 1)
			break
		}
	}
}

/// Unique Functions ///
function inventory_accessory_equip(item) {
	// Equip Specified accessory
	for (i = 0; i < array_length(global.ac_library); i ++) {
		if global.ac_library[i][0] == item {
			type = global.ac_library[i][1]
		} 
	}
	
	if type == "Ring" {
		if global.accessory_equipped[0] == -1 { global.accessory_equipped[0] = item }
		else { global.accessory_equipped[1] = item }
	} else if type == "Necklace" { global.accessory_equipped[2] = item }
}

function inventory_accessory_unequip(item) {
	// Unequip your accessory
	if global.accessory_equipped[0] == item { global.accessory_equipped[0] = -1 }
	else if global.accessory_equipped[1] == item { global.accessory_equipped[1] = -1 }
	else if global.accessory_equipped[2] == item { global.accessory_equipped[2] = -1 }
}

function inventory_accessory_check_equipped(item) {
	// Checks if specific accessory is equipped
	if global.accessory_equipped[0] == item ||
	   global.accessory_equipped[1] == item ||
	   global.accessory_equipped[2] == item {
		
	   return true
	}
}