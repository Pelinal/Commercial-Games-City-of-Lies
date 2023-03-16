/// @desc message_notification
// @param text
function message_notification(text) {
	// Update message stack
	
	with obj_message_notification {
		if message_text == obj_notification_controller.message_list[4] {
			instance_destroy(self)
		}
	}
	
	obj_notification_controller.message_list[4] = obj_notification_controller.message_list[3]
	obj_notification_controller.message_list[3] = obj_notification_controller.message_list[2]
	obj_notification_controller.message_list[2] = obj_notification_controller.message_list[1]
	obj_notification_controller.message_list[1] = obj_notification_controller.message_list[0]
	obj_notification_controller.message_list[0] = text
	
	with instance_create(obj_notification_controller.x, obj_notification_controller.x, obj_message_notification) {
		message_text = text
	}
}

function area_notification(text) {
	// Update message stack
	
	with obj_message_notification {
		if message_text == obj_notification_controller.message_list[4] {
			instance_destroy(self)
		}
	}
	
	obj_notification_controller.message_list[4] = obj_notification_controller.message_list[3]
	obj_notification_controller.message_list[3] = obj_notification_controller.message_list[2]
	obj_notification_controller.message_list[2] = obj_notification_controller.message_list[1]
	obj_notification_controller.message_list[1] = obj_notification_controller.message_list[0]
	obj_notification_controller.message_list[0] = text
	
	with instance_create(obj_notification_controller.x, obj_notification_controller.x, obj_message_notification) {
		message_text = text
		image_xscale = 2
	}
}