extends TextureRect

func _process(delta: float) -> void:
	$ProgressBar.value += delta
	if $ProgressBar.value >= $ProgressBar.max_value:
		print("LOOOOSER FUCKING LOOOOOSER YOU LOOOOOSE")
		get_tree().quit()

func _on_winwoes_close_requested() -> void:
	GlobalData.open_tabs.erase("update")
	get_parent().queue_free()


func _on_remind_pressed() -> void:
	get_parent().queue_free()
