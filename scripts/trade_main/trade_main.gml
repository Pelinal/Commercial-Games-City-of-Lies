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
	
	// Create List Buttons
	with obj_trademenu {
		x_margin = obj_trademenu.x + 32
		y_margin = obj_trademenu.y + 72

		for (i = 0; i < array_length(pop_list); i ++) {
			with instance_create(x_margin, y_margin, obj_trade_button) {
				if row_id == -1 {	
					row_id = obj_trademenu.i
					item_id = obj_trademenu.pop_list[obj_trademenu.i][0]
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