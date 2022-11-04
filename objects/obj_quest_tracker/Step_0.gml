/// @description Step

if obj_inventory.visible || obj_questlog.visible || obj_statsmenu.visible {
	visible = false
} else {
	visible = true
}

if quest_tracked_id() == noone {
	visible = false	
}