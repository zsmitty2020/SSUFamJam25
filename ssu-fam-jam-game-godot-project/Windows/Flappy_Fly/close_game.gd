extends TextureRect



func _on_game_over_restart():
	GlobalData.open_tabs.erase("Flappy_Fly")
	get_parent().queue_free()
