/// @description Open the Chest
loot = global.chests[chests_id]
if array_length(loot) == 0 {
	image_index = image_number-1
	open = true
	empty = true
	opening = false
}

if(distance_to_object(obj_player)) <= 32 {
    if keyboard_check(vk_space) && !opening && !open && !empty && global.chests[chests_id] != [] {
        image_speed = 0.4
        opening = true
    }
}

if (image_index >= image_number-1 && !open) && !gatherable {
    opening = false
    image_speed = 0
	
	global.immobile = true
	
	instance_create(x + 32, y - 80, obj_loot_menu)
	obj_loot_menu.loot = loot
	obj_loot_menu.chest_id = id
	
	with obj_loot_menu {
		// Create buttons
		x_margin = obj_loot_menu.x + 8
		y_margin = obj_loot_menu.y + 8
		for (i = 0; i < array_length(loot); i ++) {
			with instance_create(x_margin, y_margin, obj_loot_button) {
				if loot == -1 {	
					loot = obj_loot_menu.loot[obj_loot_menu.i][0] 
					amount = obj_loot_menu.loot[obj_loot_menu.i][1]
					loot_index = obj_loot_menu.i
				}
			}
			y_margin += 24
		}
		with instance_create(obj_loot_menu.x+93, obj_loot_menu.y+131, obj_loot_takeall) {
			loot = obj_loot_menu.loot
		}
	}
	open = true
}
else if gatherable && opening {
	opening = false
    image_speed = 0
	
	global.immobile = true
	
	var loot_menu = instance_create(x + 32, y - 80, obj_loot_menu)
	loot_menu.loot = loot
	loot_menu.chest_id = id
	
	with obj_loot_menu {
		// Create buttons
		x_margin = obj_loot_menu.x + 8
		y_margin = obj_loot_menu.y + 8
		for (i = 0; i < array_length(loot); i ++) {
			with instance_create(x_margin, y_margin, obj_loot_button) {
				if loot == -1 {	
					loot = obj_loot_menu.loot[obj_loot_menu.i][0] 
					amount = obj_loot_menu.loot[obj_loot_menu.i][1]
					loot_index = obj_loot_menu.i
				}
			}
			y_margin += 24
		}
		with instance_create(obj_loot_menu.x+93, obj_loot_menu.y+131, obj_loot_takeall) {
			loot = obj_loot_menu.loot
		}
	}
	
	open = true
}

if !empty && open && instance_number(obj_loot_menu) == 0 {
	open = false
}

if empty  {
	image_index = image_number-1
	open = true
	opening = false
	loot = []
} 