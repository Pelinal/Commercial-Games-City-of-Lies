/// @description Init

choice_result = -1 // Used on objects that have choices

image_index = 0
image_speed = 0

lr_sprite = spr_erasmus_lr
dn_sprite = spr_erasmus_dn
up_sprite = spr_erasmus_up

move_list = []
moving = false
move_i = -1
move_x = 0
move_y = 0

onetimemove = false

in_dialogue = false

// merchant stuff

trading = false
crafting = true
crafting_category = "smithing"
recipe_list = obj_recipebook.smithing_weapon_recipes
category = "materials"
stock_list = [[9, 10], [22, 10], [21, 10]]
shop_name = "Erasmus' Arms"