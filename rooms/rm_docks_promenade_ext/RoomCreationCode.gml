if !audio_is_playing(ms_docks_1) {
	audio_stop_all()
	audio_play_sound(ms_docks_1, 50, true)
}

area_notification("Entering: Promenade, Docklands")