// Will most likely be considerably larger, checks to see if player meets certain requirements for quest objectives.

function quest_checks(){
	
	// Quest 0 TEST - Bob's Errand
	if quest_active(0) {
		if inventory_fetch(12) > 0 && !quest_objective_is_complete(0, 0) {
			// Capitolina Prima (1/1)
			quest_change_objective(0, 0, "Collect Capitolina Prima (1/1)")
			quest_complete_objective(0, 0)
		}
		if inventory_fetch(12) > 0 && !quest_objective_is_complete(0, 1) {
			// Clover (1/1)
			quest_change_objective(0, 1, "Collect Clover (1/1)")
			quest_complete_objective(0, 1)
		}
		if quest_objective_is_complete(0, 0) && quest_objective_is_complete(0, 1) && !quest_objective_is_visible(0, 2) {
			// Once both herbs are collected, tell player to return to Bob
			quest_show_objective(0, 2)
		}
	}
}