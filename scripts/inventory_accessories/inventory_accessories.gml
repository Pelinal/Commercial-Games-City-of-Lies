/// @description inventory_accessories

function inventory_accessory_initialise() {
	// Create Item Library // ID corresponds with Index
	// Index 0: ID, Index 1: Type, Index 2: Effect, Index 3: Price
	global.ac_library[0] = [7, "Ring", "None", 0] // Signet Ring
}

function inventory_accessory_add(item, amount) {
	// Adds the specified amount of an Accessory
	owned = false
	for (i = 0; i < array_length(global.accessories)-1; i ++) {
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
	for (i = 0; i < array_length(global.accessories)-1; i ++) {
		if global.accessories[i][0] == item {
			global.accessories[i][1] -= amount
			
			if global.accessories[i][1] <= 0 { array_delete(global.accessories, i, 1) }
			break
		}
	}
}

function inventory_accessory_delete(item) { 
	// Deletes a record from Accessories
	for (i = 0; i < array_length(global.accessories)-1; i ++) {
		if global.accessories[i][0] == item {
			array_delete(global.accessories, i, 1)
			break
		}
	}
}