extends VBoxContainer

signal interact

func _on_line_edit_text_changed(_new_text: String) -> void:
	interact.emit()
