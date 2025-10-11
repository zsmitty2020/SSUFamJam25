extends TextureRect


func _ready() -> void:
	for i in range(GlobalData.survey_count):
		var temp = preload("res://Windows/Surveys/survey_link.tscn").instantiate()
		$Surveys.add_child(temp)
		temp.connect("meta_clicked", _on_survey_link_meta_clicked)

func _on_survey_link_meta_clicked(_meta: Variant) -> void:
	$Surveys.visible = false
	GlobalData.survey_count -= 1
	$Surveys.get_child($Surveys.get_child_count()-1).queue_free()
	var temp = preload("res://Windows/Surveys/survey.tscn").instantiate()
	add_child(temp)
	temp.connect("finished", finished)

func finished():
	$Surveys.visible = true


func _on_survey_window_close_requested() -> void:
	GlobalData.open_tabs.erase("survey")
	get_parent().queue_free()


func _on_refresh_pressed() -> void:
	for i in $Surveys.get_children():
		if i is not Label:
			i.queue_free()
	await get_tree().create_timer(0.35).timeout
	for i in range(GlobalData.survey_count):
		var temp = preload("res://Windows/Surveys/survey_link.tscn").instantiate()
		$Surveys.add_child(temp)
		temp.connect("meta_clicked", _on_survey_link_meta_clicked)
