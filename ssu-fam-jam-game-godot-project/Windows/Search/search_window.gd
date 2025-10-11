extends TextureRect


func _on_button_pressed() -> void:
	$MainSearchScreen.visible = false
	$SearchResults.visible = true
	await get_tree().create_timer(0.75).timeout
	$SearchResults/VBoxContainer.visible = true
