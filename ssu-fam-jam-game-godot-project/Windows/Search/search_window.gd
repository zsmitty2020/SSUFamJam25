extends TextureRect


func _on_button_pressed() -> void:
	$MainSearchScreen.visible = false
	$SearchResults.visible = true
	await get_tree().create_timer(0.75).timeout
	$SearchResults/VBoxContainer.visible = true


func _on_url_meta_clicked(_meta: Variant) -> void:
	if GlobalData.open_tabs.find("bank")==-1:
		var temp = preload("res://Windows/Bank/bank_window.tscn").instantiate()
		get_tree().get_root().add_child(temp)
		GlobalData.open_tabs.append("bank")


func _on_search_window_close_requested() -> void:
	GlobalData.open_tabs.erase("search")
	get_parent().queue_free()


func _on_survey_meta_clicked(_meta: Variant) -> void:
	if GlobalData.open_tabs.find("survey")==-1:
		var temp = preload("res://Windows/Surveys/survey_window.tscn").instantiate()
		get_tree().get_root().add_child(temp)
		GlobalData.open_tabs.append("survey")


func _on_converse_meta_clicked(_meta: Variant) -> void:
	if GlobalData.open_tabs.find("converse")==-1:
		var temp = preload("res://Windows/Converse/converse_window.tscn").instantiate()
		get_tree().get_root().add_child(temp)
		GlobalData.open_tabs.append("converse")


func _on_freejob_meta_clicked(_meta: Variant) -> void:
	if GlobalData.open_tabs.find("freejob")==-1:
		var temp = preload("res://Windows/FreeJob/freejob_window.tscn").instantiate()
		get_tree().get_root().add_child(temp)
		GlobalData.open_tabs.append("freejob")
