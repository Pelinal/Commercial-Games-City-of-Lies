/// @description UpdatePing

if global.class == "warrior" {
	global.base_atk = round(12 * power(1.1, global.level))
	global.base_def = round(12 * power(1.1, global.level))
	global.base_stk = round(5 * power(1.1, global.level))
	global.base_sdf = round(5 * power(1.1, global.level))
	global.base_mtk = round(3 * power(1.1, global.level))
	global.base_mdf = round(3 * power(1.1, global.level))
	
	global.edr = round(6 * power(1.1, global.level))
	global.int = round(1 * power(1.1, global.level))
	global.dex = round(4 * power(1.1, global.level))
	global.spd = round(1 * power(1.1, global.level))
	global.luk = round(3 * power(1.1, global.level))
	
} else if global.class == "rogue" {
	global.base_atk = round(5 * power(1.1, global.level))
	global.base_def = round(7 * power(1.1, global.level))
	global.base_stk = round(10 * power(1.1, global.level))
	global.base_sdf = round(10 * power(1.1, global.level))
	global.base_mtk = round(5 * power(1.1, global.level))
	global.base_mdf = round(5 * power(1.1, global.level))
	
	global.edr = round(2 * power(1.1, global.level))
	global.int = round(1 * power(1.1, global.level))
	global.dex = round(5 * power(1.1, global.level))
	global.spd = round(4 * power(1.1, global.level))
	global.luk = round(5 * power(1.1, global.level))
	
} else if global.class == "mage" {
	global.base_atk = round(7 * power(1.1, global.level))
	global.base_def = round(5 * power(1.1, global.level))
	global.base_stk = round(7 * power(1.1, global.level))
	global.base_sdf = round(7 * power(1.1, global.level))
	global.base_mtk = round(10 * power(1.1, global.level))
	global.base_mdf = round(10 * power(1.1, global.level))
	
	global.edr = round(1 * power(1.1, global.level))
	global.int = round(5 * power(1.1, global.level))
	global.dex = round(3 * power(1.1, global.level))
	global.spd = round(3 * power(1.1, global.level))
	global.luk = round(1 * power(1.1, global.level))
}

if inventory_weapon_type(global.weapon_equipped) != "Staff" {
	global.atk = global.base_atk + inventory_weapon_get_damage(global.weapon_equipped)
} else {
	global.atk = global.base_atk + (inventory_weapon_get_damage(global.weapon_equipped) / 2)
}
global.def = global.base_def + inventory_armour_total_rating()
if global.class != "rogue" {
	global.stk = global.base_stk + round((inventory_weapon_get_damage(global.weapon_equipped)))
} else {
	global.stk = global.base_stk + round((inventory_weapon_get_damage(global.weapon_equipped) / 1.5 ))
}
global.sdf = global.base_sdf + round(inventory_armour_total_rating() / 1.5)
if inventory_weapon_type(global.weapon_equipped) != "Staff" {
	global.mtk = global.base_mtk + inventory_weapon_get_damage(global.weapon_equipped) / 2
} else {
	global.mtk = global.base_mtk + inventory_weapon_get_damage(global.weapon_equipped)
}
global.mdf = global.base_mdf + inventory_armour_total_rating() / 2

// Item Un-Hider
//with obj_chest {
//	if room == loc_room {
//		instance_activate_object(id)
//	}
//}

quest_checks()