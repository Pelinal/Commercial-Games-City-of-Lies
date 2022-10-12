/// @description Check for trademenu visibility

//if instance_number(obj_vendor) == 0 {
//	instance_destroy(self)
//}

if y > obj_trademenu.y + 432 || y < obj_trademenu.y + 70 {
	visible = false
} else { visible = true }
