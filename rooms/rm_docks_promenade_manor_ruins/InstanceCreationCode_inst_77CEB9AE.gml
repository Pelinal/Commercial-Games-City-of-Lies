visible = false
travel_to = rm_docks_south_ext
newX = 608
newY = 1115
newDir = "down"
//lock_level = 1 // Req: Lockpicking 1
locked = false
conditional = false
//condition = false

if !quest_completed(0) { instance_destroy(self) }