/// @description Scroll and Step Events

if keyboard_check(vk_escape) {
	instance_destroy(obj_trademenu)	
	instance_destroy(obj_trade_button)	
	instance_destroy(obj_tradetab)
	
	obj_vendor.trading = false
	global.immobile = false
}

if max_scroll >= 1 {
	if mouse_wheel_up()		   { scroll_value += 1 obj_trade_button.y -= 32 } 
	else if mouse_wheel_down() { scroll_value -= 1 obj_trade_button.y += 32}
}

// failsafe
if scroll_value < max_scroll { scroll_value = 0 }
if scroll_value > max_scroll { scroll_value = max_scroll }
