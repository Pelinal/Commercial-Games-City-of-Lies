/// @description  Destroy when SPACE is pressed.

//if batch_counter > batch { batch_counter = batch-1 }

if instance_number(obj_messagebox) == 0 {
	instance_destroy(self)
}