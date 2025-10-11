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


func _on_adview_meta_clicked(_meta: Variant) -> void:
	if GlobalData.open_tabs.find("adview")==-1:
		var temp = preload("res://Windows/AdView/adview_window.tscn").instantiate()
		get_tree().get_root().add_child(temp)
		GlobalData.open_tabs.append("adview")


func _on_slotsgambling_meta_clicked(_meta):
	if GlobalData.open_tabs.find("slotsgambling")==-1:
		var temp = preload("res://Windows/SlotsGambling/slotsgambling.tscn").instantiate()
		get_tree().get_root().add_child(temp)
		GlobalData.open_tabs.append("slotsgambling")


func _on_dryft_meta_clicked(_meta: Variant) -> void:
	if GlobalData.open_tabs.find("dryft")==-1:
		var temp = preload("res://Windows/UberGame/uber_game.tscn").instantiate()
		get_tree().get_root().add_child(temp)
		GlobalData.open_tabs.append("dryft")


func _on_ball_bouncer_meta_clicked(meta: Variant) -> void:
	if GlobalData.open_tabs.find("ballbouncer")==-1:
		var temp = preload("res://Windows/Ball_Bouncer/Ball_Bouncer.tscn").instantiate()
		get_tree().get_root().add_child(temp)
		GlobalData.open_tabs.append("ballbouncer")
