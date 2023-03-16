/// @description
global.immobile = true
if fade == "FadeIn" {
	// Fade from Black
	if image_alpha = 1 {
		do {
			image_alpha -= (0.0166666667 / duration) // Convert Seconds into Frames
		}
		until image_alpha <= 0
	}
	if image_alpha <= 0 { global.immobile = false instance_destroy(self) }
} else {
	// Fade to Black
	if image_alpha = 0 {
		do {
			image_alpha += (0.0166666667 / duration) // Convert Seconds into Frames
		}
		until image_alpha >= 1
	}
	if image_alpha >= 1 { global.immobile = false instance_destroy(self) }
}

