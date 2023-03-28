/// @description scene_actor()
/// All Scene Commands that affect actors (characters)

/// @param Actor
/// @param Move
function scene_actor_move(actor, move, old_x, old_y){
	global.immobile = true
	
	// Moves the Chosen Actor using the movement
	// L - Left, R - Right, U - Up, D - Down
	var walk_speed = 6
	
	if move == "L" {
		actor.sprite_index = actor.lr_sprite
		actor.image_xscale = 1
		//actor.image_speed = 0.4
				
		// Decrement X coord
		if actor.x > (old_x - 32) {
			actor.x -= walk_speed
			return false
		} else {
			actor.x = old_x - 32
			//image_speed = 0
			//image_index = 0
			return true
		}
				
	} else if move == "R" {
		actor.sprite_index = actor.lr_sprite
		actor.image_xscale = -1
			
		// Increment X coord
		if actor.x < (old_x + 32) {
			actor.x += walk_speed
			return false
		} else {
			actor.x = old_x + 32
			//image_speed = 0
			//image_index = 0
			return true
		}
			
	} else if move == "U" {
		actor.sprite_index = actor.up_sprite
			
		// Decrement Y coord
		if actor.y > (old_y - 32) {
			actor.y -= walk_speed
			return false
		} else {
			actor.y = old_y - 32
			//image_speed = 0
			//image_index = 0
			return true
		}
	} else if move == "D" {
		actor.sprite_index = actor.dn_sprite
			
		// Increment Y coord
		if actor.y < (old_y + 32) {
			actor.y += walk_speed
			return false
		} else {
			actor.y = old_y + 32
			//image_speed = 0
			//image_index = 0
			return true
		}
	} else if move == "END" {
		global.immobile = false
		instance_destroy(actor)	
	}

	//if i >= array_length(move_list) {
	//	global.immobile = false
	//	if destroy_after { instance_destroy(actor) }
	//}
}