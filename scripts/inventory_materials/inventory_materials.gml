/// @description inventory_materials

function inventory_material_initialise() {
	// Create Material Library // ID corresponds with Index
	// Index 0: ID, Index 1: Type, Index 2: Price
	global.m_library[0] = [9, "Smithing", 50] // Copper Ore
	global.m_library[1] = [10, "Alchemy", 50] // Capitolina Prima
	global.m_library[2] = [11, "Enchanting", 100] // Impure Solite
	global.m_library[3] = [12, "Alchemy", 50] // Clover
	global.m_library[4] = [13, "Alchemy", 30] // Thickthistle
	global.m_library[5] = [14, "Alchemy", 50] // Capitolina Secunda
	global.m_library[6] = [15, "Alchemy", 80] // Whitebulb
	global.m_library[7] = [16, "Alchemy", 30] // Nettle
	global.m_library[8] = [17, "Smithing", 80] // Iron Ore
	global.m_library[9] = [18, "Smithing", 120] // Corundum Ore
	global.m_library[10] = [19, "Smithing", 200] // Meteoric Ore
	global.m_library[11] = [20, "Smithing", 360] // Crystaline Ore
	global.m_library[12] = [21, "Smithing", 30] // Wood
	global.m_library[13] = [22, "Smithing", 50] // Leather
	global.m_library[14] = [23, "Enchanting", 200] // Solite Dust
	global.m_library[15] = [24, "Enchanting", 500] // Pure Solite
	global.m_library[16] = [25, "Enchanting", 1250] // Cerephelium
	global.m_library[17] = [26, "Enchanting", 150] // Emerald
	global.m_library[18] = [27, "Enchanting", 80] // Garnet
	global.m_library[19] = [28, "Enchanting", 225] // Glacial Ice
	global.m_library[20] = [29, "Enchanting", 300] // Ruby
	global.m_library[21] = [30, "Enchanting", 300] // Topaz
	global.m_library[22] = [31, "Enchanting", 100] // Coral
	global.m_library[23] = [32, "Enchanting", 400] // Gold Dust
	global.m_library[24] = [52, "Smithing", 30] // Cloth
	global.m_library[25] = [55, "Smithing", 60] // Wool
	global.m_library[26] = [56, "Smithing", 20] // Feather
	global.m_library[27] = [58, "Smithing", 600] // Gold Ingot
}

function inventory_material_add(item, amount) {
	// Adds the specified amount of a Material
	owned = false
	for (i = 0; i < array_length(global.materials); i ++) {
		if global.materials[i][0] == item {
			global.materials[i][1] += amount
			owned = true
			break
		}
	}
	
	if !owned {
		array_push(global.materials, [item, amount])
	}
}

function inventory_material_remove(item, amount) {
	// Removes the specified amount of a Material
	for (i = 0; i < array_length(global.materials); i ++) {
		if global.materials[i][0] == item {
			global.materials[i][1] -= amount
			
			if global.materials[i][1] <= 0 { array_delete(global.materials, i, 1) }
			break
		}
	}
}

function inventory_material_delete(item) { 
	// Deletes a record from Materials
	for (i = 0; i < array_length(global.materials); i ++) {
		if global.materials[i][0] == item {
			array_delete(global.materials, i, 1)
			break
		}
	}
}