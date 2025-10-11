extends TextureRect


func _on_sparrow_window_close_requested() -> void:
	GlobalData.open_tabs.erase("sparrow")
	get_parent().queue_free()
