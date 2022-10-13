/// @description inventory_main
function inventory_initialise() {
	// Create Global Variables and Perform startup
	// Index 0: Item ID, Index 1: Amount // for equippables only Index 2: Equipped (true/false)
	
	global.consumables = []
	global.weapons = []
	global.armours = []
	global.accessories = []
	global.keyitems = []
	global.materials = []

	// Create Item Library // ID corresponds with Index
	// Index 0: Item Name, Index 1: Description, Index 2: Inventory List
	// Starter Items
	global.library[0] = ["Gold", "The universal currency used throughout Kosmos.", global.keyitems]
	global.library[1] = ["Rusted Sword", "A blunt, rusted old sword. You should probably consider\nreplacing it.", global.weapons]
	global.library[2] = ["Rotten Staff", "Rotten, but still useful. Who knows for how much longer\nthough.", global.weapons]
	global.library[3] = ["Blunt Dagger", "Aren't daggers for stabbing? How you gonna stab anyone\nwith this dull blade?", global.weapons]
	global.library[4] = ["Dented Chainmail", "This chainmail has clearly been pulled off a corpse,\nprobably one of a soldier.", global.armours]
	global.library[5] = ["Tattered Robes", "This frail fabric seems as though a gentle breeze\nmight loosen its poorly-woven threads.", global.armours]
	global.library[6] = ["Drifter's Jacket", "Perfect for looking like an impoverished criminal.", global.armours]
	global.library[7] = ["Signet Ring", "A blemished old ring. It is the only thing you have to\nremind you of your parents, whom you have never met.", global.accessories]
	global.library[8] = ["Orders", "Your orders from the Peacemakers.", global.keyitems]
	global.library[9] = ["Copper Ore", "The most common form of ore in Komsos, used for low-tier\nweapons and armour. Bring to a Smith to forge it.", global.materials]
	global.library[10] = ["Capitolina Prima", "This green herb is commonly found along the river\nbanks of The Capital. Its name means 'Capital's First'.", global.materials]
	global.library[11] = ["Impure Solite", "A weakly powered chunk of Solite ore. A small amount\nof magical energy may be extracted from it.", global.materials]
	// Item Addition #1 - Loot System
	global.library[12] = ["Clover", "Four leaf clovers are the result of their contact with magical\nenergy, traces of this still remain.", global.materials]
	global.library[13] = ["Thickthistle", "A more bulbous variant of the common thistle, without\nflowers. It can be used during alchemy.", global.materials]
	global.library[14] = ["Capitolina Secunda", "The twin of the more common Capitolina Prima, it can be used to restore magical energy.", global.materials]
	global.library[15] = ["Whitebulb", "Named after its unique white bulbs, Whitebulb is a powerful\nmedicinal herb.", global.materials]
	global.library[16] = ["Nettle", "A nettle. Perhaps the most common weed in all Kosmos.", global.materials]
	global.library[17] = ["Iron Ore", "A highly common ore, mined across the continent and used as a\nstandard for most tools.", global.materials]
	global.library[18] = ["Corundum Ore", "An ore with similar colouration to copper, it can be made\ninto an alloy with iron to form steel.", global.materials]
	global.library[19] = ["Meteoric Ore", "A rare variant of iron ore, can be combined with other ores\nto forge excellent gear.", global.materials]
	global.library[20] = ["Crystaline Ore", "Mysterious ore that has be permanently altered by the presence\nof magic entites. If it can be forged, the results would be spectacular.", global.materials]
	global.library[21] = ["Wood", "Cut from trees, has a variety of uses.", global.materials]
	global.library[22] = ["Leather", "Obtained from hunting, can be used when making weapons and armour.", global.materials]
	global.library[23] = ["Solite Dust", "A crushed mixture of solite and other trace minerals.", global.materials]
	global.library[24] = ["Pure Solite", "Perfectly pure solite, stores intense magic energy.", global.materials]
	global.library[25] = ["Cerephelium", "A recently formed solite crystal, the magic it possesses is almost\ntoo much, staring at it for too long may make you blind.", global.materials]
	global.library[26] = ["Emerald", "Green gem commonly used in jewelry or for enchanting. Associated with\nstamina.", global.materials]
	global.library[27] = ["Garnet", "Red gem commonly used in jewelry or for enchanting. Associated with\nhealth.", global.materials]
	global.library[28] = ["Glacial Ice", "A piece of ice so ancient that it has permanently frozen. Can be\nused in enchanting.", global.materials]
	global.library[29] = ["Ruby", "Red gem commonly used in jewelry or enchanting. Associated with fire.", global.materials]
	global.library[30] = ["Topaz", "Blue gem commonly used in jewelry or for enchanting. Associated with\nmana., global.materials"]
	global.library[31] = ["Coral", "Coral from the seabed of 'River' Severnis, can be used in enchanting.", global.materials]
	global.library[32] = ["Gold Dust", "Fragile metals such as gold can be ground into dust to be used in\nprocesses such as enchanting.", global.materials]
	global.library[33] = ["Carrot", "Cruchy, a reindeer's favourite snack.", global.consumables]
	global.library[34] = ["Onion", "Please don't cry, the onion will be fine.", global.consumables]
	global.library[35] = ["Potato", "Grows upon the corpses of its fallen brethren.", global.consumables]
	global.library[36] = ["Raw Meat", "Miscellaenous meat... horse perhaps?", global.consumables]
	global.library[37] = ["Fish", "Smells like fish.", global.consumables]
	global.library[38] = ["Mushroom", "The edible kind, not the other kind.", global.consumables]
	global.library[39] = ["Orange", "Grows on orchards on the outskirts of the city.", global.consumables]
	global.library[40] = ["Grapes", "Commonly grown by farmers in the New City to the west.", global.consumables]
	global.library[41] = ["Apple", "Crunchy and sweet, a classic.", global.consumables]
	global.library[42] = ["Bread", "The most popular food in all Kosmos, goes well with almost anything.", global.consumables]
	global.library[43] = ["Egg", "From a chicken.", global.consumables]
	global.library[44] = ["Cheese", "One of the many kinds of cheese, this one is unique to The Capital.", global.consumables]
	global.library[45] = ["Blueberry", "It is a berry, and it is also blue.", global.consumables]
	global.library[46] = ["Cherry", "A red berry with a strong taste.", global.consumables]
	global.library[47] = ["Salt", "Collected from salt mines along the northern coastline.", global.consumables]
	global.library[48] = ["Flour", "The product of grain being grinded into dust.", global.consumables]
	global.library[49] = ["Wine", "A fancy beverage, unless you get the cheap back-alley kind.", global.consumables]
	global.library[50] = ["Tomato", "Used for a variety of tasty meals.", global.consumables]
	global.library[51] = ["Loopy Shroom", "Rumour has it, that this mushroom allows one to see into the past...\nor it just makes you high.", global.consumables]
	global.library[52] = ["Cloth", "Has a wide variety of practical uses, primarily in clothing.", global.materials]
	global.library[53] = ["Water", "Where there is water, there is life", global.consumables]
	global.library[54] = ["Whiskey", "The strong stuff.", global.consumables]
	global.library[55] = ["Wool", "Sheared from a now very chilly sheep.", global.materials]
	global.library[56] = ["Feather", "Used by fletchers to make arrows.", global.materials]
	global.library[57] = ["Rope", "Can be used to get out of certain situations.", global.consumables]
	global.library[58] = ["Gold Ingot", "Gold smelted into a shiny ingot. Good for selling or making jewelry", global.materials]
	global.library[59] = ["Rags", "Typical beggar attire.", global.armours]
	global.library[60] = ["Kirtle", "A kirtle is a common form of women's attire used by the lower class.", global.armours]
	global.library[61] = ["Tunic", "The most common form of clothing in Kosmos. Mainly used by peasants.", global.armours]
	global.library[62] = ["Dress", "A stylish dress, perfect for attending parties.", global.armours]
	global.library[63] = ["Suit", "A stylish suit, perfect for attending parties.", global.armours]
	global.library[64] = ["Sandals", "Well worn woven sandals, they make your feet itch.", global.armours]
	global.library[65] = ["Boots", "Sturdy footwear destined to take a beating.", global.armours]
	global.library[66] = ["Fur-Lined Boots", "They look like boots, but real boots aren't as likely to break.\nWarm though", global.armours]
	global.library[67] = ["Dress Shoes", "Shoes for dresses.", global.armours]
	global.library[68] = ["Robe Charm", "A commoner's charm attached to a rope.", global.accessories]
	global.library[69] = ["Lariat", "A form of twist-braid necklace, perhaps meant to bring good luck.", global.accessories]
	global.library[70] = ["Silver Lariat", "An intricately crafted silver necklace with embedded gems.", global.accessories]
	global.library[71] = ["Gold Pendant", "Gold gold gold, everyone loves gold.", global.accessories]
	global.library[72] = ["Health Potion", "A potion brewed using a mixture involving Solite, its\nmagical properties heal the user 30 pts.", global.consumables]
	
	// Call Externals
	inventory_consumable_initialise()
	inventory_weapon_initialise()
	inventory_armour_initialise()
	inventory_accessory_initialise()
	inventory_keyitem_initialise()
	inventory_material_initialise()
	
	// Create Icon Library // Values refer to coords in ts_icons_iconset
	global.icons[0] = 361		// Gold
	global.icons[1] = 147		// Rusted Sword
	global.icons[2] = 152		// Rotten Staff
	global.icons[3] = 150		// Blunt Dagger
	global.icons[4] = 168		// Dented Chainmail
	global.icons[5] = 183		// Tattered Robes
	global.icons[6] = 433		// Drifter's Jacket
	global.icons[7] = 611		// Signet Ring
	global.icons[8] = 227		// Orders
	global.icons[9] = 344		// Copper Ore
	global.icons[10] = 200		// Capitolina Prima
	global.icons[11] = 343		// Impure Solite
	global.icons[12] = 202		// Clover
	global.icons[13] = 203		// Thistle
	global.icons[14] = 201		// Capitolina Secunda
	global.icons[15] = 204		// White Bulb
	global.icons[16] = 309		// Nettle
	global.icons[17] = 350		// Iron Ore
	global.icons[18] = 344		// Corundum Ore
	global.icons[19] = 545		// Meteoric Ore
	global.icons[20] = 346		// Crystaline Ore
	global.icons[21] = 331		// Wood
	global.icons[22] = 333		// Leather
	global.icons[23] = 349		// Solite Dust
	global.icons[24] = 345		// Pure Solite
	global.icons[25] = 342		// Cerephelium
	global.icons[26] = 347		// Emerald
	global.icons[27] = 341		// Garnet
	global.icons[28] = 351		// Glacial Ice
	global.icons[29] = 358		// Ruby
	global.icons[30] = 359		// Topaz
	global.icons[31] = 364		// Coral
	global.icons[32] = 365		// Gold Dust
	global.icons[33] = 288		// Carrot
	global.icons[34] = 289		// Onion
	global.icons[35] = 290		// Potato
	global.icons[36] = 291		// Raw Meat
	global.icons[37] = 292		// Fish
	global.icons[38] = 293		// Mushroom
	global.icons[39] = 295		// Orange
	global.icons[40] = 296		// Grapes
	global.icons[41] = 297		// Apple
	global.icons[42] = 298		// Bread
	global.icons[43] = 299		// Egg
	global.icons[44] = 301		// Cheese
	global.icons[45] = 302		// Blueberry
	global.icons[46] = 303		// Cherry
	global.icons[47] = 306		// Salt
	global.icons[48] = 307		// Flour
	global.icons[49] = 308		// Wine
	global.icons[50] = 317		// Tomato
	global.icons[51] = 319		// Loopy Shroom
	global.icons[52] = 320		// Cloth
	global.icons[53] = 366		// Water
	global.icons[54] = 220		// Whiskey
	global.icons[55] = 321		// Wool
	global.icons[56] = 337		// Feather
	global.icons[57] = 275		// Rope
	global.icons[58] = 360		// Gold Ingot
	global.icons[59] = 443		// Rags
	global.icons[60] = 439		// Kirtle
	global.icons[61] = 440		// Tunic
	global.icons[62] = 441		// Dress
	global.icons[63] = 442		// Formal Wear
	global.icons[64] = 470		// Sandals
	global.icons[65] = 467		// Boots
	global.icons[66] = 477		// Fur-Lined Boots
	global.icons[67] = 475		// Dress Shoes
	global.icons[68] = 514		// Rope Charm
	global.icons[69] = 521		// Lariat
	global.icons[70] = 522		// Silver Lariat
	global.icons[71] = 524		// Gold Pendant
	global.icons[72] = 192		// Health Potion
}

function inventory_populate(category) {
	// Populates Inventory List corresponding to Category
	var pop_list
	if category == "consumables" {
		pop_list = global.consumables
		with obj_inventory {
			can_use = true
			can_equip = false
			can_destroy = true
		}
	}
	else if category == "weapons" {
		pop_list = global.weapons
		with obj_inventory {
			can_use = false
			can_equip = true
			can_destroy = true
		}
	}
	else if category == "armours" {
		pop_list = global.armours
		with obj_inventory {
			can_use = false
			can_equip = true
			can_destroy = true
		}
	}
	else if category == "accessories" {
		pop_list = global.accessories
		with obj_inventory {
			can_use = false
			can_equip = true
			can_destroy = true
		}
	}
	else if category == "key items" {
		pop_list = global.keyitems
		with obj_inventory {
			can_use = true
			can_equip = false
			can_destroy = false
		}
	}
	else if category == "materials" {
		pop_list = global.materials
		with obj_inventory {
			can_use = false
			can_equip = false
			can_destroy = true
		}
	}
	else { show_message("Error: specified category does not exist.") }
	
	//x_margin = obj_inventory.x + 32
	//y_margin = obj_inventory.y + 160
	
	//// Create List Buttons
	//for (i = 0; i < array_length(pop_list); i ++) {
	//	instance_create(x_margin, y_margin, obj_inventory_button)
	//	if obj_inventory_button.row_id == -1 {	
	//		obj_inventory_button.row_id = i
	//		obj_inventory_button.item_id = pop_list[i][0]
	//	}
	//	y_margin += 32
	//}
	
	//if y_margin > 432 {
	//	obj_inventory.scrollbar = true
		
	//	instance_create(obj_inventory.x+348, obj_inventory.y+170, obj_scrollbar)
	//	obj_scrollbar.max_scroll = (y_margin - 432) / 32
	//}
	
	// Create Tab Buttons
	with instance_create(obj_inventory.x + 16, obj_inventory.y + 24, obj_inventory_tabs) {
		if default_index = -1 {	
			image_index = 0
			default_index = 0
			tab = "consumables"
		}
	}
	with instance_create(obj_inventory.x + 144, obj_inventory.y + 24, obj_inventory_tabs) {
		if default_index = -1 {	
			image_index = 2
			default_index = 2
			tab = "weapons"
		}
	}
	with instance_create(obj_inventory.x + 256, obj_inventory.y + 24, obj_inventory_tabs) {
		if default_index = -1 {		
			image_index = 4
			default_index = 4
			tab = "armours"
		}
	}
	with instance_create(obj_inventory.x + 368, obj_inventory.y + 24, obj_inventory_tabs) {
		if default_index = -1 {	
			image_index = 6
			default_index = 6
			tab = "accessories"
		}
	}
	with instance_create(obj_inventory.x + 480, obj_inventory.y + 24, obj_inventory_tabs) {
		if default_index = -1 {	
			image_index = 8
			default_index = 8
			tab = "key items"
		}
	}
	with instance_create(obj_inventory.x + 608, obj_inventory.y + 24, obj_inventory_tabs) {
		if default_index = -1 {	
			image_index = 10
			default_index = 10
			tab = "materials"
		}
	}
}

function inventory_add(item, amount) {
	// Adds an item to the corresponding inventory
	category = global.library[item][2]
	owned = false
	for (i = 0; i < array_length(category); i ++) if category[i][0] == item {
		category[i][1] += amount
		owned = true
	}
	
	if !owned {
		array_push(category, [item, amount])
	}
}

function inventory_check(item) {
	// Searches all Inventories for specified item item
	
	for (i = 0; i < array_length(global.consumables); i ++) if global.consumables[i][0] == item		{ return true }
	for (i = 0; i < array_length(global.weapons); i ++) if global.weapons[i][0] == item				{ return true }
	for (i = 0; i < array_length(global.armours); i ++) if global.armours[i][0] == item				{ return true }
	for (i = 0; i < array_length(global.accessories); i ++) if global.accessories[i][0] == item		{ return true }
	for (i = 0; i < array_length(global.keyitems); i ++) if global.keyitems[i][0] == item			{ return true }
	for (i = 0; i < array_length(global.materials); i ++) if global.materials[i][0] == item			{ return true }
	
	return false
}

function inventory_fetch(item) {
	// Returns amount of specified item
	
	for (i = 0; i < array_length(global.consumables); i ++) if global.consumables[i][0] == item		{ return global.consumables[i][1] }
	for (i = 0; i < array_length(global.weapons); i ++) if global.weapons[i][0] == item				{ return global.weapons[i][1] }
	for (i = 0; i < array_length(global.armours); i ++) if global.armours[i][0] == item				{ return global.armours[i][1] }
	for (i = 0; i < array_length(global.accessories); i ++) if global.accessories[i][0] == item		{ return global.accessories[i][1] }
	for (i = 0; i < array_length(global.keyitems); i ++) if global.keyitems[i][0] == item			{ return global.keyitems[i][1] }
	for (i = 0; i < array_length(global.materials); i ++) if global.materials[i][0] == item			{ return global.materials[i][1] }
	
	return 0
}

function inventory_remove(item, amount) {
	// Searches all Inventories for item, then removes it
	
	if global.library[item][2] == global.consumables		{ inventory_consumable_remove(item, amount) }
	else if global.library[item][2] == global.weapons		{ inventory_weapon_remove(item, amount)		}
	else if global.library[item][2] == global.armours		{ inventory_armour_remove(item, amount)		}
	else if global.library[item][2] == global.accessories	{ inventory_accessory_remove(item, amount)	}
	else if global.library[item][2] == global.keyitems		{ inventory_keyitem_remove(item, amount)	}
	else if global.library[item][2] == global.materials		{ inventory_material_remove(item, amount)	}
}

function inventory_delete(item) {
	// Searches all Inventories for item, then deletes all copies of it
	
	if global.library[item][2] == global.consumables		{ inventory_consumable_delete(item) }
	else if global.library[item][2] == global.weapons		{ inventory_weapon_delete(item)		}
	else if global.library[item][2] == global.armours		{ inventory_armour_delete(item)		}
	else if global.library[item][2] == global.accessories	{ inventory_accessory_delete(item)	}
	else if global.library[item][2] == global.keyitems		{ inventory_keyitem_delete(item)	}
	else if global.library[item][2] == global.materials		{ inventory_material_delete(item)	}
}

function inventory_check_equipped(item) {
	// Global Check for equipped item, across all lists
	if global.weapon_equipped == item				{ return true }
	else if global.armour_equipped[0] == item		{ return true }
	else if global.armour_equipped[1] == item		{ return true }
	else if global.armour_equipped[2] == item		{ return true }
	else if global.armour_equipped[3] == item		{ return true }
	else if global.accessory_equipped[0] == item	{ return true }
	else if global.accessory_equipped[1] == item	{ return true }
	else if global.accessory_equipped[2] == item	{ return true }
	else { return false }
}