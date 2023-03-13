/// @description step

global.immobile = true

if instance_number(obj_messagebox) == 0 {
	room_goto(rm_docks_new_ext)
	global.immobile = false
	obj_player.visible = true
	instance_destroy(self)
}