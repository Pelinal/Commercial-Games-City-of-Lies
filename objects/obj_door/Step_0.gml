if(distance_to_object(obj_player)) <= 32 {
    if keyboard_check(vk_space) && !opening {
        image_speed = 0.4
        opening = true
    }
}
if(distance_to_object(obj_player)) <= 0 {
	if !visible {
		image_index = image_number-1
	}
}
if image_index >= image_number-1 {
    opening = false
    image_speed = 0
    
    obj_player.x = newX
    obj_player.y = newY
    
    if newDir == "up" {
        with obj_player { sprite_index = spr_player_up image_xscale = 1 image_speed = asp }
    }
    else if newDir == "left" { 
        with obj_player { sprite_index = spr_player_leftright image_xscale = 1 image_speed = asp }
    }
    else if newDir == "down" {
        with obj_player { sprite_index = spr_player_down image_xscale = 1 image_speed = asp }
    }
    else if newDir == "right" {
        with obj_player { sprite_index = spr_player_leftright image_xscale = -1 image_speed = asp }
    }
    
    room_goto(travel_to)
}


