extends TextureRect

func _on_ball_bouncer_close_requested() -> void:
	GlobalData.open_tabs.erase("Ball_Bouncer")
	get_parent().queue_free()
