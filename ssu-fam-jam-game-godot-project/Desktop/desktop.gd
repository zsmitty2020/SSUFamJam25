extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().root.size_changed.connect(_on_viewport_size_changed)
	_on_viewport_size_changed()
	$AnimationPlayer.play("Fade-In")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_viewport_size_changed():
	var viewport_size = get_tree().root.size
	set_size(viewport_size)
	#print("thing")


func _on_shut_down_pressed() -> void:
	GlobalData.previous_accounts.previous_accounts.insert(0, GlobalData.balance)
	while GlobalData.previous_accounts.previous_accounts.size() > 10:
		GlobalData.previous_accounts.previous_accounts.remove_at(GlobalData.previous_accounts.previous_accounts.size()-1)
	GlobalData.previous_accounts.write_save()
	get_tree().quit()
