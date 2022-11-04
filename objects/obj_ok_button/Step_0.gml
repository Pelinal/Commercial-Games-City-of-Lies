/// @description Check mouse


if obj_setup.phase = 0 { visible = false }
else { visible = true }

if position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id) {
	// Check for Mouse Enter
	image_index = 1
	
	if mouse_check_button_pressed(mb_left) && obj_setup.panel_overview != -1 {
		
		if type == "Close Setup" {
			obj_player.visible = true
			obj_player.sprite_index = obj_player.dn_sprite
			
			global.hp = global.max_hp
			global.sp = global.max_sp
			global.mp = global.max_mp
			
			global.persona[0] = global.persona[0] + " Duqarte"
			
			room_goto(rm_palace_ext)
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
