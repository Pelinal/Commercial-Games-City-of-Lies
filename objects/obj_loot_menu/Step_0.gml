/// @description Insert description here
// You can write your code in this editor

if chest_id.empty && chest_id.gatherable {
	instance_destroy(obj_loot_takeall) 
	instance_destroy(obj_loot_button)
	instance_destroy(self)
	global.immobile = false
}

if (chest_id == noone || array_length(global.chests[chest_id.chests_id]) == 0 || chest_id.empty) && !chest_id.gatherable {
	instance_destroy(obj_loot_takeall) 
	instance_destroy(obj_loot_button)
	instance_destroy(self)
	global.immobile = false
} else {
	if instance_number(obj_loot_button) == 0 {
		chest_id.open = false
		chest_id.empty = true
		global.immobile = false
		
		instance_destroy(obj_loot_takeall) 
		instance_destroy(obj_loot_button)
		instance_destroy(self)
		
		// for future ref: MAKE LOOT LIST SOLEY BE STORED IN CHEST AND USE ID, TO MAKE THEM RE-OPENABLE WITHOUT RESETTING
		
	}
}

if keyboard_check_pressed(vk_escape) {
	show_debug_message("ESCAPE CHEST PRESS")
	chest_id.open = false
	chest_id.image_index = 0
	chest_id.image_speed = 0
	global.immobile = false
	instance_destroy(obj_loot_takeall) 
	instance_destroy(obj_loot_button)
	instance_destroy(obj_loot_menu)
	
}

