/// @description Respond to Left Click

global.current_menu = tab
obj_inventory.overview_id = -1
instance_destroy(obj_inventory_button)
instance_destroy(obj_inventory_dropdown)
instance_destroy(obj_scrollbar)
instance_destroy(obj_inventory_tabs)
obj_inventory.scrollbar = false
obj_inventory.tab_switched = true

with obj_inventory { inventory_populate(global.current_menu) }
