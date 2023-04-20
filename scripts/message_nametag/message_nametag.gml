/// @description message_nametag(name_list, batch)
/// @param NameList
/// @param BatchAmount
function message_nametag(argument0, argument1) {
	// Script used to enable display of Nametags on textboxes

	name_list = argument0
	batch = argument1       // -1 means no batch
	
	instance_create((__view_get( e__VW.XView, 0 )+427)-159, (__view_get( e__VW.YView, 0 )+388)-22, obj_nametag) { // CHARACTER LIMIT for 1 line: 50-51 characters
	    obj_nametag.name_list = name_list
	    obj_nametag.batch = batch-1
	}
	
	obj_nametag.batch_counter = 0

}
