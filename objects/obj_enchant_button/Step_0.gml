/// @description Check for trademenu visibility

draw_x = (obj_trademenu.draw_x) + (x - obj_trademenu.x) + 30
//if obj_trademenu.sprite_index == spr_crafting { sprite_index = spr_button_216_32 } else { sprite_index = spr_button_288_32 }

if y > obj_trademenu.y + 432 || y < obj_trademenu.y + 70 {
	visible = false
} else { visible = true }

if keyboard_check(vk_escape) { instance_destroy(self) }

if inventory_is_enchanted(item_id) { instance_destroy(self) }

if obj_manualinput.max_scroll >= 1 && obj_manualinput.can_scroll {
	if mouse_wheel_up() { obj_manualinput.scroll_value -= 1 y -= 32 draw_y -= 72 } 
	else if mouse_wheel_down()  { obj_manualinput.scroll_value += 1 y += 32 draw_y += 72}
}