area_notification("Entering: Warehouse No.2, 'The Backdoor'")
global.ambientShadowIntensity = 0.9 // Nighttime

if instance_number(obj_messagebox) == 0 && quest_active(1) && quest_objective_is_visible(1, 8) && !quest_objective_is_complete(1, 8) {
	// Finish the final Main Quest for the demo
	quest_change_desc(1, "I have returned to the surface. I appear to be inside a covert base of sorts, I should speak with the Syndicate's boss here. ")
	quest_complete(1)
	
	var temp_text = []
	temp_text[0] = string_wordwrap_width("Thank you for playing the game, this is the final Main Quest you can do in this demo. However, from here you can return to the other areas of the game where there are 3 more side quests waiting to be completed, enjoy! ", 442, "\n")
	
	message(temp_text, 1)
}