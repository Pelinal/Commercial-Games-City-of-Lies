/// @description Respond to Left Click

// Take one item
inventory_add(loot, amount)
message_notification(global.library[loot][0] + " X" + string(amount) + " added to inventory")
try {	
	array_delete(obj_loot_menu.loot, loot_index, 1)
} catch( _exception) {
    show_debug_message(_exception.message);
}
if instance_number(obj_loot_button) == 1 {
	obj_loot_menu.chest_id.open = false
	obj_loot_menu.chest_id.empty = true
	global.immobile = false
	instance_destroy(obj_loot_button)
	instance_destroy(obj_loot_menu)
	instance_destroy(obj_loot_takeall)
} else {
	instance_destroy(self)	
}