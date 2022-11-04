/// @description Button check

if position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id) {
	// Check for Mouse Enter
	image_index = 1
	
	if mouse_check_button_pressed(mb_left) {
		obj_setup.panel_overview = class_id
		
		if class_id == 0	  {
			global.class = "mage"
			
			
			global.edr = 1
			global.dex = 3
			global.int = 5
			global.spd = 3
			global.luk = 1
			
			global.atk = 7
			global.def = 5
			global.stk = 5
			global.sdf = 7
			global.mtk = 10
			global.mdf = 10
		}
		else if class_id == 1 {
			global.class = "rogue"
			
			global.edr = 2
			global.dex = 5
			global.int = 1
			global.spd = 4
			global.luk = 5
			
			global.atk = 5
			global.def = 7
			global.stk = 10
			global.sdf = 10
			global.mtk = 5
			global.mdf = 5
		}
		else if class_id == 2 {
			global.class = "warrior"
			
			global.edr = 6
			global.dex = 4
			global.int = 1
			global.spd = 1
			global.luk = 3
			
			global.atk = 12
			global.def = 12
			global.stk = 7
			global.sdf = 5
			global.mtk = 3
			global.mdf = 3
		}
	
		if global.persona[1] == "Male" {
			if global.class == "warrior" {
				obj_player.lr_sprite = spr_m_warrior_lr
				obj_player.up_sprite = spr_m_warrior_up
				obj_player.dn_sprite = spr_m_warrior_dn
			} else if global.class == "rogue" {
				obj_player.lr_sprite = spr_m_rogue_lr
				obj_player.up_sprite = spr_m_rogue_up
				obj_player.dn_sprite = spr_m_rogue_dn
			} else if global.class == "mage" {
				obj_player.lr_sprite = spr_m_mage_lr
				obj_player.up_sprite = spr_m_mage_up
				obj_player.dn_sprite = spr_m_mage_dn
			}
		} else {
			if global.class == "warrior" {
				obj_player.lr_sprite = spr_f_warrior_lr
				obj_player.up_sprite = spr_f_warrior_up
				obj_player.dn_sprite = spr_f_warrior_dn
			} else if global.class == "rogue" {
				obj_player.lr_sprite = spr_f_rogue_lr
				obj_player.up_sprite = spr_f_rogue_up
				obj_player.dn_sprite = spr_f_rogue_dn
			} else if global.class == "mage" {
				obj_player.lr_sprite = spr_f_mage_lr
				obj_player.up_sprite = spr_f_mage_up
				obj_player.dn_sprite = spr_f_mage_dn
			}
		}

	}
} else {
	image_index = 0
}