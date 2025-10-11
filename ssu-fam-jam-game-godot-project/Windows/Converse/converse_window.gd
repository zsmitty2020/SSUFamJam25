extends TextureRect

var responses:Array[String] = [
	"Here's what I think...",
	"Maybe try this out?",
	"Oh man...", 
	"Truly I have no idea, here's my best guess",
	"Oh! I actually know this one!",
	"That's a thinker for sure, maybe this will work?",
	"I've had enough."
]

func _on_converse_window_close_requested() -> void:
	GlobalData.open_tabs.erase("converse")
	get_parent().queue_free()


func _on_line_edit_text_submitted(new_text: String) -> void:
	var newchat = Label.new()
	newchat.text = new_text
	newchat.add_theme_color_override("font_color", Color(0.65, 0.65, 0.65, 1.0))
	$CenterContainer/VBoxContainer.add_child(newchat)
	await get_tree().create_timer(0.5).timeout
	var response = Label.new()
	response.text = responses.pick_random()
	response.add_theme_color_override("font_color", Color(1.0, 1.0, 1.0, 1.0))
	$CenterContainer/VBoxContainer.add_child(response)
	$CenterContainer/VBoxContainer.move_child($CenterContainer/VBoxContainer/LineEdit, $CenterContainer/VBoxContainer.get_child_count()-1)
	$CenterContainer/VBoxContainer/LineEdit.text = ""
