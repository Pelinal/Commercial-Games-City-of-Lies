/// @description Change Equip/Unequip

if type == "equip" {
	if global.current_menu == "weapons" && inventory_weapon_check_equipped(chosen_item)				{ type = "unequip" }
	else if global.current_menu == "armours" && inventory_armour_check_equipped(chosen_item)		{ type = "unequip" }
	else if global.current_menu == "accessories" && inventory_accessory_check_equipped(chosen_item) { type = "unequip" }
}