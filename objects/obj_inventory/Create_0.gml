/// @description  Initialise
// Define Variables and Libraries
inventory_initialise()
// Loot system initialise
loot_initialise()

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
inventory_consumable_add(72, 3)
inventory_consumable_add(33, 3)
inventory_consumable_add(34, 3)
inventory_weapon_add(1, 1)
inventory_armour_add(4, 1)
inventory_accessory_add(7, 1)
inventory_keyitem_add(8, 1)
inventory_keyitem_add(0, 100)
inventory_material_add(9, 10)
inventory_add(53, 20)