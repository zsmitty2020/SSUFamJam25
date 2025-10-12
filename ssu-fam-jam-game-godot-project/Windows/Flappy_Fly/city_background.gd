extends Sprite2D


func _process(_delta: float) -> void:
	if position.x < 801:
		position.x += 1
	elif position.x >= 801:
		position.x = -300
