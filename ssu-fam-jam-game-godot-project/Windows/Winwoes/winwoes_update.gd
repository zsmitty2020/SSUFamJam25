extends TextureRect

func _ready() -> void:
	var global

func _on_winwoes_close_requested() -> void:
	GlobalData.open_tabs.erase("update")
	self.queue_free()
