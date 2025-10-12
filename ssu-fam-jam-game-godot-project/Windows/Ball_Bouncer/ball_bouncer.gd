extends TextureRect

var balls = preload("res://Windows/Ball_Bouncer/ball.tscn")
var create_ball_price = 25.0
var speed_price = 20.0
var bounce_value_price = 75.0
var ball_amount = 0



func _process(_delta: float) -> void:
	$Purchase/PurchaseBallButton.text = "Purchase Ball: $" + "%.2f"%create_ball_price
	$Purchase/PurchaseSpeedButton.text = "Purchase Speed: $" + "%.2f"%speed_price
	$Purchase/PurchaseBounceValueButton.text = "Purchase Bounce \nValue: $" + "%.2f"%bounce_value_price

func _on_ball_bouncer_close_requested() -> void:
	GlobalData.open_tabs.erase("ballbouncer")
	get_parent().queue_free()
	
func create_ball():
	var spawn_balls = balls.instantiate()
	$sack.add_child(spawn_balls)

func _on_button_pressed() -> void:
	if ball_amount < 5:
		if GlobalData.balance >= create_ball_price:
			GlobalData.balance -= create_ball_price
			create_ball()
			create_ball_price += 75.0
			ball_amount += 1

func _on_purchase_speed_button_pressed() -> void:
	for i in $sack.get_children():
		if i.speed_upgrade_amount < 5:
			if GlobalData.balance >= speed_price:
				GlobalData.balance -= speed_price
				i.speed += 0.75
				i.speed_upgrade_amount += 1
				speed_price += 45.0


func _on_purchase_bounce_value_button_pressed() -> void:
	for i in $sack.get_children():
		if i.value_upgrade_amount < 10:
			if GlobalData.balance >= bounce_value_price:
				GlobalData.balance -= bounce_value_price
				i.bounce_value += 0.05
				i.value_upgrade_amount += 1
				bounce_value_price += 95.0
