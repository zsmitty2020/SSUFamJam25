extends Node2D

@export var slot1 := Node2D
@export var slot2 := Node2D
@export var slot3 := Node2D

var betSize = 1
var money = 50
var rolling = false
var canRoll = true


func _process(_delta):
	if rolling:
		for slot in $".".get_children():
				if slot.is_in_group("slots"):
					slot.roll()
	
func payMoney():
	if money >= 5:
		money -= betSize
		return true
	else:
		print("NO MONEY! GET KICKED OUT")
		return false
		
func rewardMoney():
	if slot1.value == 3 and slot2.value == 3 and slot3.value == 3:
		money += 10*betSize
		return true
	elif slot1.value == 2 and slot2.value == 2 and slot3.value == 2:
		money += 7*betSize
		return true
	elif slot1.value == 1 and slot2.value == 1 and slot3.value == 1:
		money += 5*betSize
		return true
	elif slot1.value == 0 and slot2.value == 0 and slot3.value == 0:
		money += 3*betSize
		return true
	elif slot1.value == 0 and slot2.value == 0 and slot3.value != 0:
		money += 2*betSize
		return true
	elif slot1.value != 0 and slot2.value == 0 and slot3.value == 0:
		money += 2*betSize
		return true
	elif slot1.value == 0 and slot2.value != 0 and slot3.value == 0:
		money += 2*betSize
		return true
	elif slot1.value == 0 and slot2.value != 0 and slot3.value != 0:
		money += 1*betSize
		return true
	elif slot1.value != 0 and slot2.value == 0 and slot3.value != 0:
		money += 1*betSize
		return true
	elif slot1.value != 0 and slot2.value != 0 and slot3.value == 0:
		money += 1*betSize
		return true
	else:
		print("boowomp")
		return false

func _on_timer_timeout():
	canRoll = true
	rolling = false
	for slot in $".".get_children():
		if slot.is_in_group("slots"):
			slot.roll()
	if rewardMoney():
		$winSFX.play()
	else:
		$loseSFX.play()
		
	$slotRollSFX.stop()
	$Label.text = "Credits: " + str(money)
	$TenPercent.text = "Bet 10%: " + str(int(0.10 * money)) + " Creds"
	$FiftyPercent.text = "Bet 50%: " + str(int(0.50 * money)) + " Creds"
	$HundredPercent.text = "Bet 100%: " + str(money) + " Creds"
	print(money)


func _on_button_pressed():
	#10% Button
		if canRoll:
			betSize = int(0.10 * money)
			if payMoney():
				$Timer.start()
				canRoll = false
				rolling = true
				$slotRollSFX.play()

func _on_fifty_percent_pressed():
	#50% Button
	if canRoll:
			betSize = int(0.50 * money)
			if payMoney():
				$Timer.start()
				canRoll = false
				rolling = true
				$slotRollSFX.play()


func _on_hundred_percent_pressed():
	#100% Button
	if canRoll:
			betSize = money
			if payMoney():
				$Timer.start()
				canRoll = false
				rolling = true
				$slotRollSFX.play()

func _on_cash_out_pressed():
	pass # Replace with function body.
