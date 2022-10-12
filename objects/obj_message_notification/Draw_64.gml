/// @description Draw Message Text

if alarm_get(0) != 0 {
	draw_set_colour(c_grey)
	draw_set_alpha(0.5)
	
	if message_text == obj_notification_controller.message_list[0] {	
		x_draw = 4
		y_draw = 128
	}
	else if message_text == obj_notification_controller.message_list[1] {	
		x_draw = 4
		y_draw = 160
	}
	else if message_text == obj_notification_controller.message_list[2] {	
		x_draw = 4
		y_draw = 192
	}
	else if message_text == obj_notification_controller.message_list[3] {	
		x_draw = 4
		y_draw = 224
	}
	else if message_text == obj_notification_controller.message_list[4] {	
		x_draw = 4
		y_draw = 256
	}
	
	//draw_rectangle(x -4 , y, x + 543, y +32, 0)
	draw_rectangle(x_draw, y_draw, x_draw + 540, y_draw + 32, 0)
	draw_set_colour(c_white)
	draw_set_alpha(1)
	draw_set_font(fnt_inventory_20)
	draw_text(x_draw, y_draw, message_text)
}