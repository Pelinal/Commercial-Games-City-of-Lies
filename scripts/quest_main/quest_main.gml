/// @description quest_main

function quest_initialise(){
	/// Initialise the global quest lists
	
	// 0: Active (bool), 1: Complete (bool), 2: Tracked (bool)
	global.quests[0] = [true, false, false] // First Main Quest
	global.quests[1] = [false, false, false] // Second Main Quest
	global.quests[2] = [false, false, false] // Side Chain 1 pt 1 - Murder Investigation (Speak to witnesses, Investigate body, meet detective, go to hideout to plan, sleep there, attacked in sleep!, they get away)
	global.quests[3] = [false, false, false] // Side Chain 1 pt 2 - Murder Investigation (Go to the place where the next murder will take place, HIDE, stop the next murder, un-mask the killer. Its a ..... need a twist of some kind? Perhaps someone who helps u betrays you?)
	global.quests[4] = [false, false, false] // Side Chain 1 pt 3 - Murder Investigation (return to Geraud, report criminal to the Prefect, get paid, bid farewell to Geraud, for now)
	global.quests[5] = [false, false, false] // Side Chain 2 pt 1 - Rival Merchants ( Make this quest involve going to a ruin somehow)
	global.quests[6] = [false, false, false] // Side Chain 2 pt 2 - Rival Merchants
	
	// 0: Name, 1: Type, 2: Desc, 3: Quest Giver, 4: Location, 5: Reward(s), 6: Objectives
	global.quest_library[0] = ["The Newcomer", "Main", "You have arrived in The Capital, following a rumour that your family once lived here, ask around the port for clues.", "None", "Docklands",
														[[112, 400]], ["Speak to the Harbourmaster", "Ask Around the Port", "Speak to Prefect Carus", "Speak to Meriaas", "Blackmail the Prefect", "Clear Warehouse 3", "Return to Meriaas", "Find Blackmail Evidence", "Go to Derelict Building", "Defend Yourself!"]]
														
	global.quest_library[1] = ["The Syndicate", "Main", "You have been betrayed! The location Carus gave you was a trap and now you have been imprisoned.", "None", "Docklands", 
														[[112, 600]], ["Talk to Cellmate", "Escape!", "Speak to 'Friend'", "Gather Copper Ore ("+ string(inventory_fetch(9)) + "/3)", "Return to Erasmus", "Craft Weapon", "Find a Rope", "Return to Erasmus", "Go to the Surface"]]
	global.quest_library[2] = ["Foreign Aid", "Side",  "The inkeep spoke of murders occurring in Docklands recently. The killer appears to target foreigners and the Prefect has done nothing to deal with the criminal. You should find the detective in his home on the promenade and help investigate.", "Bertram", "Docklands", 
														[[112, 300]], ["Speak with the Detective", "Speak to Witnesses", "Inspect the Body", "Speak with Geraud", "Go to Geraud's House", "Speak to Geraud", "Inspect the Board", "Sleep", "Defend Yourself!", "Speak to Geraud"]]
	
	global.quest_library[3] = ["Ruins of Pontastra", "Side", "You and Mattias have discovered a buried Founder ruin in the cave system below the Promenade. Perhaps there is hidden treasure to be found in there?", "Mattias", "Docklands", 
														[[112, 400]], ["Find the Hidden Treasure"]]
	global.quest_library[4] = ["Fatal Romance", "Side", "I spoke with a woman, Erika, on the Promenade who claimed her fiancé had been keeping secrets from her and that it may affect their upcoming marriage. If I can find him and figure out what he's been hiding maybe I can confirm her suspicions, or reassure her? ", "Erika Weisse", "Docklands", [[112, 200]], ["Find Erika's Fiancé", "Return to Erika"]]
	global.quest_library[5] = ["Warm Welcome", "Main", "DESCRIPTION.", "QUEST_GIVER", "Docklands", [[112, 100]], ["OBJECTIVES."]]
	global.quest_library[6] = ["Warm Welcome", "Main", "DESCRIPTION.", "QUEST_GIVER", "Docklands", [[112, 100]], ["OBJECTIVES."]]
	
	// 3D Array (index = quest id, 1st list = visibility, 2nd list = complete/yea/nay)
	global.quest_objectives[0] = [[true, false, false, false, false, false, false, false, false, false], [false, false, false, false, false, false, false, false, false, false]]
	global.quest_objectives[1] = [[true, false, false, false, false, false, false, false, false], [false, false, false, false, false, false, false, false, false]]
	global.quest_objectives[2] = [[false, false, false, false, false, false, false, false, false, false], [false, false, false, false, false, false, false, false, false, false]]
	global.quest_objectives[3] = [[true], [false]]
	global.quest_objectives[4] = [[true, false], [false, false]]
	global.quest_objectives[5] = [[true], [false]]
	global.quest_objectives[6] = [[true], [false]]
}

function quest_populate(category) {
	// Populate quest list
	instance_destroy(obj_quest_tab)
	
	// Create Tab Buttons
	with instance_create(obj_questlog.x + 32, obj_questlog.y + 24, obj_quest_tab) {
		if dir == -1 { 
			dir = "left"
		}
	}
	with instance_create(obj_questlog.x + 398, obj_questlog.y + 24, obj_quest_tab) {
		if dir == -1 {
			dir = "right"
		}
	}
	
	// Create List Buttons
	with obj_questlog {
		pop_list = []
		for (i = 0; i < array_length(global.quest_library); i ++) {
			if category != "Completed" {	
				if global.quest_library[i][1] == category && quest_active(i) {
					array_push(pop_list, i) // Creates list of active quest ids of specified category
				}
			} else {
				if global.quests[i][1] {
					array_push(pop_list, i) // Creates list of completed quest ids 
				}
			}
		}
		
		x_margin = obj_questlog.x + 24
		y_margin = obj_questlog.y + 120
	
		for (i = 0; i < array_length(pop_list); i ++) {
			with instance_create(x_margin, y_margin, obj_quest_button) {
				quest_id = obj_questlog.pop_list[obj_questlog.i]
			}
		
			y_margin += 78
		}
	}
	
	if instance_number(obj_quest_button) > 11 {
		obj_questlog.scroll = true
	}
}

/// Quest related actions 

function quest_add(quest_id) {
	// Sets quest to active and resets all objectives
	global.quests[quest_id][0] = true
	//
	global.quests[quest_id][1] = false
	
	message_notification("Started Quest: " + global.quest_library[quest_id][0] + " (J to view)")
}

function quest_track(quest_id) {
	// Track a quest 
	for (i = 0; i < array_length(global.quests); i ++) {
		if global.quests[i][2] == true {
			if i == quest_id { global.quests[i][2] = false } // If the specified quests is tracked, untrack it
			else { global.quests[i][2] = false }	// If it is not the specified quest, untrack it
		} else {
			if i == quest_id { global.quests[i][2] = true } // Track specified quest
		}
	}
}

function quest_complete(quest_id) {
	// Forcibly complete a quest, and add all rewards to inventory
	global.quests[quest_id][0] = false // Deactivate quest
	global.quests[quest_id][1] = true // Set to complete
	global.quests[quest_id][2] = false // stop tracking
	
	global.quest_library[quest_id][1] = "Completed"
	
	//quest_complete_all_objectives(quest_id)
	
	for (i = 0; i < array_length(global.quest_library[quest_id][5]); i++) {
		// if global.quest_library[quest_id][5][i][0] != whatever the ID for EXP pseudoitem will be 
		inventory_add(global.quest_library[quest_id][5][i][0], global.quest_library[quest_id][5][i][1])
	}
	
	obj_quest_tracker.visible = false
	
	message_notification("Completed Quest: " + global.quest_library[quest_id][0])
}

function quest_abandon(quest_id) {
	// Abandon a quest and reset its objectives
	global.quests[quest_id][0] = false
	global.quests[quest_id][2] = false
	
	quest_reset_all_objectives(quest_id)
	message_notification("Abandoned Quest: " + global.quest_library[quest_id][0])
}

/// Objective related actions

function quest_complete_objective(quest_id, objective_id) {
	// Sets specified quest objective to complete
	global.quest_objectives[quest_id][1][objective_id] = true
	message_notification("Updated Quest: " + global.quest_library[quest_id][0] + " (J to view)")
}

function quest_complete_all_objectives(quest_id) {
	for (i = 0; i < array_length(global.quest_objectives[quest_id][1]); i ++) {
		global.quest_objectives[quest_id][1][i] = true // Set all to complete
		global.quest_objectives[quest_id][0][i] = true // Set all to visible
	}
	message_notification("Updated Quest: " + global.quest_library[quest_id][0] + " (J to view)")
}

function quest_reset_all_objectives(quest_id) {
	for (i = 0; i < array_length(global.quest_objectives[quest_id][1]); i ++) {
		global.quest_objectives[quest_id][1][i] = false // Set all to incomplete
		global.quest_objectives[quest_id][0][i] = false // Set all to invisible
	}
}

function quest_change_desc(quest_id, new_desc) {
	global.quest_library[quest_id][2] = new_desc
}
function quest_change_objective(quest_id, objective, new_text) {
	global.quest_library[quest_id][6][objective] = new_text
}

function quest_show_objective(quest_id, objective_id) {
	global.quest_objectives[quest_id][0][objective_id] = true
}
function quest_hide_objective(quest_id, objective_id) {
	global.quest_objectives[quest_id][0][objective_id] = false
}

/// For checking values

function quest_active(quest_id) {
	// Returns whether or not a quest is active
	if global.quests[quest_id][0] == true {
		return true
	} else {
		return false
	}
}

function quest_tracked(quest_id) {
	// Returns whether or not a quest is tracked
	if global.quests[quest_id][2] == true {
		return true
	} else {
		return false
	}
}

function quest_tracked_id() {
	// Returns ID of currently tracked quest
	for (i = 0; i < array_length(global.quests); i ++) {
		if global.quests[i][2] == true {
			return i
			break
		}
	}
	
	return noone
}

function quest_completed(quest_id) {
	// Returns whether or not a quest is complete
	if global.quests[quest_id][1] == true {
		return true
	} else {
		return false
	}
}

function quest_objective_is_complete(quest_id, objective_id) {
	// Checks if a specified quest objective is complete
	if global.quest_objectives[quest_id][1][objective_id] == true {
		return true
	} else {
		return false	
	}
}

function quest_objective_is_visible(quest_id, objective_id) {
	// Checks if a specified quest objective is visible
	if global.quest_objectives[quest_id][0][objective_id] == true {
		return true
	} else {
		return false	
	}
}