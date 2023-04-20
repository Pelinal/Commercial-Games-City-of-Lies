area_notification("Entering: Prefect's Manor, Ground Floor")
if !audio_is_playing(ms_manor) {
	audio_stop_all()
	audio_play_sound(ms_manor, 50, true)
}