extends Area2D

var screen_size
@export var speed = 0.75


func _on_ball_ready() -> void:
	screen_size = get_viewport_rect().size


func _process(_delta: float) -> void:
	print(GlobalData.balance)
	var dx = speed * cos(deg_to_rad(rotation_degrees))
	var dy = -1 * speed * sin(deg_to_rad(rotation_degrees))
	position.x += dx
	position.y += dy
	if position.x > 490:
		position.x = 490
		dx *= -1
		GlobalData.balance += 0.01

	if position.x < 0:
		position.x = 0
		dx *= -1
		GlobalData.balance += 0.01

	if position.y > screen_size.y:
		position.y = screen_size.y
		dy *= -1
		GlobalData.balance += 0.01

	if position.y < 0:
		position.y = 0
		dy *= -1
		GlobalData.balance += 0.01
	rotation_degrees = rad_to_deg(atan2(-dy, dx))
	position = position.clamp(Vector2.ZERO, screen_size)
