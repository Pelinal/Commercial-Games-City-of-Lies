/// @description Set Alarm to -1

current_dir *= -1
if walk_axis == "X" {
	image_xscale *=-1
	sprite_index = lr_sprite
	
} else if walk_axis == "Y" {
	if current_dir == -1 {
		sprite_index = up_sprite
	} else {
		sprite_index = dn_sprite
	}
}

alarm[0] = -1