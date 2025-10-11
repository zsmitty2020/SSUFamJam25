extends TextureRect

func _ready():
	get_parent().position = Vector2i(randi_range(100, get_parent().get_window().size.x-100), randi_range(100, get_parent().get_window().size.y-100))
	if GlobalData.num_updates > 5:
		$HBoxContainer.move_child($HBoxContainer/Update, randi_range(0, $HBoxContainer.get_child_count()-1))

func _process(delta: float) -> void:
	$ProgressBar.value += delta
	if $ProgressBar.value >= $ProgressBar.max_value:
		lose()

func _on_winwoes_close_requested() -> void:
	GlobalData.open_tabs.erase("update")
	get_parent().queue_free()


func _on_remind_pressed() -> void:
	get_parent().queue_free()


func _on_update_pressed() -> void:
	lose()


func lose():
	print("LOOOOSER FUCKING LOOOOOSER YOU LOOOOOSE")
	for i in get_tree().get_root().get_children(true):
		if i is Window:
			i.close_requested.emit()
	get_tree().change_scene_to_file("res://Desktop/BlueScreen/blue_screen.tscn")
