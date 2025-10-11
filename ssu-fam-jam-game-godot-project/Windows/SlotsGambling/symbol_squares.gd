extends Node2D

var value = -1

var cherry = preload("res://Windows/SlotsGambling/GamblingAssets/cherry.png")

func roll():
	value = randi_range(0,3)
	eval()

func eval():
	for chitlen in $".".get_children():
		chitlen.visible = false
	match value:
		0:
			$cherry.visible = true
		1:
			$lemon.visible = true
		2:
			$bell.visible = true
		3:
			$bar.visible = true
		_:
			print("NOOOOOOOOOOO")
