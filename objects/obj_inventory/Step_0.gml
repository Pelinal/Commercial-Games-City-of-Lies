/// @description Check for Input

if (keyboard_check_pressed(vk_tab) || keyboard_check_pressed(ord("I"))) && !visible {
	visible = true
	x = view_xview + 67
	y = view_yview + 64
	global.immobile = true
	inventory_populate(global.current_menu)
}

if keyboard_check_pressed(vk_escape) && visible {
	visible = false
	x = -854
	y = -480
	overview_id = -1
	global.immobile = false
	
	instance_destroy(obj_inventory_tabs)
	instance_destroy(obj_inventory_dropdown)
	instance_destroy(obj_scrollbar)
}