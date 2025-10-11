extends Area2D
var screen_size
@export var speed = 400 # How fast the player will move (pixels/sec).


func _on_ready() -> void:
	screen_size = get_viewport_rect().size

func _movement(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("flappy_fly_jump"):
		velocity.y += 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
