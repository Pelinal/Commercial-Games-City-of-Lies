/// @description Init
// This is the NPC that just walks around

image_speed = 0

walk_axis = "X" // Either x or y
walk_speed = 3	// Amount to increment by each frame
wait_time = 0	// Time to wait after stopping (before reversal)
origin_x = x
origin_y = y
walk_distance = 64  // Amount to walk both - and + on the axis from original position
current_dir = -1 // The current direction (-1 Left, 1 Right)

char_type = "Sailor 1" // Refers to the sprites to be used
char_name = "Name"	// The unique character name

choice_result = -1 // Used on objects that have choices

in_dialogue = false
pre_dir = 1

/// SPRITES
lr_sprite = spr_sailor_1_lr
up_sprite = spr_sailor_1_up
dn_sprite = spr_sailor_1_dn

// For Autoevent
autoevent_fired = false

dead = false
