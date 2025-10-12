class_name Save
extends Resource

@export var previous_accounts := []

func write_save() -> void:
	ResourceSaver.save(self, "user://saveData.tres")

func load_save() -> Resource:
	if ResourceLoader.exists("user://saveData.tres"):
		return load("user://saveData.tres")
	return null
