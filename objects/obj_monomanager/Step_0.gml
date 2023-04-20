/// @description Insert description here
// You can write your code in this editor

if monoliths[0] != noone && monoliths[1] == noone && monoliths[2] == noone {
	// If one monolith is active
	if monoliths[0].char_name == monolith_order[0] {
		// It's correct
		//audio_play_sound(se_correct, 50, 0)
		
		//monoliths[0].choice_result = "MonoCorrect"
		
		//message(["An affirming sound is heard. "], 1)
	} else {
		// It's false
		audio_play_sound(se_incorrect, 50, 0)
		
		monoliths[0].choice_result = "AutomatonBattle"
		
		monoliths = [noone, noone , noone]
		
		message(["Wrong! An enemy has appeared! "], 1)
	}
} else if monoliths[0] != noone && monoliths[1] != noone && monoliths[2] == noone {
	// If two monoliths are active
	if monoliths[0].char_name == monolith_order[0] {
		if monoliths[1].char_name == monolith_order[1] {
			// It's correct
			//monoliths[0].choice_result = "MonoCorrect"
		
			//message(["An affirming sound is heard. "], 1)
		} else {
			// It's false
			audio_play_sound(se_incorrect, 50, 0)
			
			monoliths[1].choice_result = "AutomatonBattle"
			
			monoliths = [noone, noone , noone]
		
			message(["Wrong! An enemy has appeared! "], 1)
		}
	}
} 

if monoliths[0] != noone && monoliths[1] != noone && monoliths[2] != noone {
	// If all monoliths are active
	// It's correct
	audio_play_sound(se_correct, 50, 0)
	add_xp(150)
	quest_show_objective(3, 2) // Claim the Treasure?
	quest_complete_objective(3, 1)
	quest_change_desc(3, "I have successfully solved the monolith puzzle, the door to the east room should now be open. ")
	instance_destroy(self)
}


if quest_objective_is_complete(3, 2) {
	with obj_npc_stationary {
		if char_type == "Monolith" {
			instance_destroy(self)
		}
	}
	instance_destroy(self)
}