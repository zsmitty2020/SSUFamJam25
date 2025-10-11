extends Label

var titles:Array[String] = [
	"What is your home address?",
	"What is your full name?",
	"Where did you graduate elementary school?",
	"What is the name of your first pet?",
	"Describe your first experience with recreational fentanyl",
	"Why are you like this?",
	"What is the mitochondria?",
	"Please don't leave this blank, it's been so lonely..."
]

func _ready() -> void:
	text = titles.pick_random()
