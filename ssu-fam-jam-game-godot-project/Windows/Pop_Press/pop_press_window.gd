extends TextureRect


func _on_pop_press_window_close_requested() -> void:
	GlobalData.open_tabs.erase("poppress")
	get_parent().queue_free()

func _process(_delta: float) -> void:
	$HBoxContainer/Designs.text = "Designs Uploaded: %d"%GlobalData.designs.size()
	var temp:int = 0
	for i in GlobalData.designs:
		temp += i
	$HBoxContainer/Revenue.text = "Revenue Generated: %d"%temp


func _on_upload_pressed() -> void:
	if GlobalData.art_finished:
		GlobalData.art_finished = false
		GlobalData.designs.append(0)
