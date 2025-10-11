extends Node

var inventory = {"Active Cars":0,"Total Cars":0}
var balance:float = 0.00
var open_tabs:Array[String] = []

var survey_time:float = 120
var survey_timer:float = survey_time
var survey_count:int = 3

var converse_credits = 0
var clipboard = null
var conversed = false

var adview_bank = 0

var update_timer = 30
var num_updates = 0

func _process(delta: float) -> void:
	update_timer -= delta
	if update_timer < 0:
		num_updates += 1
		update_timer = randf_range(30, max(30, 240.0*(1.0/max(1, num_updates/4.0))))
		get_tree().get_root().add_child(preload("res://Windows/Winwoes/Winwoes.tscn").instantiate())
	survey_timer -= delta
	if survey_timer < 0:
		survey_count += 3
		survey_timer = survey_time

func reset():
	inventory = {"Active Cars":0,"Total Cars":0}
	balance = 0.0
	open_tabs = []
	survey_time = 120
	survey_timer = survey_time
	survey_count = 3
	converse_credits = 0
	clipboard = null
	conversed = false
	adview_bank = 0
	update_timer = 30
	num_updates = 0
