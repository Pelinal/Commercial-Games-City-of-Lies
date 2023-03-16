if !obj_player.intro_text {
	message(["Finally, I have arrived in the Capital. I should\nask the Harbourmaster for clues "], 1)
	message_nametag([global.persona[0]], 1)
	quest_track(0)
	obj_player.intro_text = true
}

// On Room enter
area_notification("Entering: Nova Porta, Docklands")

if !audio_is_playing(ms_docks_1) {
	audio_stop_all()
	audio_play_sound(ms_docks_1, 50, true)
}