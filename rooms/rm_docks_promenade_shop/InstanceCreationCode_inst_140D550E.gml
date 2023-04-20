// 0: Item ID, 1: Amount for sale

sprite_index = spr_vendors_docks
image_index = 3

stock_list[0] = [89, irandom(3)] // Robe 1
stock_list[1] = [90, irandom(2)] // Gambeson
stock_list[2] = [91, irandom(2)] // Bronze Mail
stock_list[3] = [92, irandom(1)] // Scale Armour
stock_list[4] = [93, irandom(3)] // Rough Leathers
stock_list[5] = [94, irandom(2)] // Iron ring
stock_list[6] = [65, irandom(3)] // Boots
stock_list[7] = [66, irandom(2)] // Fancyboots
stock_list[8] = [52, irandom(20)] // Cloth
stock_list[9] = [55, irandom(10)] // Wool
stock_list[10] = [68, irandom(3)] // Rope Charm
stock_list[11] = [57, irandom(4)] // Rope

crafting = true
crafting_category = "smithing"
recipe_list = obj_recipebook.smithing_armour_recipes
category = "general"
shop_name = "Armoursmith"