area_notification("Entering: Prefect's Manor, Cavern")
global.ambientShadowIntensity = 0.9 // Nighttime
if !audio_is_playing(ms_dungeon_1) {
	audio_stop_all()
	audio_play_sound(ms_dungeon_1, 50, true)
}