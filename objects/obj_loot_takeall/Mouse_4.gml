/// @description Respond to Left Click

// Take all items from Loot List

index = array_length(loot)
//show_message(loot[0][0])

if index >= 1 { inventory_add(loot[0][0], loot[0][1])	message_notification(global.library[loot[0][0]][0] + " X" + string(loot[0][1]) + " added to inventory (I to View)") }
if index >= 2 { inventory_add(loot[1][0], loot[1][1])	message_notification(global.library[loot[1][0]][0] + " X" + string(loot[1][1]) + " added to inventory (I to View)")}
if index >= 3 { inventory_add(loot[2][0], loot[2][1])	message_notification(global.library[loot[2][0]][0] + " X" + string(loot[2][1]) + " added to inventory (I to View)")}
if index >= 4 { inventory_add(loot[3][0], loot[3][1])	message_notification(global.library[loot[3][0]][0] + " X" + string(loot[3][1]) + " added to inventory (I to View)")}
if index >= 5 { inventory_add(loot[4][0], loot[4][1])	message_notification(global.library[loot[4][0]][0] + " X" + string(loot[4][1]) + " added to inventory (I to View)")}
if index >= 6 { inventory_add(loot[5][0], loot[5][1])	message_notification(global.library[loot[5][0]][0] + " X" + string(loot[5][1]) + " added to inventory (I to View)")}

obj_loot_menu.chest_id.open = false
obj_loot_menu.chest_id.empty = true
global.chests[obj_loot_menu.chest_id.chests_id] = []
show_debug_message(global.chests)
instance_destroy(obj_loot_menu)
instance_destroy(obj_loot_button)
global.immobile = false
instance_destroy(self)