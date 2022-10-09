/// @description Insert description here
// You can write your code in this editor


if instance_number(obj_loot_button) == 0 {
	instance_destroy(obj_loot_takeall) 
	instance_destroy(obj_loot_button)
	global.gold += gold
	instance_destroy(self)
	global.immobile = false
}