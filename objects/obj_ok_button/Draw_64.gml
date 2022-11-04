/// @description Draw Text

draw_self()
if type == "Close Setup" {	
	draw_text(x + 24, y + 12, "Finish")
} else {
	draw_text(x + 24, y + 12*image_yscale, "Next")
}