/// @description loot_main

function loot_initialise(){
	// Initialise the  lootlists // Index 0: ID, Index 1: Level Required to Spawn, Index 2: Base Chance
	
	// All Food items in the game currently
	global.loot_food[0] = 33		// Carrot
	global.loot_food[1] = 34		// Onion
	global.loot_food[2] = 35		// Potato
	global.loot_food[3] = 36		// Raw Meat
	global.loot_food[4] = 37		// Fish
	global.loot_food[5] = 38		// Mushroom
	global.loot_food[6] = 39		// Orange
	global.loot_food[7] = 40		// Grapes
	global.loot_food[8] = 41		// Apple
	global.loot_food[9] = 42		// Bread
	global.loot_food[10] = 43		// Egg
	global.loot_food[11] = 44		// Cheese
	global.loot_food[12] = 45		// Blueberry
	global.loot_food[13] = 46		// Cherry
	global.loot_food[14] = 47		// Salt
	global.loot_food[15] = 48		// Flour
	global.loot_food[16] = 49		// Wine
	global.loot_food[17] = 50		// Tomato
	global.loot_food[18] = 51		// Loopy Shroom
	global.loot_food[19] = 53		// Water
	global.loot_food[20] = 54		// Whiskey
	
	// All Clothing items in the game currently
	global.loot_clothing[0]  = 59		// Rags
	global.loot_clothing[1]  = 60		// Kirtle
	global.loot_clothing[2]  = 61		// Tunic
	global.loot_clothing[3]  = 64		// Sandals
	global.loot_clothing[4]  = 65		// Boots
	global.loot_clothing[5]  = 68		// Rope Charm
	global.loot_clothing[6]  = 69		// Lariat
	
	global.loot_clothing_rich[0]  = 62		// Dress
	global.loot_clothing_rich[1]  = 63		// Formal Wear
	global.loot_clothing_rich[2]  = 66		// Fur-Lined Boots
	global.loot_clothing_rich[3]  = 67		// Dress Shoes
	global.loot_clothing_rich[4]  = 70		// Silver Lariat
	global.loot_clothing_rich[5]  = 71		// Gold Pendant
	
	// All Ingredient items in the game currently
	global.loot_ingredients[0]  = 10	// Capitolina Prima
	global.loot_ingredients[1]  = 12	// Clover
	global.loot_ingredients[2]  = 13	// Thistle
	global.loot_ingredients[3]  = 14	// Capitolina Secunda
	global.loot_ingredients[4]  = 15	// White Bulb
	global.loot_ingredients[5]  = 16	// Nettle
	
	// All Ore and Precious Gem in the game currently
	global.loot_ores[0]  = 9		// Copper Ore
	global.loot_ores[1]  = 17		// Iron Ore
	global.loot_ores[2]  = 18		// Corundum Ore
	global.loot_ores[3]  = 19		// Meteoric Ore
	global.loot_ores[4]  = 20		// Crystaline Ore
	global.loot_ores[5]  = 26		// Emerald
	global.loot_ores[6]  = 27		// Garnet
	global.loot_ores[7]  = 28		// Glacial Ice
	global.loot_ores[8]  = 29		// Ruby
	global.loot_ores[9]  = 30		// Topaz
	global.loot_ores[10]  = 31		// Coral
	global.loot_ores[11]  = 32		// Gold Dust
	global.loot_ores[12]  = 58		// Gold Ingot
	
	// All Misc common items currently in the game
	global.loot_misc[0]  = 21		// Wood
	global.loot_misc[1]  = 22		// Leather
	global.loot_misc[2]  = 52		// Cloth
	global.loot_misc[3]  = 55		// Wool
	global.loot_misc[4]  = 56		// Feather
	global.loot_misc[5]  = 57		// Rope
	
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

function loot_random_gold(level=-1, tier) {
	var loot_gold
	if level == -1 { level = global.level } // if no level is specified, then the players current level will be used
	
	if tier == "poor" {
		if level > 0 && level < 10			{ loot_gold = random(10)}
		else if level > 10 && level < 20	{ loot_gold = random(20)}
		else if level > 20					{ loot_gold = random(30)}
	}
	else if tier == "normal" {
		if level > 0 && level < 10			{ loot_gold = random(15)}
		else if level > 10 && level < 20	{ loot_gold = random(30)}
		else if level > 20					{ loot_gold = random(60)}
	}
	else if tier == "rich" {
		if level > 0 && level < 10			{ loot_gold = random(20)}
		else if level > 10 && level < 20	{ loot_gold = random(35)}
		else if level > 20 && level < 30	{ loot_gold = random(70)}
		else if level > 30					{ loot_gold = random(100)}
	}
	
	return loot_gold
}

function loot_random_solite(level=-1) {
	var loot_solite
	if level == -1 { level = global.level } // if no level is specified, then the players current level will be used
	
	if level <= 15						{ loot_solite[0] = 11 loot_solite[1] = 1 }
	else if level > 15 && level <= 30	{ loot_solite[0] = 23 loot_solite[1] = 1 }
	else if level > 30					{ loot_solite[0] = 24 loot_solite[1] = 1 }
	
	return loot_solite
}

function loot_poor() {
	loot_list = []
	// 100% chance of Food item
	if random (100) <= 100 {
		loot_list[0][0] = global.loot_food[random(array_length(global.loot_food)-1)]
		loot_list[0][1] = choose(1,1,2,2,2,3) // Random Quantity Range
	}
	// 50% chance of Misc item
	if random (100) <= 50 {
		loot_list[1][0] = global.loot_misc[random(array_length(global.loot_misc)-1)]
		loot_list[1][1] = choose(1,1,1,2,2) // Random Quantity Range
	}
	// 10 % chance of Clothing item
	if random (100) <= 10 {
		loot_list[2][0] = global.loot_clothing[random(array_length(global.loot_clothing)-1)]
		loot_list[2][1] = 1 // Set Quantity
	}
	
	return loot_list
}

function loot_normal() {
	loot_list = []
	// 100% chance of Food item
	if random (100) <= 100 {
		array_push(loot_list)
		loot_list[1][0] = global.loot_food[random(array_length(global.loot_food)-1)]
		loot_list[0][1] = choose(1,2,2,3,3,3,4) // Random Quantity Range
		loot_list[1][1] = choose(1,2,2,3,3,3,4) // Random Quantity Range
	}
	// 30% chance of Misc item
	if random (100) <= 30 {
		loot_list[2][0] = global.loot_misc[random(array_length(global.loot_misc)-1)]
		loot_list[2][1] = choose(1,1,1,2,2,2,3) // Random Quantity Range
	}
	// 30 % chance of Clothing item
	if random (100) <= 30 {
		// 20% chance of good quality item
		if random(100) <= 20 {
			loot_list[3][0] = global.loot_clothing_rich[random(array_length(global.loot_clothing_rich)-1)]
			loot_list[3][1] = 1 // Set Quantity
		} else {
			loot_list[3][0] = global.loot_clothing[random(array_length(global.loot_clothing)-1)]
			loot_list[3][1] = 1 // Set Quantity
		}
	}
	// 5% chance of ore/gemstone or ingredient
	if random (100) <= 5 {
		if random(100) <= 50 {
			loot_list[4][0] = global.loot_ores[random(array_length(global.loot_ores)-1)]
			loot_list[4][1] = 1 // Set Quantity
		} else {
			loot_list[4][0] = global.loot_ingredients[random(array_length(global.loot_ingredients)-1)]
			loot_list[4][1] = choose(1,1,1,2,2,2,3) // Random Quantity Range
		}
	}
	
	return loot_list
}

function loot_rich() {
	loot_list = []
	// 10% chance of Food item
	if random (100) <= 10 {
		loot_list[0][0] = global.loot_food[random(array_length(global.loot_food)-1)]
		loot_list[1][0] = global.loot_food[random(array_length(global.loot_food)-1)]
		loot_list[0][1] = choose(3,3,3,4,4,5,5,6) // Random Quantity Range
		loot_list[1][1] = choose(3,3,3,4,4,5,5,6) // Random Quantity Range
	}
	// 100% chance of Misc item
	if random (100) <= 100 {
		loot_list[2][0] = global.loot_misc[random(array_length(global.loot_misc)-1)]
		loot_list[2][1] = choose(1,2,2,2,2,3,4) // Random Quantity Range
	}
	// 30 % chance of Clothing item
	if random (100) <= 30 {
		loot_list[3][0] = global.loot_clothing_rich[random(array_length(global.loot_clothing_rich)-1)]
		loot_list[3][1] = 1 // Set Quantity
	}
	// 15% chance of ore/gemstone or ingredient
	if random (100) <= 15 {
		if random(100) <= 65 {
			loot_list[4][0] = global.loot_ores[random(array_length(global.loot_ores)-1)]
			loot_list[4][1] = choose(1,1,1,1,1,2,2,2,2,3) // Set Quantity
		} else {
			loot_list[4][0] = global.loot_ingredients[random(array_length(global.loot_ingredients)-1)]
			loot_list[4][1] = choose(2,2,3,4,4,4,5) // Random Quantity Range
		}
	}
	
	return loot_list
}