/// @description inventory_consumables

function inventory_consumable_initialise() {
	// Create Item Library // ID corresponds with Index
	// Index 0: ID, Index 1: Effect, Index 2: Effect Value, Index 3: Price
	global.c_library[0] = [72, "Restore Health", 30, 100]				// 30 HP Potion
	global.c_library[1] = [33, "Restore Stamina", 5, 20]				// Carrot
	global.c_library[2] = [34, "Restore Stamina", 5, 20]				// Onion
	global.c_library[3] = [35, "Restore Health", 5, 20]					// Potato
	global.c_library[4] = [36, "Restore Health", 15, 60]				// Raw Meat
	global.c_library[5] = [37, "Restore Health", 15, 60]				// Fish
	global.c_library[6] = [38, "Restore Stamina", 10, 20]				// Mushroom
	global.c_library[7] = [39, "Restore Stamina", 10, 20]				// Orange
	global.c_library[8] = [40, "Restore Stamina", 5, 20]				// Grapes
	global.c_library[9] = [41, "Restore Health", 10, 20]				// Apple
	global.c_library[10] = [42, "Restore Health", 25, 40]				// Bread
	global.c_library[11] = [43, "Restore Stamina", 10, 30]				// Egg
	global.c_library[12] = [44, "Restore Health", 10, 30]				// Cheese
	global.c_library[13] = [45, "Restore Mana", 10, 30]					// Blueberry
	global.c_library[14] = [46, "Restore Stamina", 5, 20]				// Cherry
	global.c_library[15] = [47, "Damage Health", 10, 30]				// Salt
	global.c_library[16] = [48, "None", 0, 30]							// Flour
	global.c_library[17] = [49, "Damage Stamina", 30, 120]				// Wine
	global.c_library[18] = [50, "Restore Health", 5, 20]				// Tomato
	global.c_library[19] = [51, "Loopy Shroom Effect", 1, 100]			// Loopy Shroom
	global.c_library[20] = [53, "Restore Health and Stamina", 20, 40]	// Water
	global.c_library[21] = [54, "Damage Stamina", 50, 80]				// Whiskey
	global.c_library[22] = [57, "Rope Effect", 1, 100]					// Rope
	// Items Added w/ crafting
	global.c_library[23] = [73, "Restore Stamina", 30, 100]		// 30 SP Potion
	global.c_library[24] = [74, "Restore Mana", 30, 100]		// 30 MP Potion
	global.c_library[25] = [75, "Buff Endurance", 30, 150]		// Hearty Tonic
	global.c_library[26] = [76, "Buff Dexterity", 30, 150]		// Cunning Tonic
	global.c_library[27] = [77, "Buff Intelligence", 30, 150]	// Sage Tonic
	global.c_library[28] = [78, "Buff Speed", 30, 150]			// Agile Tonic
	global.c_library[29] = [118, "Instant Death", 9999, 0]		// Cyanide
	// Last Additions?
	global.c_library[30] = [120, "Skill: Cleave", 1, 100]		// Training Book (N)
	global.c_library[31] = [121, "Skill: Low Kick", 1, 125]		// Training Book (N)
	global.c_library[32] = [122, "Skill: Hemorrhage", 1, 200]	// Training Book (N)
	global.c_library[33] = [123, "Skill: Fury", 1, 100]		    // Training Book (S)
	global.c_library[34] = [124, "Skill: Quickdraw", 1, 75]		// Training Book (S)
	global.c_library[35] = [125, "Skill: Feint", 1, 150]		// Training Book (S)
	global.c_library[36] = [126, "Skill: Ice Spike", 1, 125]		// Training Book (M)
	global.c_library[37] = [127, "Skill: Acid Bomb", 1, 125]		// Training Book (M)
	global.c_library[38] = [128, "Skill: Great Healing", 1, 250]	// Training Book (M)
}

function inventory_consumable_add(item, amount) {
	// Adds the specified amount of a Consumable
	owned = false
	for (i = 0; i < array_length(global.consumables); i ++) {
		if global.consumables[i][0] == item {
			global.consumables[i][1] += amount
			owned = true
			break
		}
	}
	
	if !owned {
		array_push(global.consumables, [item, amount])
	}
}

function inventory_consumable_remove(item, amount) {
	// Removes the specified amount of a Consumable
	for (i = 0; i < array_length(global.consumables); i ++) {
		if global.consumables[i][0] == item {
			global.consumables[i][1] -= amount
			
			if global.consumables[i][1] <= 0 { array_delete(global.consumables, i, 1) }
			break
		}
	}
}

function inventory_consumable_delete(item) { 
	// Deletes a record from Consumables
	for (i = 0; i < array_length(global.consumables); i ++) {
		if global.consumables[i][0] == item {
			array_delete(global.consumables, i, 1)
			break
		}
	}
}

/// Unique Functions ///
function inventory_consumable_use(item) {
	// Use a Consumable and apply corresponding effect
	var item_effect, item_effect_value
	for (i = 0; i < array_length(global.c_library); i ++) {
		if global.c_library[i][0] == item {
			item_effect = global.c_library[i][1]
			item_effect_value = global.c_library[i][2]
			break
		}
	}
	
	switch item_effect {
		case "Restore Health":
			global.hp += item_effect_value
			if global.hp > global.max_hp { global.hp = global.max_hp }
			break
		case "Damage Health":
			global.hp -= item_effect_value
			if global.hp < 0 { global.hp = 0 }
			break
		case "Restore Mana":
			global.mp += item_effect_value
			if global.mp > global.max_mp { global.mp = global.max_mp }
			break
		case "Damage Mana":
			global.mp -= item_effect_value
			if global.mp < 0 { global.mp = 0 }
			break
		case "Restore Stamina":
			global.sp += item_effect_value
			if global.sp > global.max_sp { global.sp = global.max_sp }
			break
		case "Damage Stamina":
			global.sp -= item_effect_value
			if global.sp < 0 { global.sp = 0 }
			break
		case "Restore Health and Stamina":
			global.sp += item_effect_value
			global.hp += item_effect_value
			if global.sp > global.max_sp { global.sp = global.max_sp }
			if global.hp > global.max_hp { global.hp = global.max_hp }
			break
		case "Restore Health and Mana":
			global.mp += item_effect_value
			global.hp += item_effect_value
			if global.mp > global.max_mp { global.mp = global.max_mp }
			if global.hp > global.max_hp { global.hp = global.max_hp }
			break
		case "Restore Mana and Stamina":
			global.mp += item_effect_value
			global.sp += item_effect_value
			if global.mp > global.max_mp { global.mp = global.max_mp }
			if global.sp > global.max_sp { global.sp = global.max_sp }
			break
		case "Restore all Attributes":
			global.mp += item_effect_value
			global.sp += item_effect_value
			global.hp += item_effect_value
			if global.mp > global.max_mp { global.mp = global.max_mp }
			if global.sp > global.max_sp { global.sp = global.max_sp }
			if global.hp > global.max_hp { global.hp = global.max_hp }
			break
		case "Loopy Shroom Effect":
			// TBA - Will temporarily change shaders to random colours
			break
		case "Rope Effect":
			// TBA - Used to escape dungeons
			break
		case "None":
			// Does nothing
			break
		case "Instant Death":
			// Instantly kills the player
			global.hp = 0
			if instance_number(obj_combatmenu) == 0 { find_nearest_inn() }
			break
		case "Skill: Cleave" :
			if global.blade >= 5 {
				add_skill("N", 4)
				message_notification("Skill Added: Cleave")
			} else {
				inventory_add(item, 1)
				message_notification("Can't Use: Blade Lv.5 Required")
			}
			break
		case "Skill: Low Kick" :
			if global.blade >= 5 {
				add_skill("N", 1)
				message_notification("Skill Added: Low Kick")
			} else {
				inventory_add(item, 1)
				message_notification("Can't Use: Blade Lv.5 Required")
			}
			break
		case "Skill: Hemorrhage" :
			if global.blade >= 7 {
				add_skill("N", 7)
				message_notification("Skill Added: Hemorrhage")
			} else {
				inventory_add(item, 1)
				message_notification("Can't Use: Blade Lv.7 Required")
			}
			break
		case "Skill: Fury" :
			if global.blade >= 5 {
				add_skill("S", 1)
				message_notification("Skill Added: Fury")
			} else {
				inventory_add(item, 1)
				message_notification("Can't Use: Blade Lv.5 Required")
			}
			break
		case "Skill: Quickdraw" :
			if global.archery >= 3 {
				add_skill("S", 2)
				message_notification("Skill Added: Quickdraw")
			} else {
				inventory_add(item, 1)
				message_notification("Can't Use: Archery Lv.3 Required")
			}
			break
		case "Skill: Feint" :
			if global.blade >= 7 {
				add_skill("S", 3)
				message_notification("Skill Added: Feint")
			} else {
				inventory_add(item, 1)
				message_notification("Can't Use: Blade Lv.7 Required")
			}
			break
		case "Skill: Ice Spike" :
			if global.staves >= 5 {
				add_skill("M", 1)
				message_notification("Skill Added: Ice Spike")
			} else {
				inventory_add(item, 1)
				message_notification("Can't Use: Staves Lv.5 Required")
			}
			break
		case "Skill: Acid Bomb" :
			if global.staves >= 5 {
				add_skill("M", 2)
				message_notification("Skill Added: Acid Bomb")
			} else {
				inventory_add(item, 1)
				message_notification("Can't Use: Staves Lv.5 Required")
			}
			break
		case "Skill: Great Healing":
			if global.staves >= 6 {
				add_skill("M", 7)
				message_notification("Skill Added: Great Healing")
			} else {
				inventory_add(item, 1)
				message_notification("Can't Use: Staves Lv.6 Required")
			}
			break
		
		default:
			break
	}
}