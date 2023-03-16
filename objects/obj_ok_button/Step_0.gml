/// @description Check mouse


if obj_setup.phase = 0 { visible = false }
else { visible = true }

if keyboard_check_pressed(vk_enter) {
	if type == "Close Setup" && string_length(global.persona[0]) > 0 {
		obj_player.visible = true
		obj_player.sprite_index = obj_player.dn_sprite
			
		global.hp = global.max_hp
		global.sp = global.max_sp
		global.mp = global.max_mp
			
		global.persona[0] = string_ucfirst(global.persona[0])
			
		if global.class == "warrior" {
			inventory_add(1, 1) // Rusted Sword
			inventory_add(4, 1) // Dented Chainmail
			inventory_weapon_equip(1)
			inventory_armour_equip(4)
		} else if global.class == "rogue" {
			inventory_add(3, 1) // Blunt Dagger
			inventory_add(6, 1) // Drifters Jacket
			inventory_weapon_equip(3)
			inventory_armour_equip(6)
		} else if global.class = "mage" {
			inventory_add(2, 1) // Rotten Staff
			inventory_add(5, 1) // Tattered Robes
			inventory_weapon_equip(2)
			inventory_armour_equip(5)
		}
			
		room_goto(rm_intro)
			
		obj_player.x = 338
		obj_player.y = 239
	} else if type == "Next Setup" && string_length(global.persona[0]) > 0 {
		obj_setup.phase = 2
		with instance_create(896, 668, obj_ok_button) {
			type = "Close Setup"
		}
		instance_destroy(self)
	}
}

if position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id) {
	// Check for Mouse Enter
	image_index = 1
	
	if mouse_check_button_pressed(mb_left) && obj_setup.panel_overview != -1 {
		
		if type == "Close Setup" && string_length(global.persona[0]) > 0 {
			obj_player.visible = true
			obj_player.sprite_index = obj_player.dn_sprite
			
			global.hp = global.max_hp
			global.sp = global.max_sp
			global.mp = global.max_mp
			
			global.persona[0] = string_ucfirst(global.persona[0])
			
			if global.class == "warrior" {
				inventory_add(1, 1) // Rusted Sword
				inventory_add(4, 1) // Dented Chainmail
				inventory_weapon_equip(1)
				inventory_armour_equip(4)
			} else if global.class == "rogue" {
				inventory_add(3, 1) // Blunt Dagger
				inventory_add(6, 1) // Drifters Jacket
				inventory_weapon_equip(3)
				inventory_armour_equip(6)
			} else if global.class = "mage" {
				inventory_add(2, 1) // Rotten Staff
				inventory_add(5, 1) // Tattered Robes
				inventory_weapon_equip(2)
				inventory_armour_equip(5)
			}
			
			room_goto(rm_intro)
			
			obj_player.x = 338
			obj_player.y = 239
		} else if type == "Next Setup" && string_length(global.persona[0]) > 0 {
			obj_setup.phase = 2
			with instance_create(896, 668, obj_ok_button) {
				type = "Close Setup"
			}
			instance_destroy(self)
		}
	}
} else {
	image_index = 0
}
