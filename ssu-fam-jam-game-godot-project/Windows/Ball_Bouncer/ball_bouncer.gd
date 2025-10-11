extends TextureRect

var balls = preload("res://Windows/Ball_Bouncer/ball.tscn")

func _on_ball_bouncer_close_requested() -> void:
	GlobalData.open_tabs.erase("Ball_Bouncer")
	get_parent().queue_free()
	
func create_ball():
	var spawn_balls = balls.instantiate()
	$sack.add_child(spawn_balls)

func _on_button_pressed() -> void:
	create_ball()
