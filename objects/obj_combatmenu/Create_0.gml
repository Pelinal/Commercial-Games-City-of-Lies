/// @description Init

depth = -1001
image_speed = 0
image_index = 0
alarm[0] = -1

x = 0
y = 0

battleback = noone
battler_list = noone
current_display = "Default"
scroll_bar = false

// The most important variable
turn = "None" // Player, Enemy 1, Enemy 2, Enemy 3, Enemy 4
turn_counter = 0
max_turns = 0

// Used to provide updates during battles
battle_text = ["", "", ""]

// Rewards
rewards_list = []
kill_xp = 0