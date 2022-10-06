/// @description  Initialise
// Define Variables and Libraries
inventory_initialise()

depth = -10
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
item_selected = false

// TEMP - for testing functionality only

inventory_consumable_add(0, 3)
inventory_weapon_add(1, 1)
inventory_armour_add(4, 1)
inventory_accessory_add(7, 1)
inventory_keyitem_add(8, 1)
inventory_material_add(9, 10)