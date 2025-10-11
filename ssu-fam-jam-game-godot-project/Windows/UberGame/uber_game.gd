extends Window

var trip_cooldown:int = randi_range(5, 30)
var listing:PackedScene = preload("res://Windows/UberGame/listed_car.tscn")
var car_cost:float = 500.00
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GlobalData.inventory["Total Cars"] > 0:
		$VBoxContainer/CarsOwned.text = "Cars Owned: %d" %GlobalData.inventory["Total Cars"]
		$NewTrip.start()
		for i in range(1, GlobalData.inventory["Total Cars"] + 1):
			car_cost *= 1.127
		#print("started")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	#print($NewTrip.time_left)

func set_cooldown():
	trip_cooldown = randi_range(5, 30)
	$NewTrip.wait_time = trip_cooldown

func create_trip() -> void:
	if GlobalData.inventory["Total Cars"] != GlobalData.inventory["Active Cars"]:
		$VBoxContainer/ScrollContainer/VBoxContainer.add_child(listing.instantiate())

func _on_new_trip_timeout() -> void:
	set_cooldown()
	create_trip()
	$NewTrip.start()
	



func _on_close_requested() -> void:
	GlobalData.open_tabs.erase("dryft")
	self.queue_free()


func _on_buy_button_pressed() -> void:
	if GlobalData.balance >= car_cost:
		GlobalData.inventory["Total Cars"] += 1
		$NewTrip.start()
		car_cost = car_cost * 1.127
		$VBoxContainer/BuyButton.text = "Buy Self-Driving Car: %d" %car_cost
	
