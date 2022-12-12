/// @description WALKING

switch char_type {
	case "Sailor 1":
		up_sprite = spr_sailor_1_up
		dn_sprite = spr_sailor_1_dn
		lr_sprite = spr_sailor_1_lr
		break
	case "Sailor 2":
		up_sprite = spr_sailor_2_up
		dn_sprite = spr_sailor_2_dn
		lr_sprite = spr_sailor_2_lr
		break
}

if alarm[0] == -1 {
	image_speed = 0.3
	if walk_axis == "X" {
		x += walk_speed * current_dir
		
		if current_dir == 1 && x >= origin_x + walk_distance { alarm[0] = wait_time * 60 }
		else if current_dir == -1 && x <= origin_x - walk_distance { alarm[0] = wait_time * 60 }
	} else {
		y += walk_speed * current_dir
		
		if current_dir == 1 && y >= origin_y + walk_distance { alarm[0] = wait_time * 60 }
		else if current_dir == -1 && y <= origin_y - walk_distance { alarm[0] = wait_time * 60 }
	}
} else {
	image_speed = 0
	image_index = 0
}