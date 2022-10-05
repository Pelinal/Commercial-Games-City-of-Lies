/// @description React to Left click

if type == "destroy" {
	inventory_remove(chosen_item, 1)
}
else if type == "use" {
	inventory_consumable_use(chosen_item)
	inventory_remove(chosen_item, 1)
}
