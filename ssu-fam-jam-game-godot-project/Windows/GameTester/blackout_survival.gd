extends Window

var preloadIce = preload("res://Windows/GameTester/GameObjects/IcePile.tscn")

func spawnIce():
	var newIce = preloadIce.instantiate()
	$BlackoutSurvivalBaseNode/IceBox.add_child(newIce)
	
