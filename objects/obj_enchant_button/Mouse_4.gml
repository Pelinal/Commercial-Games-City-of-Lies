/// @description Respond to Left-Click

if slot_type == "gear" {
	obj_trademenu.ench_selected_items[1] = item_id
}
else {
	obj_trademenu.ench_selected_items[2] = item_id
}

instance_destroy(obj_enchant_button)