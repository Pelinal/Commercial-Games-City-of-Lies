/// @description Plus/Minus Value

if type == "minus" && obj_trademenu.craft_amount > 0 {
	obj_trademenu.craft_amount --
}
else if type == "plus" && obj_trademenu.craft_amount < 100 {
	obj_trademenu.craft_amount ++
}
