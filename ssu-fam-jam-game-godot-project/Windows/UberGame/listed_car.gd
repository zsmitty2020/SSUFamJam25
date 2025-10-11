extends Control

var duration:int = randi_range(15, 60)
var reward:float = randf_range(30.00, 100.00)
var running:bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.wait_time = duration
	$VBoxContainer/HBoxContainer/CarOptions/VBoxContainer/PaymentLabel.text = "Reward: $%d" %reward
	$VBoxContainer/HBoxContainer/CarOptions/VBoxContainer/RideTime.text = "Ride Time: %d seconds" %duration
	GlobalData.inventory["Active Cars"] += 1
	$VBoxContainer/HBoxContainer/VBoxContainer/CarName.text = "Car %d" %GlobalData.inventory["Active Cars"]
	#print(GlobalData.inventory["Active Cars"])
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if running:
		var percent = float( ($Timer.time_left / $Timer.wait_time) - 1 ) * -100
		percent = snappedf(percent, 0.01)
		$VBoxContainer/DriveTime.value = percent
		#print(percent)


func _on_timer_timeout() -> void:
	GlobalData.balance += reward
	#print("time out")
	self.queue_free()
	GlobalData.inventory["Active Cars"] -= 1


func _on_accept_button_pressed() -> void:
	$Timer.start()
	running = true


func _on_reject_button_pressed() -> void:
	self.queue_free()
	GlobalData.inventory["Active Cars"] -= 1
