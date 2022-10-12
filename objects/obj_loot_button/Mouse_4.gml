/// @description Respond to Left Click

// Take one item
inventory_add(loot, amount)
message_notification(global.library[loot][0] + " X" + string(amount) + " added to inventory")
instance_destroy(self)