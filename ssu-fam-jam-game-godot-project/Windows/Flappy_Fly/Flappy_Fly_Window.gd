extends TextureRect

# upon click remove x amount of funds from the account
# have flappy bird aim for multipliers and stuff thats gen random



func _on_flappy_fly_close_requested() -> void:
	GlobalData.open_tabs.erase("Flappy_Fly")
	get_parent().queue_free()
