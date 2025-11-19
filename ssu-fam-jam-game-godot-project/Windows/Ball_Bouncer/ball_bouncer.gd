extends TextureRect

var balls = preload("res://Windows/Ball_Bouncer/ball.tscn")

func _ready() -> void:
	for i in GlobalData.ball_amount:
		create_ball()
	for i in $sack.get_children():
		for j in GlobalData.speed_upgrade_amount:
			i.speed += 0.75

func _process(_delta: float) -> void:
	$Purchase/PurchaseBallButton.text = "Purchase Ball: $" + "%.2f"%GlobalData.create_ball_price
	$Purchase/PurchaseSpeedButton.text = "Purchase Speed: $" + "%.2f"%GlobalData.speed_price
	$Purchase/PurchaseBounceValueButton.text = "Purchase Bounce \nValue: $" + "%.2f"%GlobalData.bounce_value_price

func _on_ball_bouncer_close_requested() -> void:
	GlobalData.open_tabs.erase("ballbouncer")
	get_parent().hide()
	
func create_ball():
	var spawn_balls = balls.instantiate()
	$sack.add_child(spawn_balls)

func _on_button_pressed() -> void:
	if GlobalData.ball_amount < 5:
		if GlobalData.balance >= GlobalData.create_ball_price:
			GlobalData.balance -= GlobalData.create_ball_price
			create_ball()
			GlobalData.create_ball_price += 75.0
			GlobalData.ball_amount += 1

func _on_purchase_speed_button_pressed() -> void:
	for i in $sack.get_children():
		if GlobalData.speed_upgrade_amount < 5:
			if GlobalData.balance >= GlobalData.speed_price:
				GlobalData.balance -= GlobalData.speed_price
				i.speed += 0.75
				GlobalData.speed_upgrade_amount += 1
				GlobalData.speed_price += 45.0


func _on_purchase_bounce_value_button_pressed() -> void:
	for i in $sack.get_children():
		if GlobalData.value_upgrade_amount < 10:
			if GlobalData.balance >= GlobalData.bounce_value_price:
				GlobalData.balance -= GlobalData.bounce_value_price
				GlobalData.bounce_value += 0.05
				GlobalData.value_upgrade_amount += 1
				GlobalData.bounce_value_price += 95.0
