/// @description Respond to Left Click

global.current_menu = tab
obj_inventory.overview_id = -1
obj_inventory.tab_swtiched = true
instance_destroy(obj_inventory_button)
instance_destroy(obj_inventory_tabs)
instance_destroy(obj_inventory_dropdown)

with obj_inventory {
	inventory_populate(global.current_menu)
}
