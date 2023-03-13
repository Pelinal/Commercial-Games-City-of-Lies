/// @description Insert description here
// You can write your code in this editor

if(distance_to_object(obj_player)) <= 32 {
    if keyboard_check_pressed(vk_space) && !global.immobile {
		global.immobile = true
		in_dialogue = true
		var temp_name, temp_text
		temp_name[0] = "Commander Luxia"
		temp_text[0] =  "Look, if you have business with the Prefect be \n" +
						"swift, he does not tolerate the presence of\n" +
						"outsiders for long... and neither do I.\n" +
						"small favour for me. "
				
		message(temp_text, 1)
		message_nametag(temp_name, 1)
	}
}

//if choice_result == "Meriaas01" {}

if instance_number(obj_messagebox) == 0 { in_dialogue = false }

if in_dialogue {
	//alarm[0] = 30
	
	var player_diff_x, player_diff_y
	player_diff_x = x - obj_player.x
	player_diff_y = y - obj_player.y
	
	if abs(player_diff_x) > abs(player_diff_y) {
		// If X diff is larger than Y diff
		sprite_index = lr_sprite
		image_xscale = sign(player_diff_x) // Either -1 or 1
	} else {
		// If Y diff is larger than X diff
		if sign(player_diff_y) == -1 {
			sprite_index = dn_sprite
		} else {
			sprite_index = up_sprite
		}
	}
}