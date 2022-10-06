/// @description Check for inventory visibility

if obj_inventory.visible == false {
	instance_destroy(self)
}

if y > obj_inventory.y + 432 || y < obj_inventory.y + 160 {
	visible = false
} else { visible = true }