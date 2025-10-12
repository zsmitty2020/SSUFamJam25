extends Control

@export var slot1 := Node2D
@export var slot2 := Node2D
@export var slot3 := Node2D

var betSize = 1
var money = 0
var rolling = false
var canRoll = true

func _ready():
	money = GlobalData.slotsCredits
	updateLabels()

func _process(_delta):
	if GlobalData.balance < 50:
		$InsertCash.disabled = true
	else:
		$InsertCash.disabled = false
		
	if rolling:
		for slot in $".".get_children():
				if slot.is_in_group("slots"):
					slot.roll()
	
func payMoney():
	if money >= 5:
		money -= betSize
		updateLabels()
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
	updateLabels()
	print(money)


func _on_ten_percent_pressed():
	#10% Button
		if canRoll:
			betSize = int(0.10 * money)
			if payMoney():
				$Timer.start()
				canRoll = false
				rolling = true
				$slotRollSFX.play()
				disableButtons()
				

func _on_fifty_percent_pressed():
	#50% Button
	if canRoll:
			betSize = int(0.50 * money)
			if payMoney():
				$Timer.start()
				canRoll = false
				rolling = true
				$slotRollSFX.play()
				disableButtons()


func _on_hundred_percent_pressed():
	#100% Button
	if canRoll:
			betSize = money
			if payMoney():
				$Timer.start()
				canRoll = false
				rolling = true
				$slotRollSFX.play()
				disableButtons()

func updateLabels():
	if int(0.10 * money) < 5:
		$HBoxContainer/TenPercent.disabled = true
	else:
		$HBoxContainer/TenPercent.disabled = false
	if int(0.50 * money) < 5:
		$HBoxContainer/FiftyPercent.disabled = true
	else:
		$HBoxContainer/FiftyPercent.disabled = false
	if money < 5:
		$HBoxContainer/HundredPercent.disabled = true
	else:
		$HBoxContainer/HundredPercent.disabled = false
	if money == 0:
		$CashOut.disabled = true
	else:
		$CashOut.disabled = false

	$Label.text = "Credits: " + str(money)
	$HBoxContainer/TenPercent.text = "Bet 10%: " + str(int(0.10 * money)) + " Creds"
	$HBoxContainer/FiftyPercent.text = "Bet 50%: " + str(int(0.50 * money)) + " Creds"
	$HBoxContainer/HundredPercent.text = "Bet 100%: " + str(money) + " Creds"
	
func disableButtons():
	$HBoxContainer/TenPercent.disabled = true
	$HBoxContainer/FiftyPercent.disabled = true
	$HBoxContainer/HundredPercent.disabled = true

func enableButtons():
	$HBoxContainer/TenPercent.disabled = false
	$HBoxContainer/FiftyPercent.disabled = false
	$HBoxContainer/HundredPercent.disabled = false
	
func _on_insert_cash_pressed():
	GlobalData.balance -= 50
	money += 50
	updateLabels()

func _on_cash_out_pressed():
	GlobalData.balance += money
	money -= money
	updateLabels()
