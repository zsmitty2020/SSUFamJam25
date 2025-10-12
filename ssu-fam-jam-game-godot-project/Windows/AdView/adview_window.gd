extends TextureRect

var just_maxed:bool = false

func _ready() -> void:
	var dir := DirAccess.open("res://Windows/AdView/Ads/")
	var filenames := dir.get_files()
	var random_file:String = ""
	while not random_file.ends_with(".ogv"):
		random_file = filenames[randi()%filenames.size()]
	$VideoStreamPlayer.stream = load("res://Windows/AdView/Ads/"+random_file)
	$VideoStreamPlayer.play()

func _on_adview_window_close_requested() -> void:
	GlobalData.open_tabs.erase("adview")
	get_parent().queue_free()

func _process(delta: float) -> void:
	$ProgressBar.value += delta
	$HBoxContainer/Label.text = "Balance: $%.2f"%GlobalData.adview_bank
	if $ProgressBar.value>=$ProgressBar.max_value:
		$VideoStreamPlayer.paused = true
		if not just_maxed:
			just_maxed = true
			$ImageAd.visible = true
			var dir := DirAccess.open("res://Windows/AdView/Banners/")
			var filenames := dir.get_files()
			var random_file:String = ""
			while not random_file.ends_with(".jpg"):
				random_file = filenames[randi()%filenames.size()]
			$ImageAd.texture = load("res://Windows/AdView/Banners/"+random_file)
			$ImageAd/Close.global_position = Vector2(randi_range(10,get_window().size.x-10), randi_range(10,get_window().size.y-10))
	else:
		if $VideoStreamPlayer.paused:
			$VideoStreamPlayer.paused = false
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


func _on_video_stream_player_finished() -> void:
	var dir := DirAccess.open("res://Windows/AdView/Ads/")
	var filenames := dir.get_files()
	var random_file:String = ""
	while not random_file.ends_with(".ogv"):
		random_file = filenames[randi()%filenames.size()]
	$VideoStreamPlayer.stream = load("res://Windows/AdView/Ads/"+random_file)
	$VideoStreamPlayer.play()
