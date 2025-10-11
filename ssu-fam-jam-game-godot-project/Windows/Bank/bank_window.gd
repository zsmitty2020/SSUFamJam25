extends TextureRect

func _process(_delta: float) -> void:
	$VBoxContainer/Balance.text = "You have a balance of: $" + "%.2f"%GlobalData.balance

func _on_bank_window_close_requested() -> void:
	GlobalData.open_tabs.erase("bank")
	get_parent().queue_free()
