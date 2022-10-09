/// @description Check for Scrollwheel input

if max_scroll >= 1 {
	if mouse_wheel_up()		   { scroll_value += 1 obj_inventory_button.y -= 32 } 
	else if mouse_wheel_down() { scroll_value -= 1 obj_inventory_button.y += 32}
}

// failsafe
if scroll_value < max_scroll { scroll_value = 0 }
if scroll_value > max_scroll { scroll_value = max_scroll }

if obj_inventory.visible == false { instance_destroy(self) }
