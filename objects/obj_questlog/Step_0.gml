/// @description React to Input, etc.
if room != rm_setup {
	if keyboard_check(ord("J")) && !visible && !global.immobile {
		x = 48 
		y = 120
	
		obj_quest_tracker.visible = false
		global.immobile = true
		quest_populate(current_tab)
		visible = true
	}

	if keyboard_check_pressed(vk_escape) && visible {
		visible = false
		global.immobile = false
		obj_questlog.overview_id = -1
	
		if quest_tracked_id() >= 0 {
			obj_quest_tracker.visible = true
		}
	
		instance_destroy(obj_quest_tab)
		instance_destroy(obj_quest_button)
		instance_destroy(obj_dropdown)
	}
}