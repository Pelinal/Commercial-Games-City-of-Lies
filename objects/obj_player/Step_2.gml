/// @description UpdatePing

if global.class == "warrior" {
	repeat(global.level) {
		global.base_atk = round(12 * 1.1)
		global.base_def = round(12 * 1.1)
		global.base_stk = round(5 * 1.1)
		global.base_sdf = round(5 * 1.1)
		global.base_mtk = round(3 * 1.1)
		global.base_mdf = round(3 * 1.1)
	}
} else if global.class == "rogue" {
	repeat(global.level) {
		global.base_atk = round(5 * 1.1)
		global.base_def = round(7 * 1.1)
		global.base_stk = round(10 * 1.1)
		global.base_sdf = round(10 * 1.1)
		global.base_mtk = round(5 * 1.1)
		global.base_mdf = round(5 * 1.1)
	}
} else if global.class == "mage" {
	repeat(global.level) {
		global.base_atk = round(7 * 1.1)
		global.base_def = round(5 * 1.1)
		global.base_stk = round(7 * 1.1)
		global.base_sdf = round(7 * 1.1)
		global.base_mtk = round(10 * 1.1)
		global.base_mdf = round(10 * 1.1)
	}
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