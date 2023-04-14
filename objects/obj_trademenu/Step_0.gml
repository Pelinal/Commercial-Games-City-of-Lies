/// @description Scroll and Step Events
global.immobile = true
if keyboard_check(vk_escape) {
	instance_destroy(obj_trademenu)	
	instance_destroy(obj_trade_button)	
	instance_destroy(obj_tradetab)
	instance_destroy(obj_plusminus)
	
	current_vendor.trading = false
	global.immobile = false
}

// failsafe
if scroll_value < max_scroll { scroll_value = 0 }
if scroll_value > max_scroll { scroll_value = max_scroll }

