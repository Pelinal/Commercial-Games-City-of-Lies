/// @description inventory_materials

function inventory_material_initialise() {
	// Create Material Library // ID corresponds with Index
	// Index 0: ID, Index 1: Type, Index 2: Price
	global.m_library[0] = [9, "Smithing", 60] // Copper Ore
	global.m_library[1] = [10, "Alchemy", 40] // Capitolina Prima
	global.m_library[2] = [11, "Enchanting", 80] // Impure Solite
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