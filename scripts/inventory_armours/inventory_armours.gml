/// @description inventory_armours

function inventory_armour_initialise() {
	// Create Item Library // ID corresponds with Index
	// Index 0: ID, Index 1: Type, Index 3: Armour Rating, Index 4: Price
	global.ar_library[0] = [4, "Heavy", 10, 10] // Dented Chainmail
	global.ar_library[1] = [5, "Light", 5, 10] // Tattered Robes
	global.ar_library[2] = [6, "Medium", 7.5, 10] // Drifer's Jacket
}

function inventory_armour_add(id, amount) {
	// Adds the specified amount of an Armour
	owned = false
	for (i = 0; i < array_length(global.armours)-1; i ++) {
		if global.armours[i][0] == id {
			global.armours[i][1] += amount
			owned = true
			break
		}
	}
	
	if !owned {
		array_push(global.armours, [id, amount])
	}
}

function inventory_armour_remove(id, amount) {
	// Removes the specified amount of an Armour
	for (i = 0; i < array_length(global.armours)-1; i ++) {
		if global.armours[i][0] == id {
			global.armours[i][1] -= amount
			
			if global.armours[i][1] <= 0 { array_delete(global.armours, i, 1) }
			break
		}
	}
}

function inventory_armour_delete(id) { 
	// Deletes a record from Armours
	for (i = 0; i < array_length(global.armours)-1; i ++) {
		if global.armours[i][0] == id {
			array_delete(global.armours, i, 1)
			break
		}
	}
}