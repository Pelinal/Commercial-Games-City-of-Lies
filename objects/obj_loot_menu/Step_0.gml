/// @description Insert description here
// You can write your code in this editor


if instance_number(obj_loot_button) == 0 || keyboard_check_pressed(vk_escape) {
	instance_destroy(obj_loot_takeall) 
	instance_destroy(obj_loot_button)
	instance_destroy(self)
	global.immobile = false
}