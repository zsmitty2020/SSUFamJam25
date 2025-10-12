extends TextureRect

var jobs:Array[String] = [
	"Job Description: HELP!!! My senior thesis is due in 8 HOURS!!!!!",
	"Job Description: I need help writing my resume",
	"Job Description: Coding project, need this script...",
	"Job Description: Build my website",
	"Job Description: Script needed for feature-length film",
	"Job Description: Fact-check my research",
]



func _on_freejob_window_close_requested() -> void:
	GlobalData.open_tabs.erase("freejob")
	get_parent().queue_free()


func _on_find_work_pressed() -> void:
	$"Pop-Up".visible = true
	$"Pop-Up/VBoxContainer".visible = false
	$"Pop-Up/VBoxContainer/LineEdit".text = ""
	await get_tree().create_timer(3).timeout
	$AudioStreamPlayer3.play()
	GlobalData.conversed = false
	$"Pop-Up/VBoxContainer".visible = true
	$"Pop-Up/VBoxContainer/JobDescription".text = jobs.pick_random()


func _on_line_edit_editing_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$"Pop-Up/VBoxContainer/LineEdit".text = "Work Pasted!"


func _on_submit_pressed() -> void:
	var temp = randf_range(10, 70)
	$"Pop-Up".visible = false
	if GlobalData.conversed:
		if GlobalData.clipboard >= 70:
			GlobalData.clipboard = 0
			$"FinishedPop-Up".visible = true
			$"FinishedPop-Up/VBoxContainer/Label".text = "Work Complete! You Earned $%.2f"%temp
			GlobalData.balance += temp
			$AudioStreamPlayer.play()
		else:
			GlobalData.clipboard = 0
			$"FinishedPop-Up".visible = true
			$"FinishedPop-Up/VBoxContainer/Label".text = "Work Incomplete! The Employer wasn't satisfied with your work..."
			$AudioStreamPlayer2.play()
	else:
		if randi_range(0,100)==1:
			GlobalData.clipboard = 0
			$"FinishedPop-Up".visible = true
			$"FinishedPop-Up/VBoxContainer/Label".text = "Work Complete! You Earned $%.2f"%temp
			GlobalData.balance += temp
			$AudioStreamPlayer.play()
		else:
			GlobalData.clipboard = 0
			$"FinishedPop-Up".visible = true
			$"FinishedPop-Up/VBoxContainer/Label".text = "Work Incomplete! The Employer wasn't satisfied with your work..."
			$AudioStreamPlayer2.play()
	await get_tree().create_timer(3).timeout
	$"FinishedPop-Up".visible = false
