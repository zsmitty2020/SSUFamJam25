extends RichTextLabel

var titles:Array[String] = [
	"[url]Click here to complete a survey and earn $$$[/url]",
	"[url]Make BIG money by clicking HERE[/url]",
	"[url]This survey only takes a few seconds![/url]",
	"[url]Don't miss out on our SPECIAL offer before it expires[/url]",
	"[url]Lots of rewards for participants of our survey[/url]",
	"[url]give us your personal information, we will sell it.[/url]",
	"[url]I dont like you, you dont like me, but we can do a lot for each other if you click HERE[/url]",
	"[url]A few quick clicks can get you CASH[/url]",
	"[url]Looking for people to participate in our survey, do you qualify?[/url]",
	"[url]Click here to see if you qualify for our IMMENSE rewards[/url]",
]

func _ready() -> void:
	text = titles.pick_random()
