area_notification("Entering: Palm Inn, First Floor")

if !audio_is_playing(ms_inn_1) {
	audio_stop_all()
	audio_play_sound(ms_inn_1, 50, true)
}