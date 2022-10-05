/// @description inventory_consumables

function inventory_consumable_initialise() {
	// Create Item Library // ID corresponds with Index
	// Index 0: ID, Index 1: Effect, Index 3: Effect Value, Index 4: Price
	global.c_library[0] = [0, "Restore Health", 30, 100] // 30 HP Potion
}

function inventory_consumable_add(item, amount) {
	// Adds the specified amount of a Consumable
	owned = false
	for (i = 0; i < array_length(global.consumables)-1; i ++) {
		if global.consumables[i][0] == item {
			global.consumables[i][1] += amount
			owned = true
			break
		}
	}
	
	if !owned {
		array_push(global.consumables, [item, amount])
	}
}

function inventory_consumable_remove(item, amount) {
	// Removes the specified amount of a Consumable
	for (i = 0; i < array_length(global.consumables)-1; i ++) {
		if global.consumables[i][0] == item {
			global.consumables[i][1] -= amount
			
			if global.consumables[i][1] <= 0 { array_delete(global.consumables, i, 1) }
			break
		}
	}
}

function inventory_consumable_delete(item) { 
	// Deletes a record from Consumables
	for (i = 0; i < array_length(global.consumables)-1; i ++) {
		if global.consumables[i][0] == item {
			array_delete(global.consumables, i, 1)
			break
		}
	}
}

/// Unique Functions ///
function inventory_consumable_use(item) {
	// Use a Consumable and apply corresponding effect
	var item_effect, item_effect_value
	for (i = 0; i < array_length(c_library); i ++) {
		if c_library[i][0] == item {
			item_effect = c_library[i][1]
			item_effect_value = c_library[i][2]
			break
		}
	}
	
	switch item_effect {
		case "Restore Health":
			global.hp += item_effect_value
			if global.hp > global.max_hp { global.hp = global.max_hp }
		break
		
		case "Restore Mana":
			global.mp += item_effect_value
			if global.mp > global.max_mp { global.mp = global.max_mp }
		break
		
		case "Restore Stamina":
			global.sp += item_effect_value
			if global.sp > global.max_sp { global.sp = global.max_sp }
		break
	}
}