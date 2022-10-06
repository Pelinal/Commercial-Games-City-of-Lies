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
	// Index 0: Item Name, Index 1: Description
	global.library[0] = ["Health Potion", "A potion brewed using a mixture involving Solite, its\nmagical properties heal the user 30 pts."]
	global.library[1] = ["Rusted Sword", "A blunt, rusted old sword. You should probably consider replacing it."]
	global.library[2] = ["Rotten Staff", "Rotten, but still useful. Who knows for how much longer though."]
	global.library[3] = ["Blunt Dagger", "Aren't daggers for stabbing? How you gonna stab anyone with this dull blade?"]
	global.library[4] = ["Dented Chainmail", "This chainmail has clearly been pulled off a corpse, probably one of a soldier."]
	global.library[5] = ["Tattered Robes", "This frail fabric seems as though a gentle breeze might loosen its poorly-woven threads."]
	global.library[6] = ["Drifter's Jacket", "Perfect for looking like an impoverished criminal."]
	global.library[7] = ["Signet Ring", "A blemished old ring. It is the only thing you have to remind you of your parents, whom you have never met."]
	global.library[8] = ["Orders", "Your orders from the crime boss Qula K'in, she has sent you on a mission to steal from the Palace of Obedience."]
	global.library[9] = ["Copper Ore", "The most common form of ore in Komsos, used for low-tier weapons and armour. Bring to a Smith to forge it."]
	global.library[10] = ["Capitolina Prima", "This green herb is commonly found along the riverbanks of The Capital. Its name means 'Capital's First'."]
	global.library[11] = ["Impure Solite", "A weakly powered chunk of Solite ore. A small amount of magical energy may be extracted from it."]
	
	// Call Externals
	inventory_consumable_initialise()
	inventory_weapon_initialise()
	inventory_armour_initialise()
	inventory_accessory_initialise()
	inventory_keyitem_initialise()
	inventory_material_initialise()
	
	// Create Icon Library // Values refer to coords in ts_icons_iconset
	global.icons[0] = 192		// Health Potion
	global.icons[1] = 147		// Rusted Sword
	global.icons[2] = 152		// Rotten Staff
	global.icons[3] = 150		// Blunt Dagger
	global.icons[4] = 168		// Dented Chainmail
	global.icons[5] = 183		// Tattered Robes
	global.icons[6] = 433		// Drifter's Jacket
	global.icons[7] = 611		// Signet Ring
	global.icons[8] = 227		// Orders
	global.icons[9] = 344		// Copper Ore
	global.icons[10] = 309		// Capitolina Prima
	global.icons[11] = 343		// Impure Solite
	
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
	
	x_margin = obj_inventory.x + 32
	y_margin = obj_inventory.y + 160
	
	// Create List Buttons
	for (i = 0; i < array_length(pop_list); i ++) {
		instance_create(x_margin, y_margin, obj_inventory_button) {}
		if obj_inventory_button.row_id == -1 {	
			obj_inventory_button.row_id = i
			obj_inventory_button.item_id = pop_list[i][0]
		}
		y_margin += 32
	}
	
	if y_margin > 432 {
		obj_inventory.scrollbar = true
		
		with instance_create(obj_inventory.x+348, obj_inventory.y+170, obj_scrollbar) {
			max_scroll = (y_margin - 432) / 32
		}
	}
	
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

function inventory_check(item) {
	// Searches all Inventories for specified item item
	
	for (i = 0; i < array_length(global.consumables); i ++) if global.consumables[i][0] == item		{ return true }
	for (i = 0; i < array_length(global.weapons); i ++) if global.weapons[i][0] == item				{ return true }
	for (i = 0; i < array_length(global.armours); i ++) if global.armours[i][0] == item				{ return true }
	for (i = 0; i < array_length(global.accessories); i ++) if global.accessories[i][0] == item		{ return true }
	for (i = 0; i < array_length(global.keyitems); i ++) if global.weapons[i][0] == item			{ return true }
	for (i = 0; i < array_length(global.materials); i ++) if global.weapons[i][0] == item			{ return true }
	
	return false
}

function inventory_remove(item, amount) {
	// Searches all Inventories for item, then removes it
	
	if global.current_menu == "consumables"			{ inventory_consumable_remove(item, amount) }
	else if global.current_menu == "weapons"		{ inventory_weapon_remove(item, amount)		}
	else if global.current_menu == "armours"		{ inventory_armour_remove(item, amount)		}
	else if global.current_menu == "accessories"	{ inventory_accessory_remove(item, amount)	}
	else if global.current_menu == "key items"		{ inventory_keyitem_remove(item, amount)	}
	else if global.current_menu == "materials"		{ inventory_material_remove(item, amount)	}
}

function inventory_delete(item, amount) {
	// Searches all Inventories for item, then deletes all copies of it
	
	if global.current_menu == "consumables"			{ inventory_consumable_delete(item, amount) }
	else if global.current_menu == "weapons"		{ inventory_weapon_delete(item, amount)		}
	else if global.current_menu == "armours"		{ inventory_armour_delete(item, amount)		}
	else if global.current_menu == "accessories"	{ inventory_accessory_delete(item, amount)	}
	else if global.current_menu == "key items"		{ inventory_keyitem_delete(item, amount)	}
	else if global.current_menu == "materials"		{ inventory_material_delete(item, amount)	}
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