/// @description Respond to Left-Click
if clickable {
	// buy item
}
if !clickable {
	if visible {
		obj_trademenu.overview_id = item_id
		clickable = true
	}
}