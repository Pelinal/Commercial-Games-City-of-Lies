/// @description inventory_keyitems

function inventory_keyitem_initialise() {
	// Create Key Item Library // ID corresponds with Index
	// Index 0: ID, Index 1: Type, Index 2: Activate Action
	global.k_library[0] = [8, "Note", "read"] // Orders
	global.k_library[1] = [0, "Gold", "destroy"] // Gold
	global.k_library[2] = [112, "EXP", "destroy"] // EXP - NOT AN ACTUAL ITEM
}

function inventory_keyitem_add(item, amount) {
	// Adds the specified amount of a Key Item
	owned = false
	for (i = 0; i < array_length(global.keyitems); i ++) {
		if global.keyitems[i][0] == item {
			global.keyitems[i][1] += amount
			owned = true
			break
		}
	}
	
	if !owned {
		array_push(global.keyitems, [item, amount])
	}
}

function inventory_keyitem_remove(item, amount) {
	// Removes the specified amount of a Key Item
	for (i = 0; i < array_length(global.keyitems); i ++) {
		if global.keyitems[i][0] == item {
			global.keyitems[i][1] -= amount
			
			if global.keyitems[i][1] <= 0 { array_delete(global.keyitems, i, 1) }
			break
		}
	}
}

function inventory_keyitem_delete(item) { 
	// Deletes a record from Key Items
	for (i = 0; i < array_length(global.keyitems); i ++) {
		if global.keyitems[i][0] == item {
			array_delete(global.keyitems, i, 1)
			break
		}
	}
}