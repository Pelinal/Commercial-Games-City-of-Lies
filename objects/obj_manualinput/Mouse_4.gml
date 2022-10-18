/// @description Respond to Left click


//obj_trademenu.overview_id = -1
instance_destroy(obj_enchant_button)
if slot_type == "gear" {
	gear_list = []
	for (i = 0; i < array_length(global.weapons); i ++) { 
		array_push(gear_list, global.weapons[i][0])
	}
	if obj_trademenu.overview_id != 109 && obj_trademenu.overview_id != 110 && obj_trademenu.overview_id != 111 {	/// Weapon-specific enchantments 
		for (i = 0; i < array_length(global.armours); i ++) { 
			array_push(gear_list, global.armours[i][0])
		}
		for (i = 0; i < array_length(global.accessories); i ++) { 
			array_push(gear_list, global.accessories[i][0])
		}
	}
	obj_manualinput.gear_list = gear_list
	
	// Create List Buttons
	//show_message(gear_list)
	
	x_margin = obj_trademenu.x + 384
	y_margin = obj_trademenu.y + 72

	for (i = 0; i < array_length(gear_list); i ++) {
		obj_manualinput.i = i
		//if inventory_is_enchanted(gear_list[i]) { }
		with instance_create(x_margin, y_margin, obj_enchant_button) {
			if item_id == -1 { item_id = obj_manualinput.gear_list[obj_manualinput.i] }
			slot_type = "gear"
			draw_y = (obj_manualinput.i * 72) + 162
		}
		y_margin += 32
	}
	
	if y_margin > 432 {
		obj_manualinput.can_scroll = true
		obj_manualinput.max_scroll = (y_margin - 432) / 32
	}
}
if slot_type == "solite" {
	solite_list = []
	if inventory_check(11) > 0 { array_push(solite_list, 11) }
	if inventory_check(23) > 0 { array_push(solite_list, 23) }
	if inventory_check(24) > 0 { array_push(solite_list, 24) }
	if inventory_check(25) > 0 { array_push(solite_list, 25) }
	obj_manualinput.solite_list = solite_list
	
	// Create List Buttons
	
	x_margin = obj_trademenu.x + 384
	y_margin = obj_trademenu.y + 72

	for (i = 0; i < array_length(solite_list); i ++) {
		obj_manualinput.i = i
		with instance_create(x_margin, y_margin, obj_enchant_button) {
			if item_id == -1 {
				item_id = obj_manualinput.solite_list[obj_manualinput.i]
				slot_type = "solite"
				draw_y = (obj_manualinput.i * 72) + 162
			}
		}
		y_margin += 32
	}
	
	if y_margin > 432 {
		obj_manualinput.can_scroll = true
		obj_manualinput.max_scroll = (y_margin - 432) / 32
	}
}