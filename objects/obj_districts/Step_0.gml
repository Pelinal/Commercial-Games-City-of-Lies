/// @description Check for mouse over or click

if position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id) {
	// Check for Mouse Enter
	image_alpha = 1
	depth = -1004
	
	switch district {
		case "Palace":
			obj_map.current_district = "Palace of Obedience"
			break
		case "Highend":
			obj_map.current_district = "Highend"
			break
		case "Docklands":
			obj_map.current_district = "Docklands"
			break
		case "Stadium":
			obj_map.current_district = "Stadia Regia"
			break
		case "Central":
			obj_map.current_district = "Centralis"
			break
		case "North":
			obj_map.current_district = "Vicinia"
			break
		case "Bridge":
			obj_map.current_district = "Auctora Bridge"
			break
		case "Theatre":
			obj_map.current_district = "Theatre District"
			break
		case "Severia":
			obj_map.current_district = "Severia"
			break
		case "Bastion":
			obj_map.current_district = "Bastion"
			break
		case "West":
			obj_map.current_district = "New West"
			break
		default:
			obj_map.current_district = -1
			break
	}

} else {
	image_alpha = 0
	depth = -1003
	
	if !position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), obj_districts) {
		obj_map.current_district = -1
	}
}

x = obj_map.x_icon_origin + (local_x * obj_map.image_xscale)
y = obj_map.y_icon_origin + (local_y * obj_map.image_yscale)
image_xscale = 1 * obj_map.image_xscale
image_yscale = 1 * obj_map.image_yscale