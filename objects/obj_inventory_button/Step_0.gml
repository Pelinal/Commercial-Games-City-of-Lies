/// @description Check for inventory visibility

if obj_inventory.visible == false {
	instance_destroy(self)
}

if y_draw > 960 || y_draw < 355 {
	visible = false
} else { visible = true }

if obj_inventory.scrollbar {
	if mouse_wheel_up() { obj_inventory.scroll_value -= 1 y -= 32 y_draw -=72 } 
	else if mouse_wheel_down() { obj_inventory.scroll_value += 1 y += 32 y_draw += 72 }
}
