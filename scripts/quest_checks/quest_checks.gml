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
	if quest_active(1) {
		if quest_objective_is_visible(1, 1) && !quest_objective_is_complete(1, 1) && room = rm_docks_promenade_manor_cave {
			quest_complete_objective(1, 1)
			quest_show_objective(1, 2)
			quest_change_desc(1, "I have successfully escaped from prison with the help of a 'friend' of Mattia's. I should speak to this friend and thank them.")
		}
		if quest_objective_is_visible(1, 3) && !quest_objective_is_complete(1, 3)  {
			quest_change_objective(1, 3, "Gather Copper Ore ("+ string(inventory_fetch(9)) + "/3)")
			if inventory_fetch(9) >= 3 {	
				// If you have collected enough Copper ore
				quest_complete_objective(1, 3)
				quest_show_objective(1, 4)
			}
		}
		if quest_objective_is_visible(1, 5) && !quest_objective_is_complete(1, 5) {
			// If you have a crafted bronze weapon
			if inventory_fetch(79) > 0 || inventory_fetch(80) > 0 || inventory_fetch(81) > 0 || inventory_fetch(115) > 0 {
				quest_complete_objective(1, 5)
				quest_show_objective(1, 6)
				quest_change_desc(1, "I have successfully crafted a new weapon, so now I must find a rope to fix the ladder and get out of here. Perhaps Erasmus or Mattia have clues about where I could look? ")
			}
		}
		if quest_objective_is_visible(1, 6) && !quest_objective_is_complete(1, 6) {
			if inventory_fetch(116) > 0 {
				quest_complete_objective(1, 6)
				quest_show_objective(1, 7)
				
				quest_change_desc(1, "I found an old rope near the entrance to a ruin. I should return to Erasmus so he can repair the ladder and we can get out of here!")
			}
		}
		
		if quest_objective_is_complete(1, 6) {
			with obj_door {
				if sprite_index == spr_fixed_ladder && image_alpha == 0 {
					image_alpha = 1
					condition = true
				}
			}
		}
	}
}