extends Area2D
var screen_size
@export var speed = 200 # How fast the player will move (pixels/sec).


func _on_ready() -> void:
	screen_size = get_viewport_rect().size

func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	velocity.y += 1
	if Input.is_action_pressed("flappy_fly_jump"):
		velocity.y -= 2
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$FlappyFly.play()
	else:
		$FlappyFly.stop()
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
