extends VBoxContainer

signal interact

var diddled = false

func interaction(_miscvar) -> void:
	if not diddled:
		diddled = true
		interact.emit()
