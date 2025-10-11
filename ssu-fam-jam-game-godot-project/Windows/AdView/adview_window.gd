extends TextureRect

var just_maxed:bool = false

func _on_adview_window_close_requested() -> void:
	GlobalData.open_tabs.erase("adview")
	get_parent().queue_free()

func _process(delta: float) -> void:
	$ProgressBar.value += delta
	$HBoxContainer/Label.text = "Balance: $%.2f"%GlobalData.adview_bank
	if $ProgressBar.value>=$ProgressBar.max_value:
		$AudioStreamPlayer.playing = false
		if not just_maxed:
			just_maxed = true
			$ImageAd.visible = true
			$ImageAd/Close.global_position = Vector2(randi_range(10,get_window().size.x-10), randi_range(10,get_window().size.y-10))
	else:
		if not $AudioStreamPlayer.playing:
			$AudioStreamPlayer.playing = true
		GlobalData.adview_bank +=delta/100


func _on_close_pressed() -> void:
	$ImageAd.visible = false
	$ProgressBar.value = 0
	$ProgressBar.max_value = randf_range(15, 60)
	just_maxed = false


func _on_cash_out_pressed() -> void:
	if GlobalData.adview_bank >= 5:
		GlobalData.balance += GlobalData.adview_bank
		GlobalData.adview_bank = 0
