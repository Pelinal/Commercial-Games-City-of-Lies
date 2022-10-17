/// @description crafting_main

function crafting_initialise() {
	// Creates recipe lists
	
	// Alchemy
	with obj_recipebook {
		
		//global.m_library[0] = [9, "Smithing", 50] // Copper Ore
		//global.m_library[1] = [10, "Alchemy", 50] // Capitolina Prima
		//global.m_library[2] = [11, "Enchanting", 100] // Impure Solite
		//global.m_library[3] = [12, "Alchemy", 50] // Clover
		//global.m_library[4] = [13, "Alchemy", 30] // Thickthistle
		//global.m_library[5] = [14, "Alchemy", 50] // Capitolina Secunda
		//global.m_library[6] = [15, "Alchemy", 80] // Whitebulb
		//global.m_library[7] = [16, "Alchemy", 30] // Nettle
		//global.m_library[8] = [17, "Smithing", 80] // Iron Ore
		//global.m_library[9] = [18, "Smithing", 120] // Corundum Ore
		//global.m_library[10] = [19, "Smithing", 200] // Meteoric Ore
		//global.m_library[11] = [20, "Smithing", 360] // Crystaline Ore
		//global.m_library[12] = [21, "Smithing", 30] // Wood
		//global.m_library[13] = [22, "Smithing", 50] // Leather
		//global.m_library[14] = [23, "Enchanting", 200] // Solite Dust
		//global.m_library[15] = [24, "Enchanting", 500] // Pure Solite
		//global.m_library[16] = [25, "Enchanting", 1250] // Cerephelium
		//global.m_library[17] = [26, "Enchanting", 150] // Emerald
		//global.m_library[18] = [27, "Enchanting", 80] // Garnet
		//global.m_library[19] = [28, "Enchanting", 225] // Glacial Ice
		//global.m_library[20] = [29, "Enchanting", 300] // Ruby
		//global.m_library[21] = [30, "Enchanting", 300] // Topaz
		//global.m_library[22] = [31, "Enchanting", 100] // Coral
		//global.m_library[23] = [32, "Enchanting", 400] // Gold Dust
		//global.m_library[24] = [52, "Smithing", 30] // Cloth
		//global.m_library[25] = [55, "Smithing", 60] // Wool
		//global.m_library[26] = [56, "Smithing", 20] // Feather
		//global.m_library[27] = [58, "Smithing", 600] // Gold Ingot
		
		// Index 0: Item to craft, Index 1: Ingredient 1, Index 2: Ingredient 2, Index 3: Is recipe owned?
		// Alchemy- requires 1 of each ingredient
		alchemy_recipes[0] = [72, 10, 12, 53, true]		// Health Potion
		alchemy_recipes[1] = [73, 13, 12, 53, true]		// Stamina Potion
		alchemy_recipes[2] = [74, 14, 12, 53, true]		// Mana Potion
		alchemy_recipes[3] = [75, 10, 16, 104, true]	// Endurance Potion
		alchemy_recipes[4] = [76, 13, 16, 104, true]	// Dexterity Potion
		alchemy_recipes[5] = [77, 14, 16, 104, true]	// Intelligence Potion
		alchemy_recipes[6] = [78, 15, 16, 104, true]	// Speed Potion
		
		// Index 0: Item to craft, Index 1: Ingredient 1, Index 2: Ingredient 2, Index 3: Ingredient 3, Index 4: Is recipe owned?
		// Smithing- requires 1 ore for dagger, 2 for axe/staff, and 3 for sword. Wood/leather is always one less (but not ever = to 0)
		smithing_weapon_recipes[0] = [79, 9, 21, 22, true]		// Bronze Sword
		smithing_weapon_recipes[1] = [80, 9, 21, 22, true]		// Bronze Dagger
		smithing_weapon_recipes[2] = [81, 9, 21, 22, false]		// Bronze Axe
		smithing_weapon_recipes[3] = [82, 21, 21, 22, true]		// Wooden Staff
		smithing_weapon_recipes[4] = [83, 9, 21, 22, false]		// Reinforced Staff
		smithing_weapon_recipes[5] = [84, 21, 52, 22, true]		// Wooden Bow
		smithing_weapon_recipes[6] = [85, 21, 9, 22, false]		// Reinforced Bow
		
		smithing_armour_recipes[0] = [89, 52, 52, 52, true]		// Stitched Robes
		smithing_armour_recipes[1] = [90, 52, 52, 22, true]		// Gambeson
		smithing_armour_recipes[2] = [91, 9, 52, 22, true]		// Bronze Mail
		smithing_armour_recipes[3] = [92, 9, 9, 22, false]		// Scale Armour
		smithing_armour_recipes[4] = [93, 22, 52, 22, false]	// Rough Leathers
		
		smithing_accessory_recipes[0] = [68, 57, 57, 57, false]		// Rope Charm
		smithing_accessory_recipes[1] = [69, 57, 57, 21, false]		// Lariat
		smithing_accessory_recipes[2] = [70, 86, 86, 27, false]		// Silver Lariat
		smithing_accessory_recipes[3] = [71, 58, 58, 29, false]		// Gold Lariat
		smithing_accessory_recipes[4] = [94, 17, 17, 17, false]		// Iron Ring
		smithing_accessory_recipes[5] = [95, 86, 86, 86, false]		// Silver Ring
		smithing_accessory_recipes[6] = [96, 58, 58, 58, false]		// Gold Ring
		
		// Index 0: Item to display, Index 1: Gem Selected, Index 2: Is recipe owned?
		// Enchanting- always requires solite, so not listed here (can unlock extra slot for more powerful enchant)
		enchanting_recipes[0] = [97, 27, true]		// Max HP Increase
		enchanting_recipes[1] = [98, 30, true]		// Max MP Increase
		enchanting_recipes[2] = [99, 26, true]		// Max SP Increase
		enchanting_recipes[3] = [100, 28, false]	// Resist Frost
		enchanting_recipes[4] = [101, 29, false]	// Resist Fire
		enchanting_recipes[5] = [102, 31, false]	// Resist Poison
		enchanting_recipes[6] = [103, 32, true]		// Buff Bartering 10pts
		enchanting_recipes[7] = [109, 106, true]	// Fire Damage
		enchanting_recipes[8] = [110, 107, true]	// Frost Damage
		enchanting_recipes[9] = [111, 108, true]	// Poison Damage
		
		
		// Enchanting's output is created dynamically and added to library, icons, specific library also.
	}
}

function crafting_create_enchanted(gem, gear, solite) {
	var ench_power, ench, new_index
	
	if solite == 11 { ench_power = 10 * (global.enchanting /5) }		// MAX = 60 (enchanting = 30)
	if solite == 23 { ench_power = 13.3337 * (global.enchanting /5) }	// MAX = 80
	if solite == 24 { ench_power = 16.3337 * (global.enchanting /5) }	// MAX = 100
	if solite == 25 { ench_power = 20 * (global.enchanting /5) } 		// MAX = 120
	ench_power = round(ench_power)
	
	switch gem {
		case 27:
			ench = "MHP Increase"
			break;
		case 30:
			ench = "MMP Increase"
			break;
		case 26:
			ench = "MSP Increase"
			break;
		case 28:
			ench = "Resist Frost"
			break;
		case 29:
			ench = "Resist Fire"
			break;
		case 31:
			ench = "Resist Poison"
			break;
		case 32:
			ench = "Buff Bartering"
			ench_power /= 2
			break;
		default:
			show_message("no gem slotted")
			break;
	}
	
	// Add new entry to main item library
	array_push(global.library, [crafting_smithing_fetch_type(gear) + " of " + ench, global.library[gear][1], global.library[gear][2]])
	
	new_index = array_length(global.library)-1					// Get index of new item
	array_push(global.icons, global.icons[gear])	// Use the same icon as the old item
	
	// Check for corresponding gear library
	for (i = 0; i < array_length(global.w_library); i ++) if global.w_library[i][0] == gear {
		// if accessory // Index 4: Enchant, Index 5: Enchant Power
		array_push(global.w_library, [new_index, global.w_library[i][1], global.w_library[i][2], global.w_library[i][3] + ench_power, ench, ench_power])
	}
	for (i = 0; i < array_length(global.ar_library); i ++) if global.ar_library[i][0] == gear { 
		// if accessory // Index 5: Enchant, Index 6: Enchant Power
		array_push(global.ar_library, [new_index, global.ar_library[i][1], global.ar_library[i][2], global.ar_library[i][3] + ench_power, global.ar_library[i][4], ench, ench_power])
	}
	for (i = 0; i < array_length(global.ac_library); i ++) if global.ac_library[i][0] == gear {
		// if accessory // Index 4: Enchant, Index 5: Enchant Power
		array_push(global.ac_library, [new_index, global.ac_library[i][1], global.ac_library[i][2], global.ac_library[i][3] + ench_power, ench, ench_power])
	}
	
	// and finally, add the new item to the inventory
	inventory_add(new_index, 1)
}

function crafting_fetch_recipes(list, category) {
	// Returns a list of all of the learnt recipes from the specified list.
	owned_index = 0
	owned_list = []
	if category == "alchemy"	{ owned_index = 4 }
	if category == "smithing"	{ owned_index = 4 }
	if category == "enchanting" { owned_index = 2 }
	
	for (i = 0; i < array_length(list); i ++) {
		if list[i][owned_index] {
			array_push(owned_list, list[i])
		}
	}
	
	return owned_list
}

function crafting_smithing_fetch_type(item) {
	// Weapon Type (Sword, Dagger, Axe, Staff or Bow)
	for (i = 0; i < array_length(global.w_library); i ++) if global.w_library[i][0] == item			{ return global.w_library[i][1] }
	// Whether or not it is Armour
	for (i = 0; i < array_length(global.ar_library); i ++) if global.ar_library[i][0] == item		{ return "Armour" }
	// Accessory Type (Necklace or Ring)
	for (i = 0; i < array_length(global.ac_library); i ++) if global.ac_library[i][0] == item		{ return global.ac_library[i][1] }
}

function crafting_craft_cost(item) {
	craft_cost = []
	if crafting_smithing_fetch_type(item) == "Armour" {
		craft_cost[0] = 4
		craft_cost[1] = 2
		craft_cost[2] = 4
	}
	else if crafting_smithing_fetch_type(item) == "Dagger" {
		craft_cost[0] = 1
		craft_cost[1] = 1
		craft_cost[2] = 1
	}
	else if crafting_smithing_fetch_type(item) == "Sword" {
		craft_cost[0] = 2
		craft_cost[1] = 2
		craft_cost[2] = 2
	}
	else if crafting_smithing_fetch_type(item) == "Axe" {
		craft_cost[0] = 3
		craft_cost[1] = 2
		craft_cost[2] = 2
	}
	else if crafting_smithing_fetch_type(item) == "Staff" {
		craft_cost[0] = 1
		craft_cost[1] = 4
		craft_cost[2] = 3
	}
	else if crafting_smithing_fetch_type(item) == "Bow" {
		craft_cost[0] = 2
		craft_cost[1] = 3
		craft_cost[2] = 2
	}
	else if crafting_smithing_fetch_type(item) == "Necklace" {
		craft_cost[0] = 2
		craft_cost[1] = 2
		craft_cost[2] = 1
	}
	else if crafting_smithing_fetch_type(item) == "Ring" {
		craft_cost[0] = 1
		craft_cost[1] = 1
		craft_cost[2] = 1
	}
	
	return craft_cost
}