extends CharacterBody2D

const GRAVITY: int = 800
const max_velocity: int = 400
const speed: int = -300
var flying: bool = false
var falling: bool = false
const start_pos = Vector2(200,180)



func _on_ready() -> void:
	reset()
	
func reset():
	flying = false
	falling = false
	position = start_pos
	set_rotation(-90)
	

func _physics_process(delta):
	if flying or falling:
		velocity.y +=GRAVITY * delta
		if velocity.y > max_velocity:
			velocity.y = max_velocity
		if flying:
			set_rotation(deg_to_rad(velocity.y*0.05)-90)
			$FlappyFly.play()
		elif falling:
			set_rotation(PI/2-90)
			$FlappyFly.stop()
		move_and_collide(velocity * delta)
	else:
		$FlappyFly.stop()

func flap():
	velocity.y = speed

	
