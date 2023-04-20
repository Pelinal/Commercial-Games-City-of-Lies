/// @description Insert description here
// You can write your code in this editor

if(distance_to_object(obj_player)) <= 32 {
	if keyboard_check_pressed(vk_space) {
		// Pick up codex
		
		quest_complete_objective(3, 2)
		quest_show_objective(3, 3)
		quest_change_desc(3, "I have retrieved some sort of inscribed codex, I feel like I understand what it has to say but I cannot fully read it. I should show it to Mattia. ")
		if inventory_fetch(117) < 1 { inventory_add(117, 1) }
		instance_destroy(self)
	}
}





