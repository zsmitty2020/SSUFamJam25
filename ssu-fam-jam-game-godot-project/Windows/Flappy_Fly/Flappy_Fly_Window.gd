extends Node


@export var building_maker : PackedScene


var game_running : bool
var game_over : bool
var scroll
var score
const SCROLL_SPEED : int = 4
var screen_size : Vector2i
var ground_height : int
var buildings : Array
const building_DELAY : int = 100
const building_RANGE : int = 200


func _ready():
	screen_size = get_window().size
	ground_height = 475
	new_game()

	
func input_check():
	if Input.is_action_pressed("flappy_fly_jump"):
		if game_over == false:
			if game_running == false:
				start_game()
			else:
				if $FlyPlayer.flying:
					$FlyPlayer.flap()
					$flap.playing = true
					check_top()
		else:
			buildings = []

func start_game():
	game_running = true
	$FlyPlayer.flying = true
	$FlyPlayer.flap()
	#start building timer
	$building_timer.start()

func new_game():
	#reset variables
	game_running = false
	game_over = false
	score = 0
	scroll = 0
	$ScoreLabel.text = "SCORE: " + str(score)
	$GameOver.hide()
	get_tree().call_group("buildings", "queue_free")
	#generate starting buildings
	generate_building()
	buildings.clear()
	$FlyPlayer.reset()

func _process(delta):
	input_check()
	if game_running:
		scroll += SCROLL_SPEED
		#reset scroll
		if scroll >= screen_size.x:
			scroll = 0
		#move ground node
		$ground.position.x = -scroll
		#move buildings
		for building in buildings:
			building.position.x -= SCROLL_SPEED
#

func generate_building():
	var building = building_maker.instantiate()
	building.position.x = screen_size.x + building_DELAY
	building.position.y = 400 + randi_range(-50, 80)
	building.hit.connect(FlyPlayer_hit)
	building.scored.connect(scored)
	add_child(building)
	buildings.append(building)

func _on_building_timer_timeout() -> void:
	generate_building()
	
func scored():
	score += 1
	GlobalData.flappy_tokens += 1
	$ScoreLabel.text = "SCORE: " + str(score)

func check_top():
	if $FlyPlayer.position.y < 0:
		$FlyPlayer.falling = true
		stop_game()

func stop_game():
	$building_timer.stop()
	$GameOver.show()
	$FlyPlayer.flying = false
	game_running = false
	game_over = true
	
func FlyPlayer_hit():
	$FlyPlayer.falling = true
	stop_game()

func _on_ground_hit():
	$FlyPlayer.falling = false
	stop_game()
