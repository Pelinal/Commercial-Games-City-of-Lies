/// @description React to Left click

if type == "destroy" {
	if !(inventory_fetch(chosen_item) == 1) {
		inventory_remove(chosen_item, 1)
	} else {
		instance_destroy(self)
		instance_destroy(obj_inventory_button)
		instance_destroy(obj_inventory_dropdown)
		
		inventory_remove(chosen_item, 1)
		obj_inventory.tab_switched = true
	}
}
else if type == "use" {
	inventory_consumable_use(chosen_item)
	if !(inventory_fetch(chosen_item) == 1) {
		inventory_remove(chosen_item, 1)
	} else {
		instance_destroy(self)
		instance_destroy(obj_inventory_button)
		instance_destroy(obj_inventory_dropdown)
		
		inventory_remove(chosen_item, 1)
		obj_inventory.tab_switched = true
	}
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
else if type == "buy" {
	if inventory_fetch(0) >= trade_price(chosen_item, "buy") {
		inventory_remove(0, trade_price(chosen_item, "buy"))
		inventory_add(chosen_item, 1)
		obj_trademenu.stock_list[stock_row][1] --
	}
}
else if type == "sell" {
	if inventory_fetch(chosen_item) > 0 {
		inventory_add(0, trade_price(chosen_item, "sell"))
		inventory_remove(chosen_item, 1)
			
		in_list = false
		for (i = 0; i < array_length(obj_trademenu.stock_list); i ++) {
			if obj_trademenu.stock_list[i][0] == chosen_item {
				obj_trademenu.stock_list[i][1] ++
				in_list = true
			}
		}
		if !in_list { array_push(obj_trademenu.stock_list, [chosen_item, 1]) }
	}
}
else if type == "craft" {
	// Check for ingredients and remove required quantities
	//show_message(ingred_list)
	if obj_trademenu.crafting_category == "alchemy" {
		if inventory_fetch(ingred_list[1]) >= (1*obj_trademenu.craft_amount) && inventory_fetch(ingred_list[2]) >= (1*obj_trademenu.craft_amount) && inventory_fetch(ingred_list[3]) >= (1*obj_trademenu.craft_amount) {
			// Remove Ingredients
			inventory_remove(ingred_list[1], obj_trademenu.craft_amount)
			inventory_remove(ingred_list[2], obj_trademenu.craft_amount)
			inventory_remove(ingred_list[3], obj_trademenu.craft_amount)
			// Remove Gold
			inventory_remove(0, (trade_price(chosen_item, "craft"))*obj_trademenu.craft_amount)
			inventory_add(ingred_list[0], obj_trademenu.craft_amount)
			global.alchemy += choose(0.01, 0.03, 0.03, 0.05, 0.05, 0.05, 0.07)
		}
	}
	else if obj_trademenu.crafting_category == "smithing" {
		cc = crafting_craft_cost(chosen_item) // cc = 'craft cost'
		
		if inventory_fetch(ingred_list[1]) >= cc[0] && inventory_fetch(ingred_list[2]) >= cc[1] && inventory_fetch(ingred_list[3]) >= cc[2] {
			// Remove Ingredients
			inventory_remove(ingred_list[1], cc[0])
			inventory_remove(ingred_list[2], cc[1])
			inventory_remove(ingred_list[3], cc[2])
			// Remove Gold
			inventory_remove(0, trade_price(chosen_item, "craft"))
			inventory_add(ingred_list[0], obj_trademenu.craft_amount)
			global.smithing += choose(0.01, 0.03, 0.03, 0.05, 0.05, 0.05, 0.07)
		}
	}
	else if obj_trademenu.crafting_category == "enchanting" {
		if inventory_fetch(ingred_list[1]) >= (1*obj_trademenu.craft_amount) && inventory_fetch(obj_trademenu.ench_selected_items[1]) >= (1*obj_trademenu.craft_amount) && inventory_fetch(obj_trademenu.ench_selected_items[2]) >= (1*obj_trademenu.craft_amount) {
			// Remove Ingredients
			inventory_remove(ingred_list[1], obj_trademenu.craft_amount)
			inventory_remove(obj_trademenu.ench_selected_items[1], obj_trademenu.craft_amount)
			inventory_remove(obj_trademenu.ench_selected_items[2], obj_trademenu.craft_amount)
			// Remove Gold
			inventory_remove(0, (trade_price(chosen_item, "craft"))*obj_trademenu.craft_amount)
			crafting_create_enchanted(ingred_list[1], obj_trademenu.ench_selected_items[1], obj_trademenu.ench_selected_items[2]) //add function to create enchanted item using ingredient 2 (gearpiece) and 3 (solite to determine strength)
			global.enchanting += choose(0.01, 0.03, 0.03, 0.05, 0.05, 0.05, 0.07)
		}
	}
}
else if type == "track" {
	// Tracking Quests
	quest_track(selected_quest)
}