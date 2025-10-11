extends VBoxContainer

signal interact

func interaction(_miscvar) -> void:
	interact.emit()
