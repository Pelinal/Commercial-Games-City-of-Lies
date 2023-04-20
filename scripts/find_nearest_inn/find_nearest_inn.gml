// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function find_nearest_inn(){
	// Locatest the nearest possible inn and sends you there
	
	obj_player.prev_battle = noone
	global.hp = global.max_hp
	global.sp = global.max_sp
	global.mp = global.max_mp
	
	var inn_room, bed_x, bed_y
	switch room {
		case rm_docks_new_ext:
			inn_room = rm_docks_promenade_inn_gf
			break
		case rm_docks_promenade_ext:
			inn_room = rm_docks_promenade_inn_gf
			break
		case rm_docks_south_ext:
			inn_room = rm_docks_promenade_inn_gf
			break
		case rm_docks_south_warehouse_03:
			inn_room = rm_docks_promenade_inn_gf
			break
		case rm_docks_promenade_manor_cave:
			inn_room = rm_docks_promenade_manor_cave
			break
		default:
			break
	}
	
	switch inn_room {
		case rm_docks_promenade_inn_gf:
			bed_x = 332
			bed_y = 400
			break
		case rm_docks_promenade_manor_cave:
			bed_x = 1040
			bed_y = 240
			break
		default:
			bed_x = inn_room.room_width / 2
			bed_y = inn_room.room_height / 2
			break
	}
	
	obj_player.x = bed_x
	obj_player.y = bed_y
	room_goto(inn_room)
}