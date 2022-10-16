/// @description trade_main

function trade_populate(type){
	// type: consumables, armours, weapons, accessories, key items, materials, general, or buying
	// list: used only if type = "buying", it is the merchant's list of items from obj_vendor
	// find player's items
	
	if type == "consumables"		{ obj_trademenu.pop_list = global.consumables	}
	else if type == "armours"		{ obj_trademenu.pop_list = global.armours		}
	else if type == "weapons"		{ obj_trademenu.pop_list = global.weapons		}
	else if type == "accessories"	{ obj_trademenu.pop_list = global.accessories	}
	else if type == "key items"		{ obj_trademenu.pop_list = global.keyitems		}
	else if type == "materials"		{ obj_trademenu.pop_list = global.materials		}
	else if type == "general"		{ obj_trademenu.pop_list = "all"				}
	// find vendor's items
	else if type == "buying"		{ obj_trademenu.pop_list = obj_trademenu.stock_list }
	// crafting menu
	else if type == "crafting"		{ obj_trademenu.pop_list = obj_trademenu.recipe_list }
	
	// Create List Buttons
	
	with obj_trademenu {
		x_margin = obj_trademenu.x + 24
		y_margin = obj_trademenu.y + 72

		for (i = 0; i < array_length(pop_list); i ++) {
			with instance_create(x_margin, y_margin, obj_trade_button) {
				if row_id == -1 {	
					row_id = obj_trademenu.i
					item_id = obj_trademenu.pop_list[obj_trademenu.i][0]
					item_price = trade_price(item_id, obj_trademenu.current_tab)
					
				}
			}
			y_margin += 32
		}
	
		if y_margin > 432 {
			obj_trademenu.can_scroll = true
			obj_trademenu.max_scroll = (y_margin - 432) / 32
		}
	}
}

function trade_price(item, type) {
	// Finds the price of an item to buy or sell
	var price
	if global.library[item][2] == global.consumables {
		for (i = 0; i < array_length(global.c_library); i ++) {
			if global.c_library[i][0] == item { price = global.c_library[i][3] }
		}
	}
	else if global.library[item][2] == global.weapons {
		for (i = 0; i < array_length(global.w_library); i ++) {
			if global.w_library[i][0] == item { price = global.w_library[i][3] }
		}
	}
	else if global.library[item][2] == global.armours {
		for (i = 0; i < array_length(global.ar_library); i ++) {
			if global.ar_library[i][0] == item { price = global.ar_library[i][3] }
		}
	}
	else if global.library[item][2] == global.accessories {
		for (i = 0; i < array_length(global.ac_library); i ++) {
			if global.ac_library[i][0] == item { price = global.ac_library[i][3] }
		}
	}
	else if global.library[item][2] == global.materials {
		for (i = 0; i < array_length(global.m_library); i ++) {
			if global.m_library[i][0] == item { price = global.m_library[i][2] }
		}
	}
	
	if type == "sell" {
		price *= (global.barter)/30
	}
	else if type == "buy" {
		price /= (global.barter)/30
	}
	else if type == "craft" {
		price *= 1.5
	}
	
	return round(price)
}