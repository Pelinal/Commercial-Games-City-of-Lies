area_notification("Entering: Pontastra Ruins")
global.ambientShadowIntensity = 0.9 // Nighttime
if !audio_is_playing(ms_ruins) {
	audio_stop_all()
	audio_play_sound(ms_ruins, 50, true)
}