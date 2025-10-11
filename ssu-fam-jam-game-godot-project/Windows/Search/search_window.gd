extends TextureRect


func _on_button_pressed() -> void:
	$MainSearchScreen.visible = false
	$SearchResults.visible = true
	await get_tree().create_timer(0.75).timeout
	$SearchResults/VBoxContainer.visible = true


func _on_url_meta_clicked(_meta: Variant) -> void:
	var temp = preload("res://Windows/Bank/bank_window.tscn").instantiate()
	if GlobalData.open_tabs.find("bank")==-1:
		get_tree().get_root().add_child(temp)
		GlobalData.open_tabs.append("bank")
