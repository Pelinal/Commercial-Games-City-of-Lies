/// @description Change Equip/Unequip

if keyboard_check_pressed(vk_escape) {
	instance_destroy(obj_inventory_dropdown)
}

if type == "equip" {
	if global.current_menu == "weapons" && inventory_weapon_check_equipped(chosen_item)				{ type = "unequip" }
	else if global.current_menu == "armours" && inventory_armour_check_equipped(chosen_item)		{ type = "unequip" }
	else if global.current_menu == "accessories" && inventory_accessory_check_equipped(chosen_item) { type = "unequip" }
}