/// @description React to Display Changes

if current_display == "Attacking" {
	image_index = 1
	if turn == "None" && turn_counter <= max_turns {
		battle_text = ["", "", ""]
		if alarm[0] == -1 {
			turn_counter += 1
		
			//show_message("Turn: " + turn)
			//show_message("Unmoved: " + string(unmoved_actors))
			
			turn = combat_next_id()
			//show_message("Turn: " + turn)
		
			exit
		}
	}
	
	if turn_counter >= max_turns {
		restore_sp(global.max_sp * 0.05) // Restore 5% of SP Per turn
		restore_mp(global.max_mp * 0.05) // Restore 5% of MP Per turn
		
		current_display = "Default"
	}
} else {
	image_index = 0
}