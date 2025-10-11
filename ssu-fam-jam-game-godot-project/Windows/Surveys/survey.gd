extends ScrollContainer

@export var questions:Array[PackedScene]
var interactions_needed = 0
var interactions = 0
var survey_value = randf_range(0.10, 1.00)
signal finished

func _ready():
	interactions_needed = randi_range(5, 20)
	for i in range(interactions_needed):
		var temp = questions.pick_random().instantiate()
		temp.connect("interact", interact)
		$VBoxContainer.add_child(temp)
	var temp1 = Button.new()
	temp1.text = "Finish Survey"
	temp1.connect("pressed", finish_survey)
	$VBoxContainer.add_child(temp1)

func finish_survey():
	if interactions >= interactions_needed:
		GlobalData.balance += survey_value
		$VBoxContainer.visible = false
		$CenterContainer/Reward.text = "You earned $" + "%.2f"%survey_value
		await get_tree().create_timer(5).timeout
		finished.emit()
		queue_free()

func interact():
	interactions += 1
