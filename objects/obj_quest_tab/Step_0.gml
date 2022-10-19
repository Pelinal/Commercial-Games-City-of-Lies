/// @description Insert description here
// You can write your code in this editor


if position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id) {
	// Check for Mouse Enter
	if dir == "left" { image_index = 1 } else { image_index = 3 }
	
	if mouse_check_button_pressed(mb_left) {
		// Check for Mouse Left Pressed
		
		obj_questlog.overview_id = -1
		instance_destroy(obj_quest_button)
		
		if dir == "left" {
			// If Left
			
			switch obj_questlog.current_tab {
				case "Main":
					obj_questlog.current_tab = "Completed"
					break
				case "Side":
					obj_questlog.current_tab = "Main"
					break
				case "Bounties":
					obj_questlog.current_tab = "Side"
					break
				case "Faction":
					obj_questlog.current_tab = "Bounties"
					break
				case "Completed":
					obj_questlog.current_tab = "Faction"
					break
			}
		}
		else if dir == "right" {
			// If Right
			
			switch obj_questlog.current_tab {
				case "Main":
					obj_questlog.current_tab = "Side"
					break
				case "Side":
					obj_questlog.current_tab = "Bounties"
					break
				case "Bounties":
					obj_questlog.current_tab = "Faction"
					break
				case "Faction":
					obj_questlog.current_tab = "Completed"
					break
				case "Completed":
					obj_questlog.current_tab = "Main"
					break
			}
		}
		
		with obj_questlog { quest_populate(current_tab) }
	}
} else {
	if dir == "left" { image_index = 0 } else { image_index = 2 }
}