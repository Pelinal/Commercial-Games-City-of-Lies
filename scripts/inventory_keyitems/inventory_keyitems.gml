/// @description inventory_keyitems

function inventory_keyitem_initialise() {
	// Create Key Item Library // ID corresponds with Index
	// Index 0: ID, Index 1: Type, Index 3: Activate Action
	global.k_library[0] = [8, "Note", "Read"] // Orders
}

function inventory_keyitem_add(id, amount) {
	// Adds the specified amount of a Key Item
	owned = false
	for (i = 0; i < array_length(global.keyitems)-1; i ++) {
		if global.keyitems[i][0] == id {
			global.keyitems[i][1] += amount
			owned = true
			break
		}
	}
	
	if !owned {
		array_push(global.keyitems, [id, amount])
	}
}

function inventory_keyitem_remove(id, amount) {
	// Removes the specified amount of a Key Item
	for (i = 0; i < array_length(global.keyitems)-1; i ++) {
		if global.keyitems[i][0] == id {
			global.keyitems[i][1] -= amount
			
			if global.keyitems[i][1] <= 0 { array_delete(global.keyitems, i, 1) }
			break
		}
	}
}

function inventory_keyitem_delete(id) { 
	// Deletes a record from Key Items
	for (i = 0; i < array_length(global.keyitems)-1; i ++) {
		if global.keyitems[i][0] == id {
			array_delete(global.keyitems, i, 1)
			break
		}
	}
}