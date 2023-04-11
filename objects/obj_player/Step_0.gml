/// @description  Movement, Collision and Animations

if keyboard_check_pressed(vk_alt) {
	audio_stop_all()
}

if !global.immobile && instance_number(obj_messagebox) == 0 && instance_number(obj_combatmenu) == 0 {
    // Take keyboard inputs
    if keyboard_check(ord("W"))			{ vsp = -movespeed }
    else if keyboard_check(ord("S"))	{ vsp =  movespeed }
    if keyboard_check(ord("A"))			{ hsp = -movespeed }
    else if keyboard_check(ord("D")) 	{ hsp =  movespeed }
    
    // Movement and Collision
    if(place_meeting(x,y + vsp , obj_wall)) && !keyboard_check(vk_control) {
        while(!place_meeting(x,y+sign(vsp),obj_wall)){
            y += sign(vsp);
        }
        vsp = 0;
    }
    y += vsp
    
    if(place_meeting(x + hsp,y, obj_wall)){
        while(!place_meeting(x+sign(hsp),y,obj_wall)){
            x += sign(hsp);
        }
        hsp = 0;
    }
    x += hsp
    
    // Stop Movement if no key pressed
    if !keyboard_check(ord("A")) || !keyboard_check(ord("D")) { hsp = 0 }
    if !keyboard_check(ord("W")) || !keyboard_check(ord("S")) { vsp = 0 }
    
    // Sprint
    if keyboard_check (vk_shift) { movespeed = 6 + (base_speed * (global.spd/30)) } else { movespeed = 3 + (base_speed * (global.spd/30)) }
    
    // Animation Control
    if keyboard_check(ord("W")) { sprite_index = up_sprite image_xscale = 1 image_speed = asp }
    else if keyboard_check(ord("A")) && !keyboard_check(ord("W")) { sprite_index = lr_sprite image_xscale = 1 image_speed = asp }
    else if keyboard_check(ord("S")) && !keyboard_check(ord("A")) && !keyboard_check(ord("D")) { sprite_index = dn_sprite image_xscale = 1 image_speed = asp }
    else if keyboard_check(ord("D")) && !keyboard_check(ord("W")) { sprite_index = lr_sprite image_xscale = -1 image_speed = asp }
	// horizontal controls
    else if keyboard_check(ord("D")) && keyboard_check(ord("W")) { sprite_index = up_sprite }
    else if keyboard_check(ord("A")) && keyboard_check(ord("W")) { sprite_index = up_sprite }
    else if keyboard_check(ord("D")) && keyboard_check(ord("S")) { sprite_index = lr_sprite image_xscale = -1 }
    else if keyboard_check(ord("A")) && keyboard_check(ord("S")) { sprite_index = lr_sprite image_xscale = 1 }
    
    if !keyboard_check(ord("A")) && !keyboard_check(ord("D"))
    && !keyboard_check(ord("W")) && !keyboard_check(ord("S")) { image_speed = 0; image_index = 0 }
    
	
	// Combat Test
	if keyboard_check_pressed(vk_f2) {
		combat_start(0, ms_combat_1, 0, 0, noone, noone, [[0, 100]])
	}
	
	// Immobile During Messages
	if instance_number(obj_messagebox) > 0 {
		global.immobile = false
	}
	
	// Debug palace
	if keyboard_check_pressed(vk_f4) {
		// Teleport to palace
		room_goto(rm_palace_ext)
		obj_player.x = 977
		obj_player.y = 564
	}
	
	/// Quest Cheat Command
	if keyboard_check_pressed(vk_f6) {
		global.quest_objectives[0] = [[true, true, true, true, true, true, true, true, true, false], [true, true, true, true, true, true, true, true, false, false]]
	}
	
    //// Message box test command
    //if keyboard_check_pressed(ord("K")) { 
    //    message("Welcome to the City of Lies, a short role-playing#"
    //            +"game set in the ancient technologically advanced#"
    //            +"city known as The Capital. Get ready to undertake#"
    //            +"an epic adventure as you discover the mysterious#"
    //            +"past... ")
        
    //}
    //if keyboard_check_pressed(ord("L")) {
    //    temp_name[0] = "Qula K'tin"
    //    temp_text[0] = "This is a Message. "
    //    temp_name[1] = "Eios"
    //    temp_text[1] = "And here's another one. "
    //    temp_name[2] = "Patriarch Koluss"
    //    temp_text[2] = "Last but not least, here's one more. "
    //    message(temp_text, 3)
    //    message_nametag(temp_name, 3)
    //}
	
	//// Notification test command
	//if keyboard_check_pressed(ord("N")) {
	//	message_notification("Someone has fallen into the river of Lego City!")
	//	message_notification("We must save them!")
	//}
}

if global.immobile || instance_number(obj_messagebox) > 0 { image_index = 0 image_speed = 0 }

global.gold = inventory_fetch(0)
global.max_hp = 50 + (10 * (global.edr div 1))
global.max_mp = 50 + (10 * (global.int div 1))
global.max_sp = 50 + (10 * (global.dex div 1))