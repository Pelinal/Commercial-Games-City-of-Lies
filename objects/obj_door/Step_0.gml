if(distance_to_object(obj_player)) <= 32 {
    if keyboard_check(vk_space) && !opening && !global.immobile {
		if !locked && !conditional {
	        image_speed = 0.4
	        opening = true
		} else if locked {
			if global.locks >= lock_level {
				message_notification("Door Unlocked")
				global.locks += 0.1
				locked = false
			} else {
				message_notification("Requires Lockpicking Level " + string(lock_level))
			}
		} else if conditional && !locked {
			if condition {
				image_speed = 0.4
				opening = true
			} else {
				message_notification("You cannot go here now")
			}
		}
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
        with obj_player { sprite_index = up_sprite image_xscale = 1 image_speed = asp }
    }
    else if newDir == "left" { 
        with obj_player { sprite_index = lr_sprite image_xscale = 1 image_speed = asp }
    }
    else if newDir == "down" {
        with obj_player { sprite_index = dn_sprite image_xscale = 1 image_speed = asp }
    }
    else if newDir == "right" {
        with obj_player { sprite_index = lr_sprite image_xscale = -1 image_speed = asp }
    }
    
    room_goto(travel_to)
}


