// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function restore_hp(amount) {
	global.hp += amount
	if global.hp > global.max_hp {
		global.hp = global.max_hp
	}
}
function restore_mp(amount) {
	global.mp += amount
	if global.mp > global.max_mp {
		global.mp = global.max_mp
	}
}
function restore_sp(amount) {
	global.sp += amount
	if global.sp > global.max_sp {
		global.sp = global.max_sp
	}
}
function damage_hp(amount) {
	global.hp -= amount
	if global.hp < 0 {
		global.hp = 0
	}
}
function damage_mp(amount) {
	global.mp -= amount
	if global.mp < 0 {
		global.mp = 0
	}
}
function damage_sp(amount) {
	global.sp -= amount
	if global.sp < 0 {
		global.sp = 0
	}
}
function add_xp(amount) {
	if global.exp + amount <= global.exp_req {
		global.exp += amount
		amount = 0
	} else {
		amount -= global.exp_req - global.exp		// Find remainder
		global.exp += global.exp_req - global.exp	// Add exp to next level
	}
	
	if global.exp >= global.exp_req {
		global.exp = amount
		global.exp_req = round(global.exp_req * 1.079775166)
		audio_play_sound(se_levelup, 100, 0)
		global.level += 1
		message_notification("Level " + string(global.level) + " Reached!")
	}
}