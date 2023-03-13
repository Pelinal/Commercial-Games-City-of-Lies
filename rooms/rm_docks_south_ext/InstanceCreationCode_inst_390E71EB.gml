visible = true
travel_to = rm_docks_south_warehouse_01
newX = 432
newY = 560
newDir = "up"
locked = false
conditional = true
condition = (quest_active(0) && !quest_completed(0) && !quest_objective_is_complete(0, 5) && quest_objective_is_visible(0, 5))