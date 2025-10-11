extends ColorRect

func _unhandled_key_input(_event: InputEvent) -> void:
	GlobalData.reset()
	get_tree().change_scene_to_file("res://Desktop/desktop.tscn")
