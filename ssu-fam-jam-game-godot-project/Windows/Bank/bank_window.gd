extends TextureRect

func _ready() -> void:
	if GlobalData.previous_accounts.previous_accounts.size()!=0:
		$VBoxContainer/Label4.visible = false
		for i in GlobalData.previous_accounts.previous_accounts:
			var temp = Label.new()
			temp.add_theme_color_override("font_color", Color(0.553, 0.553, 0.557, 1.0))
			temp.text = "Account Balance: $%.2f"%i
			$VBoxContainer.add_child(temp)

func _process(_delta: float) -> void:
	$VBoxContainer/Balance.text = "You have a balance of: $" + "%.2f"%GlobalData.balance

func _on_bank_window_close_requested() -> void:
	GlobalData.open_tabs.erase("bank")
	get_parent().queue_free()
