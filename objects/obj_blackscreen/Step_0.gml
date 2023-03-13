/// @description
global.immobile = true
if fade == "FadeIn" {
	// Fade from Black
	image_alpha = 1
	do {
		image_alpha -= (0.0166666667 / duration) // Convert Seconds into Frames
	}
	until image_alpha <= 0
} else {
	// Fade to Black
	image_alpha = 0
	do {
		image_alpha += (0.0166666667 / duration) // Convert Seconds into Frames
	}
	until image_alpha >= 1
}
