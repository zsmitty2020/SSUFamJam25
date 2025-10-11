extends Node3D

var lifetime = 10.0
var size = 10.0

func _process(delta):
	lifetime -= delta
	var tmpVec = $DaIce.get_scale()
	var newVec = Vector3(tmpVec.x - (delta/10), tmpVec.y - (delta/10), tmpVec.z - (delta/10))
	$DaIce.set_scale(newVec)
	if lifetime <= 0:
		queue_free()
