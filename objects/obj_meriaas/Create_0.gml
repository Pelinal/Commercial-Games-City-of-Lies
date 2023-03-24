/// @description Init

choice_result = -1 // Used on objects that have choices

image_index = 0
image_speed = 0

lr_sprite = spr_meriaas_lr
dn_sprite = spr_meriaas_dn
up_sprite = spr_meriaas_up

move_list = []
moving = false
move_i = -1
move_x = 0
move_y = 0

if quest_objective_is_complete(0, 6) || quest_objective_is_complete(0, 7) {
	// If evidence has been acquired, he wont appear
	instance_destroy(self)
}