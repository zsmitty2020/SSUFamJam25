extends CharacterBody3D

const SPEED = 5.0
var playerHealth = 100
var inIce = false

func _ready():
	$SubViewport/ProgressBar.value = playerHealth

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += Vector3(0, -9.8, 0) * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("blackoutLeft", "blackoutRight", "blackoutUp", "blackoutDown")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func _on_timer_timeout():
	if inIce:
		playerHealth += 10
		if playerHealth >= 100:
			playerHealth = 100
	else:
		playerHealth -= 10
		if playerHealth <= 0:
			get_tree().get_root().get_node("BlackoutSurvival").endGame()
	$SubViewport/ProgressBar.value = playerHealth
