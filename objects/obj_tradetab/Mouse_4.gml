/// @description React to Mouse Click

instance_destroy(obj_trade_button)
obj_trademenu.overview_id = -1

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
}