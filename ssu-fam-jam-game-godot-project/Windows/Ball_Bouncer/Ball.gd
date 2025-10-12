extends Area2D

var screen_size
var speed_upgrade_amount = 0
var value_upgrade_amount = 0

@export var speed = 0.75
var bounce_value = 0.05

func _on_ball_ready() -> void:
	position.x = randi_range(10,320)
	position.y = randi_range(10,320)
	rotation = randi_range(10,320)
	screen_size = get_viewport_rect().size


func _process(_delta: float) -> void:
	var dx = speed * cos(rotation)
	var dy = -1 * speed * sin(rotation)
	position.x += dx
	position.y += dy
	if position.x > 490:
		position.x = 490
		dx *= -1
		GlobalData.balance += bounce_value

	if position.x < 0:
		position.x = 0
		dx *= -1
		GlobalData.balance += bounce_value

	if position.y > screen_size.y:
		position.y = screen_size.y
		dy *= -1
		GlobalData.balance += bounce_value

	if position.y < 0:
		position.y = 0
		dy *= -1
		GlobalData.balance += bounce_value
	rotation_degrees = rad_to_deg(atan2(-dy, dx))
	position = position.clamp(Vector2.ZERO, screen_size)
	GlobalData.balance = snappedf(GlobalData.balance,0.01)
