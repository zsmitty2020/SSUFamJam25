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

var clipboard = 0

func _ready():
	$HBoxContainer/Label.text = "Premium Credits Left: " + str(GlobalData.converse_credits)

func _on_converse_window_close_requested() -> void:
	GlobalData.open_tabs.erase("converse")
	get_parent().queue_free()


func _on_line_edit_text_submitted(new_text: String) -> void:
	var premium = false
	GlobalData.conversed = true
	if GlobalData.converse_credits > 0:
		GlobalData.converse_credits = maxi(GlobalData.converse_credits-10, 0)
		premium = true
	$HBoxContainer/Label.text = "Premium Credits Left: " + str(GlobalData.converse_credits)
	var newchat = Label.new()
	newchat.text = new_text
	if premium:
		newchat.add_theme_color_override("font_color", Color(0.753, 0.636, 0.361, 1.0))
	else:
		newchat.add_theme_color_override("font_color", Color(0.65, 0.65, 0.65, 1.0))
	$ScrollContainer/CenterContainer/VBoxContainer.add_child(newchat)
	await get_tree().create_timer(0.5).timeout
	var response = Label.new()
	response.text = responses.pick_random()
	response.add_theme_color_override("font_color", Color(1.0, 1.0, 1.0, 1.0))
	$ScrollContainer/CenterContainer/VBoxContainer.add_child(response)
	$ScrollContainer/CenterContainer/VBoxContainer.move_child($ScrollContainer/CenterContainer/VBoxContainer/LineEdit, $ScrollContainer/CenterContainer/VBoxContainer.get_child_count()-1)
	$ScrollContainer/CenterContainer/VBoxContainer/LineEdit.text = ""
	$Copy.visible = true
	if premium:
		#needs to be 66% success chance
		clipboard = randf_range(50, 100)#check if number is > 70
	else:
		#needs to be 30% success chance
		clipboard = randf_range(0, 100)#check if number is > 70


func _on_buy_credits_pressed() -> void:
	if GlobalData.balance >= 60:
		GlobalData.balance -= 60
		GlobalData.converse_credits += 100
	$HBoxContainer/Label.text = "Premium Credits Left: " + str(GlobalData.converse_credits)


func _on_copy_pressed() -> void:
	$Copy.visible = false
	GlobalData.clipboard = clipboard
	print(clipboard)
