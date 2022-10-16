/// @description React to Mouse Click

instance_destroy(obj_trade_button)
instance_destroy(obj_plusminus)
instance_destroy(obj_enchant_button)
instance_destroy(obj_manualinput)
obj_trademenu.overview_id = -1
obj_trademenu.can_scroll = false

if type == "buy" {
	obj_trademenu.current_tab = "buy"
	obj_trademenu.sprite_index = spr_trademenu
	trade_populate("buying")
}
else if type == "sell" {
	obj_trademenu.current_tab = "sell"
	obj_trademenu.sprite_index = spr_trademenu
	trade_populate(obj_trademenu.category)
}
else if type == "craft" {
	obj_trademenu.current_tab = "craft"
	obj_trademenu.sprite_index = spr_crafting
	//show_message(obj_trademenu.recipe_list)
	trade_populate("crafting")
	
	with instance_create(obj_trademenu.x + 276, obj_trademenu.y + 444, obj_plusminus) {
		type = "plus"
		image_index = 0
	}
	with instance_create(obj_trademenu.x + 324, obj_trademenu.y + 444, obj_plusminus) {
		type = "minus"
		image_index = 1
	}
	
	if obj_trademenu.crafting_category == "enchanting" {
		with instance_create(obj_trademenu.x + 264, obj_trademenu.y + 218, obj_manualinput) {
			if slot_type = -1 {
				slot_type = "gear"
			}
		}
		with instance_create(obj_trademenu.x + 264, obj_trademenu.y + 338, obj_manualinput) {
			if slot_type = -1 {
				slot_type = "solite"
			}
		}
	}
}