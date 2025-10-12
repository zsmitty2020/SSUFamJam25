extends TextureRect



func _on_flappy_fly_close_requested() -> void:
	GlobalData.open_tabs.erase("Flappy_Fly")
	get_parent().queue_free()

func _on_game_over_restart():
	GlobalData.open_tabs.erase("Flappy_Fly")
	get_parent().queue_free()
