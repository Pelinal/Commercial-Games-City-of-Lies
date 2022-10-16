/// @description Initialise

depth = -1000

// Core Variables
pop_list = []
stock_list = []
recipe_list = []
category = ""
crafting_category = ""
current_tab = "buy"
craft_amount = 1
ench_selected_items = [-1, -1, -1]

// Scrolling
can_scroll = false
max_scroll = 0
scroll_value = 0

// Other
overview_id = -1
trade_populate(category)