/// @description scene_actor()
/// All Scene Commands that affect actors (characters)

/// @param Actor
/// @param MoveList
/// @param DestroyAfterMovement?
function scene_actor_move(actor, move_list, destroy_after=false){
	
	// Moves the Chosen Actor using the list of movements
	// L - Left, R - Right, U - Up, D - Down
	var i = 0
	var old_x = actor.x
	var old_y = actor.y
	var walk_speed = 3
	
	while i < array_length(move_list) {
		global.immobile = true
		if move_list[i] == "L" {
			actor.sprite_index = actor.lr_sprite
			actor.image_xscale = 1
			actor.image_speed = 0.4
				
			// Decrement X coord
			if actor.x > (old_x - 32) {
				actor.x -= walk_speed
			} else {
				image_speed = 0
				image_index = 0
				i ++ // Increment Index
			}
				
		} else if move_list[i] == "R" {
			actor.sprite_index = actor.lr_sprite
			actor.image_xscale = -1
			
			// Increment X coord
			if actor.x < (old_x + 32) {
				actor.x += walk_speed
			} else {
				image_speed = 0
				image_index = 0
				i ++ // Increment Index
			}
			
		} else if move_list[i] == "U" {
			actor.sprite_index = actor.up_sprite
			
			// Decrement Y coord
			if actor.y > (old_y - 32) {
				actor.y -= walk_speed
			} else {
				image_speed = 0
				image_index = 0
				i ++ // Increment Index
			}
		} else if move_list[i] == "D" {
			actor.sprite_index = actor.dn_sprite
			
			// Increment Y coord
			if actor.y < (old_y + 32) {
				actor.y += walk_speed
			} else {
				image_speed = 0
				image_index = 0
				i ++ // Increment Index
			}
		}
	}
	
	if i >= array_length(move_list) {
		global.immobile = false
		if destroy_after { instance_destroy(actor) }
	}
}