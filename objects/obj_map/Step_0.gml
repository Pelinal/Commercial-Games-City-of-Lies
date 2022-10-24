/// @description Drag to move camera

if keyboard_check_pressed(ord("M")) {
	visible = true 
	x = 0 
	y = 0 
	
	instance_destroy(obj_districts)
	
	// Create Districts
	with instance_create(1794, 903, obj_districts) {
		sprite_index = spr_district_palace
		district = "Palace"
		local_x = 1795
		local_y = 904
	}
	with instance_create(x + 1665, y + 712, obj_districts) {
		sprite_index = spr_district_highend
		district = "Highend"
		local_x = 1664
		local_y = 712
	}
	with instance_create(x + 1533, y + 731, obj_districts) {
		sprite_index = spr_district_docklands
		district = "Docklands"
		local_x = 1535
		local_y = 732
	}
	with instance_create(x + 1490, y + 983, obj_districts) {
		sprite_index = spr_district_stadium
		district = "Stadium"
		local_x = 1490
		local_y = 983
	}
	with instance_create(x + 1616, y + 428, obj_districts) {
		sprite_index = spr_district_central
		district = "Central"
		local_x = 1616
		local_y = 429
	}
	with instance_create(x + 1340, y + 247, obj_districts) {
		sprite_index = spr_district_north
		district = "North"
		local_x = 1340
		local_y = 248
	}
	with instance_create(x + 1225, y + 466, obj_districts) {
		sprite_index = spr_district_bridge
		district = "Bridge"
		local_x = 1225
		local_y = 466
	}
	with instance_create(x + 852, y + 310, obj_districts) {
		sprite_index = spr_district_theatre
		district = "Theatre"
		local_x = 852
		local_y = 310
	}
	with instance_create(x + 1025, y + 639, obj_districts) {
		sprite_index = spr_district_severia
		district = "Severia"
		local_x = 1025
		local_y = 639
	}
	with instance_create(x + 1105, y + 937, obj_districts) {
		sprite_index = spr_district_bastion
		district = "Bastion"
		local_x = 1105
		local_y = 937
	}
	with instance_create(x + 843, y + 718, obj_districts) {
		sprite_index = spr_district_west
		district = "West"
		local_x = 843
		local_y = 718
	}
}
if keyboard_check_pressed(vk_escape) { visible = false instance_destroy(obj_districts) }

if visible {
	if mouse_check_button_pressed(mb_left) {
		drag_x = x - mouse_x
		drag_y = y - mouse_y
		dragged = true
	}


	if mouse_check_button_released(mb_left) {
		dragged = false
	}
	
	if dragged {
		x = mouse_x + drag_x
		y = mouse_y + drag_y
		
	}

	
	if mouse_wheel_up() && image_xscale < 2.5 {
		image_xscale += 0.5
		image_yscale += 0.5
		
	}
	if mouse_wheel_down() && image_xscale > 1 {
		image_xscale -= 0.5
		image_yscale -= 0.5
		
	}
	
	if x > 1056*image_xscale { x = 1056*image_xscale }
	else if x < 865 && image_xscale == 1 { x = 865 }
	else if x < 338 && image_xscale == 1.5 { x = 338 }
	else if x < -190 && image_xscale == 2 { x = -190 }
	else if x < -720 && image_xscale == 2.5 { x = -720 }
	
	if y > 594*image_yscale { y = 594*image_yscale  }
	else if y < 486 && image_yscale == 1 { y = 486 }
	else if y < 190 && image_yscale == 1.5 { y = 190 }
	else if y < -108 && image_yscale == 2 { y = -108 }
	else if y < -406 && image_yscale == 2.5 { y = -404 }
	
	x_icon_origin = x - 1056 * image_xscale; 
	y_icon_origin = y - 594 * image_yscale;
}