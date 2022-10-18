/// @description quest_main

function quest_initialise(){
	/// Initialise the global quest lists
	
	// 0: Active (bool), 1: Current Objective, 2: Complete (bool), 3: Tracked (bool)
	global.quests[0] = [true, 0, false, false]
	
	// 0: Name, 1: Type, 2: Desc, 3: Quest Giver, 4: Location, 5: Reward(s), 6: Objectives
	global.quest_library[0] = ["Bob's Errand", "Side", "Bob has tasked you with recovering 2 herbs. Combine them with water to make a Health Potion and then return back to Bob.", "Bob", "Palace of Obedience", [72, 73], ["Craft a health potion", "Return health potion to Bob"]]
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
				if global.quests[i][2] {
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
		
			y_margin += 72
		}
	}
	
	if instance_number(obj_quest_button) > 11 {
		obj_questlog.scroll = true
	}
}

function quest_add(quest_id) {
	// Sets quest to active and its objective to the first one
	global.quests[quest_id][0] = true
	global.quests[quest_id][1] = 0
	global.quests[quest_id][2] = false
}

function quest_change_desc(quest_id, new_desc) {
	global.quest_library[quest_id][2] = new_desc
}
function quest_change_objective(quest_id, objective, new_text) {
	global.quest_library[quest_id][6][objective] = new_text
}

function quest_update(quest_id) {
	// Progresses the chosen quest
	if global.quests[quest_id][0] == true {
		// If Quest is Inactive or not yet complete, go to the next objective
		if global.quests[quest_id][1] == -1 || global.quests[quest_id][1] < array_length(global.quest_library[quest_id][6])-1 {
			global.quests[quest_id][1] += 1
		}
		// Complete the quest if on final objective
		else if global.quests[quest_id][1] >= array_length(global.quest_library[quest_id][6])-1 {
			global.quests[quest_id][1] = array_length(global.quest_library[quest_id][6])-1 // Ensure that it is set to the final objective
			global.quests[quest_id][2] = true
			global.quests[quest_id][0] = false
		}
	}
}

function quest_complete(quest_id) {
	// Forcibly complete a quest, regardless of current objective
	global.quests[quest_id][0] = false // Deactivate quest
	global.quests[quest_id][2] = true // Set to complete
}

function quest_abandon(quest_id) {
	// Abandon a quest and reset its objectives
	global.quests[quest_id][0] = false
	global.quests[quest_id][1] = -1 // -1 means no objectives will be shown
}

function quest_objective(quest_id) {
	// Returns current quest objective
	return global.quests[quest_id][1]
}

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
	if global.quests[quest_id][3] == true {
		return true
	} else {
		return false
	}
}

function quest_completed(quest_id) {
	// Returns whether or not a quest is complete
	if global.quests[quest_id][2] == true {
		return true
	} else {
		return false
	}
}