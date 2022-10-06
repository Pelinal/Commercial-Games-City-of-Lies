/// @description Respond to Left Click

global.current_menu = tab
obj_inventory.overview_id = -1
instance_destroy(obj_inventory_button)
instance_destroy(obj_inventory_tabs)
instance_destroy(obj_inventory_dropdown)

with obj_inventory {
	inventory_populate(global.current_menu)
}
