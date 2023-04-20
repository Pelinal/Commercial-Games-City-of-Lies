/// @description  Initialise
// Define Variables and Libraries
inventory_initialise()
// Loot system initialise
loot_initialise()
// Combat Initialise
combat_initialise()

depth = -1000
scrollbar = false
overview_id = -1
tab_switched = false
global.current_menu = "consumables"    // The category currently being displayed (consumables, weapons, armour, accessories, key items, or materials)

// Keep hidden at start
visible = false

// Variables to determine possible inventory actions
can_use = false
can_equip = false
can_destroy = false
//item_selected = false
scroll_value = 0
max_scroll = 0


// TEMP - for testing functionality only
inventory_add(72, 3)
inventory_add(7, 1)
inventory_add(0, 100)
inventory_add(73, 3)
inventory_add(74, 3)
inventory_add(118, 3)
inventory_add(119, 1)