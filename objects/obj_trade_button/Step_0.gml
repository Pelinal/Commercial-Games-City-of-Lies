/// @description Check for trademenu visibility

if obj_trademenu.current_tab != "craft" {
	if obj_trademenu.stock_list[row_id][1] <= 0 {
		array_delete(obj_trademenu.stock_list, row_id, 1)
		instance_destroy(self)
		instance_destroy(obj_trade_button)
	
		if obj_trademenu.current_tab = "buy" {
			trade_populate("buying")
		}
		else if obj_trademenu.current_tab = "sell" {
			trade_populate(obj_trademenu.category)
		}
	}
}
if y > obj_trademenu.y + 432 || y < obj_trademenu.y + 70 {
	visible = false
} else { visible = true }
