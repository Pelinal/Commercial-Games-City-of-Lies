// 0: Item ID, 1: Amount for sale

//sprite_index = spr_vendors_docks
image_index = 0

stock_list[0] = [79, irandom(3)] // Sword #2
stock_list[1] = [80, irandom(3)] // Dagger #2
stock_list[2] = [81, irandom(3)] // Axe #2
stock_list[3] = [82, irandom(3)] // Staff #2
stock_list[4] = [83, irandom(2)] // Staff #3
stock_list[5] = [84, irandom(2)] // Bow
stock_list[6] = [85, irandom(2)] // Reinforced Bow
stock_list[7] = [115, irandom(2)] // Bronze Staff
stock_list[8] = [9, irandom(10)] // Copper Ore
stock_list[9] = [17, irandom(5)] // Iron Ore
stock_list[10] = [21, irandom(20)] // Wood
stock_list[11] = [22, irandom(20)] // Leather

crafting = true
crafting_category = "smithing"
recipe_list = obj_recipebook.smithing_weapon_recipes
category = "general"
shop_name = "Weaponsmith"