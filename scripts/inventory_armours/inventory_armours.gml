/// @description inventory_armours

function inventory_armour_initialise() {
	// Create Item Library // ID corresponds with Index
	// Index 0: ID, Index 1: Type, Index 2: Armour Rating, Index 3: Price, Index 4: Slot Type, Index 5 (optional): Enchant Effect, Index 6: Enchant Strength
	global.ar_library[0] = [4, "Heavy", 10, 10, "Torso", noone, noone]		// Dented Chainmail
	global.ar_library[1] = [5, "Light", 5, 10, "Torso", noone, noone]			// Tattered Robes
	global.ar_library[2] = [6, "Medium", 7.5, 10, "Torso", noone, noone]		// Drifer's Jacket
	global.ar_library[3] = [59, "Light", 0, 10, "Torso", noone, noone]		// Rags
	global.ar_library[4] = [60, "Light", 0, 30, "Torso", noone, noone]		// Kirtle
	global.ar_library[5] = [61, "Light", 0, 30, "Torso", noone, noone]		// Tunic
	global.ar_library[6] = [62, "Light", 0, 80, "Torso", noone, noone]		// Dress
	global.ar_library[7] = [63, "Light", 0, 100, "Torso", noone, noone]		// Suit
	global.ar_library[8] = [64, "Light", 0, 10, "Feet", noone, noone]			// Sandals
	global.ar_library[9] = [65, "Light", 2, 40, "Feet", noone, noone]			// Boots
	global.ar_library[10] = [66, "Light", 3, 90, "Feet", noone, noone]		// Fur-Lined Boots
	global.ar_library[11] = [67, "Light", 0, 110, "Feet", noone, noone]		// Dress Shoes
	// Items added w/ crafting
	global.ar_library[12] = [89, "Light", 10, 50, "Torso", noone, noone]		// Stitched Robes
	global.ar_library[13] = [90, "Medium", 15, 70, "Torso", noone, noone]		// Gambeson
	global.ar_library[14] = [91, "Heavy", 20, 100, "Torso", noone, noone]		// Bronze Mail
	global.ar_library[15] = [92, "Heavy", 30, 160, "Torso", noone, noone]		// Scale Armour
	global.ar_library[16] = [93, "Medium", 20, 130, "Torso", noone, noone]	// Rough Leathers
	
	// Create Global Equipped Armour list
	global.armour_equipped[0] = -1		// 0 - Head
	global.armour_equipped[1] = -1		// 1 - Torso
	global.armour_equipped[2] = -1		// 2 - Hands
	global.armour_equipped[3] = -1		// 4 - Feet
}

function inventory_armour_add(item, amount) {
	// Adds the specified amount of an Armour
	owned = false
	for (i = 0; i < array_length(global.armours); i ++) {
		if global.armours[i][0] == item {
			global.armours[i][1] += amount
			owned = true
			break
		}
	}
	
	if !owned {
		array_push(global.armours, [item, amount])
	}
}

function inventory_armour_remove(item, amount) {
	// Removes the specified amount of an Armour
	for (i = 0; i < array_length(global.armours); i ++) {
		if global.armours[i][0] == item {
			global.armours[i][1] -= amount
			
			if global.armours[i][1] <= 0 { array_delete(global.armours, i, 1) }
			break
		}
	}
}

function inventory_armour_delete(item) { 
	// Deletes a record from Armours
	for (i = 0; i < array_length(global.armours); i ++) {
		if global.armours[i][0] == item {
			array_delete(global.armours, i, 1)
			break
		}
	}
}

/// Unique Functions ///
function inventory_armour_equip(item) {
	// Equip Specified armour
	for (i = 0; i < array_length(global.ar_library); i ++) {
		if global.ar_library[i][0] == item {
			type = global.ar_library[i][1]
			slot = global.ar_library[i][4]
		} 
	}
	
	if type == "Heavy" && global.class == "warrior" ||
	   type == "Medium" && global.class == "rogue"  ||
	   type == "Light" && global.class == "mage"    {
		if slot == "Head"		{ global.armour_equipped[0] = item }
		else if slot == "Torso" { global.armour_equipped[1] = item }
		else if slot == "Hands" { global.armour_equipped[2] = item }
		else if slot == "Feet"	{ global.armour_equipped[3] = item }
	}
}

function inventory_armour_unequip(item) {
	// Unequip your armour
	if global.armour_equipped[0] == item		{ global.armour_equipped[1] = -1 }
	else if global.armour_equipped[1] == item	{ global.armour_equipped[2] = -1 }
	else if global.armour_equipped[2] == item	{ global.armour_equipped[3] = -1 }
	else if global.armour_equipped[3] == item	{ global.armour_equipped[4] = -1 }
}

function inventory_armour_check_equipped(item) {
	// Checks if specific weapon is equipped
	if global.armour_equipped[0] == item ||
	   global.armour_equipped[1] == item ||
	   global.armour_equipped[2] == item ||
	   global.armour_equipped[3] == item {
		
	   return true
	}
}

function inventory_armour_fetch_rating(item) {
	// Fetches the armour rating of a specific item
	for (i = 0; i < array_length(global.ar_library); i ++) { if global.ar_library[i][0] == item { return global.ar_library[i][2] } }
	return 0
}

function inventory_armour_total_rating() {
	// Totals all the armour ratings of equipped armour and returns the value
	rating = 0
	if global.armour_equipped[0] != -1 {
		rating += inventory_armour_fetch_rating(global.armour_equipped[0])
	}
	if global.armour_equipped[1] != -1 {
		rating += inventory_armour_fetch_rating(global.armour_equipped[1])
	}
	if global.armour_equipped[2] != -1 {
		rating += inventory_armour_fetch_rating(global.armour_equipped[2])
	}
	if global.armour_equipped[3] != -1 {
		rating += inventory_armour_fetch_rating(global.armour_equipped[3])
	}
	
	return rating
}