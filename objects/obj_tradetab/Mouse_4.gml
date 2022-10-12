/// @description React to Mouse Click

instance_destroy(obj_trade_button)
obj_trademenu.overview_id = -1

if type == "buy" {
	obj_trademenu.current_tab = "buy"
	trade_populate("buying")
}
else if type == "sell" {
	obj_trademenu.current_tab = "sell"
	trade_populate(obj_trademenu.category)
}
else if type == "craft" {
	obj_trademenu.current_tab = "craft"
	trade_populate("crafting")
}