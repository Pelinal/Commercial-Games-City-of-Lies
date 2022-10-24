/// @description Insert description here
// You can write your code in this editor


if instance_number(obj_loot_button) == 0 || keyboard_check_pressed(vk_escape) {
	instance_destroy(obj_loot_takeall) 
	instance_destroy(obj_loot_button)
	instance_destroy(self)
	//chest_id.open = false
	// for future ref: MAKE LOOT LIST SOLEY BE STORED IN CHEST AND USE ID, TO MAKE THEM RE-OPENABLE WITHOUT RESETTING
	global.immobile = false
}