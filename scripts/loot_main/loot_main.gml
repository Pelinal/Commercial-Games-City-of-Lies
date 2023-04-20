/// @description loot_main

function loot_initialise() {
	// Chest 1 - New Port
	global.chests[0][0] = [0, irandom_range(1, 20)]
	global.chests[0][1] = [12, irandom_range(1, 2)]
	global.chests[0][2] = [16, irandom_range(1, 3)]
	global.chests[0][3] = [18, irandom_range(1, 2)]
	// Chest 2 - Promenade
	global.chests[1][0] = [0, irandom_range(1, 15) * global.luk]
	// Chest 3 - Manor 
	global.chests[2][0] = [63, 1]
	global.chests[2][1] = [66, 1]
	global.chests[2][2] = [0, 100]
	// Chest 4 - Caves West
	global.chests[3][0] = [0, irandom_range(1, 80)]
	// Chest 5 - Ruins 1
	global.chests[4][0] = [116, 1] // Quest Item: Old Rope
	show_debug_message("Chests[] on Init: " + string(global.chests))
	// Chest 6 - Caves East
	global.chests[5][0] = [72, 1]
	global.chests[5][1] = [38, irandom_range(1, 4)]
	// Chest 7 - Ruins 2
	global.chests[6][0] = [0, irandom_range(40, 90)]
	global.chests[6][1] = [21, irandom_range(1, 4)]
	global.chests[6][2] = [22, irandom_range(1, 4)]
	// Chest 8 - S. Docks 1
	global.chests[7][0] = [0, irandom_range(20, 40)]
	global.chests[7][1] = [50, irandom_range(1, 3)]
	global.chests[7][2] = [54, irandom_range(1, 2)]
	
	// Initialise the  lootlists // Index 0: ID, Index 1: Level Required to Spawn, Index 2: Base Chance
	
	// All Food items in the game currently
	//global.loot_food[0] = 33		// Carrot
	//global.loot_food[1] = 34		// Onion
	//global.loot_food[2] = 35		// Potato
	//global.loot_food[3] = 36		// Raw Meat
	//global.loot_food[4] = 37		// Fish
	//global.loot_food[5] = 38		// Mushroom
	//global.loot_food[6] = 39		// Orange
	//global.loot_food[7] = 40		// Grapes
	//global.loot_food[8] = 41		// Apple
	//global.loot_food[9] = 42		// Bread
	//global.loot_food[10] = 43		// Egg
	//global.loot_food[11] = 44		// Cheese
	//global.loot_food[12] = 45		// Blueberry
	//global.loot_food[13] = 46		// Cherry
	//global.loot_food[14] = 47		// Salt
	//global.loot_food[15] = 48		// Flour
	//global.loot_food[16] = 49		// Wine
	//global.loot_food[17] = 50		// Tomato
	//global.loot_food[18] = 51		// Loopy Shroom
	//global.loot_food[19] = 53		// Water
	//global.loot_food[20] = 54		// Whiskey
	
	//// All Clothing items in the game currently
	//global.loot_clothing[0]  = 59		// Rags
	//global.loot_clothing[1]  = 60		// Kirtle
	//global.loot_clothing[2]  = 61		// Tunic
	//global.loot_clothing[3]  = 64		// Sandals
	//global.loot_clothing[4]  = 65		// Boots
	//global.loot_clothing[5]  = 68		// Rope Charm
	//global.loot_clothing[6]  = 69		// Lariat
	
	//global.loot_clothing_rich[0]  = 62		// Dress
	//global.loot_clothing_rich[1]  = 63		// Formal Wear
	//global.loot_clothing_rich[2]  = 66		// Fur-Lined Boots
	//global.loot_clothing_rich[3]  = 67		// Dress Shoes
	//global.loot_clothing_rich[4]  = 70		// Silver Lariat
	//global.loot_clothing_rich[5]  = 71		// Gold Pendant
	
	//// All Ingredient items in the game currently
	//global.loot_ingredients[0]  = 10	// Capitolina Prima
	//global.loot_ingredients[1]  = 12	// Clover
	//global.loot_ingredients[2]  = 13	// Thistle
	//global.loot_ingredients[3]  = 14	// Capitolina Secunda
	//global.loot_ingredients[4]  = 15	// White Bulb
	//global.loot_ingredients[5]  = 16	// Nettle
	
	//// All Ore and Precious Gem in the game currently
	//global.loot_ores[0]  = 9		// Copper Ore
	//global.loot_ores[1]  = 17		// Iron Ore
	//global.loot_ores[2]  = 18		// Corundum Ore
	//global.loot_ores[3]  = 19		// Meteoric Ore
	//global.loot_ores[4]  = 20		// Crystaline Ore
	//global.loot_ores[5]  = 26		// Emerald
	//global.loot_ores[6]  = 27		// Garnet
	//global.loot_ores[7]  = 28		// Glacial Ice
	//global.loot_ores[8]  = 29		// Ruby
	//global.loot_ores[9]  = 30		// Topaz
	//global.loot_ores[10]  = 31		// Coral
	//global.loot_ores[11]  = 32		// Gold Dust
	//global.loot_ores[12]  = 58		// Gold Ingot
	
	//// All Misc common items currently in the game
	//global.loot_misc[0]  = 21		// Wood
	//global.loot_misc[1]  = 22		// Leather
	//global.loot_misc[2]  = 52		// Cloth
	//global.loot_misc[3]  = 55		// Wool
	//global.loot_misc[4]  = 56		// Feather
	//global.loot_misc[5]  = 57		// Rope
	
	// All Solite items in the game
	global.loot_solite[0]  = 11		// Impure Solite
	global.loot_solite[1]  = 23		// Solite Dust
	global.loot_solite[2]  = 24		// Pure Solite
	global.loot_solite[3]  = 25		// Cerephelium
}

function loot_take_all(loot) {
	for(i = 0; i < array_length(loot); i ++) {
		inventory_add(loot[i][0], loot[i][1])
	}	
}

function loot_random_gold(tier) {
	// Returns random level-based gold value
	
	if tier == "poor" { return round(random(2.5*(global.level/2))) }
	else if tier == "normal" { return round(random(5*(global.level/2))) }
	else if tier == "rich" { return round(random(7.5*(global.level/2))) }
}

