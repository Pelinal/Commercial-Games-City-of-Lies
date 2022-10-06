/// @description React to Left click

if type == "destroy" {
	inventory_remove(chosen_item, 1)
}
else if type == "use" {
	inventory_consumable_use(chosen_item)
	inventory_remove(chosen_item, 1)
}
else if type == "equip" {
	if global.current_menu == "weapons"	 { inventory_weapon_equip(chosen_item)    }
	if global.current_menu == "armours"	 { inventory_armour_equip(chosen_item)    }
	if global.current_menu == "accessories" { inventory_accessory_equip(chosen_item) }
}
else if type == "unequip" {
	if global.current_menu == "weapons"	 { inventory_weapon_unequip()    }
	if global.current_menu == "armours"	 { inventory_armour_unequip(chosen_item)    }
	if global.current_menu == "accessories" { inventory_accessory_unequip(chosen_item) }
}