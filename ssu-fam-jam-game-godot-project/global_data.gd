extends Node

var inventory = {}
var balance:float = 0.00
var open_tabs:Array[String] = []

var survey_time:float = 120
var survey_timer:float = survey_time
var survey_count:int = 3

var converse_credits = 0
var clipboard = null
var conversed = false

func _process(delta: float) -> void:
	survey_timer -= delta
	if survey_timer < 0:
		survey_count += 3
		survey_timer = survey_time
