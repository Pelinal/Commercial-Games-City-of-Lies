/// @description required for Scene Movement

if moving {
	image_speed = 0.4
	if scene_actor_move(id, move_list[move_i], move_x, move_y) {
		move_i ++ // Increment move
		move_x = x
		move_y = y
	}
	
	if move_i >= array_length(move_list) {
		moving = false
		move_list = []
		move_i = -1
		alarm[0] = -1
		
		image_speed = 0
		image_index = 0
	}
	alarm[0] = 1
}