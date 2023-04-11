// Will most likely be considerably larger, checks to see if player meets certain requirements for quest objectives.

function quest_checks(){
	
	// MQ01 - "The Newcomer"
	if quest_active(0) {
		if inventory_fetch(113) > 0 && !quest_objective_is_complete(0, 7) {
			// Compromising Letter Check
			quest_complete_objective(0, 7)
			quest_show_objective(0, 4)
		}
	}
	
	// MQ02 - "The Syndicate"
	
}