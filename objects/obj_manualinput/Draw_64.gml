/// @description Draw right panel

draw_sprite_stretched(spr_button_94_94, anim_index, draw_x, draw_y, 212, 212)
if instance_number(obj_enchant_button) > 0 && panel {
	draw_sprite(spr_newpanel, 0, draw_x + 222, draw_y - 378) //806, 857)
}

