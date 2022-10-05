/// @description inventory_consumables

function inventory_consumable_initialise() {
	// Create Item Library // ID corresponds with Index
	// Index 0: ID, Index 1: Effect, Index 3: Effect Value, Index 4: Price
	global.c_library[0] = [0, "Health", 30, 100] // 30 HP Potion
}

function inventory_consumable_add(id, amount) {
	// Adds the specified amount of a Consumable
	owned = false
	for (i = 0; i < array_length(global.consumables)-1; i ++) {
		if global.consumables[i][0] == id {
			global.consumables[i][1] += amount
			owned = true
			break
		}
	}
	
	if !owned {
		array_push(global.consumables, [id, amount])
	}
}

function inventory_consumable_remove(id, amount) {
	// Removes the specified amount of a Consumable
	for (i = 0; i < array_length(global.consumables)-1; i ++) {
		if global.consumables[i][0] == id {
			global.consumables[i][1] -= amount
			
			if global.consumables[i][1] <= 0 { array_delete(global.consumables, i, 1) }
			break
		}
	}
}

function inventory_consumable_delete(id) { 
	// Deletes a record from Consumables
	for (i = 0; i < array_length(global.consumables)-1; i ++) {
		if global.consumables[i][0] == id {
			array_delete(global.consumables, i, 1)
			break
		}
	}
}