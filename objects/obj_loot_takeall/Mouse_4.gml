/// @description Respond to Left Click

// Take all items from Loot List

index = array_length(loot)
show_message(loot[0][0])

if index >= 1 { inventory_add(loot[0][0], loot[0][1]) }
if index >= 2 { inventory_add(loot[1][0], loot[1][1]) }
if index >= 3 { inventory_add(loot[2][0], loot[2][1]) }
if index >= 4 { inventory_add(loot[3][0], loot[3][1]) }
if index >= 5 { inventory_add(loot[4][0], loot[4][1]) }
if index >= 6 { inventory_add(loot[5][0], loot[5][1]) }

global.gold += obj_loot_menu.gold
instance_destroy(obj_loot_menu)
instance_destroy(obj_loot_button)
global.immobile = false
instance_destroy(self)