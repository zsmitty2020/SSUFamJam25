extends Window

var preloadIce = preload("res://Windows/GameTester/GameObjects/IcePile.tscn")
var icetempvar = 0
var beforeGame = true
var money = 0.0

func _ready():
	if not GlobalData.inventory.has("Controller"):
		$ControllerNotice.show()
	else:
		startBlackout()

func _process(_delta):
	checkController()

func checkController():
	if beforeGame:
		$BlackoutSurvivalBaseNode/blackoutCharacter.global_position = Vector3(0,1,0)
		$BlackoutSurvivalBaseNode/blackoutCharacter.inIce = true
		if GlobalData.inventory.has("Controller"):
			startBlackout()
			beforeGame = false

func startBlackout():
	$IceSpawner.start(0.1)
	$BlackoutSurvivalBaseNode/blackoutCharacter.inIce = false
	$BlackoutSurvivalBaseNode/blackoutCharacter/Timer.start()
	$ControllerNotice.hide()
	$MoneyTimer.start()

func spawnIce():
	var newIce = preloadIce.instantiate()
	$BlackoutSurvivalBaseNode/IceBox.add_child(newIce)
	var x = randi_range(-25, 25)
	var z = randi_range(-25, 25)
	newIce.global_transform.origin = Vector3(x, 0.25, z)
	
func endGame():
	cashOut()
	queue_free()

func _on_ice_spawner_timeout():
	if icetempvar <= 5:
		spawnIce()
		spawnIce()
	else:
		spawnIce()
	$IceSpawner.start(10)

func addMoney():
	money += 0.01
	$MoneyLabel.text = "Money Earned On Death: $" + str(snappedf(money,0.01))

func cashOut():
	GlobalData.balance += money


func _on_money_timer_timeout():
	addMoney()


func _on_button_pressed():
	#for testing
	GlobalData.inventory.get_or_add("Controller", 1)


func _on_close_requested():
	GlobalData.open_tabs.erase("blackoutsurvival")
	self.queue_free()
