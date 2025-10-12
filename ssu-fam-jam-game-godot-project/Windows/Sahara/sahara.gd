extends Window


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.size_changed.connect(_on_viewport_size_changed)
	_on_viewport_size_changed()

	

func _on_viewport_size_changed():
	var viewport_size = self.size
	$Sahara.set_size(viewport_size)
	#print("thing")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_close_requested() -> void:
	GlobalData.open_tabs.erase("Sahara")
	self.queue_free()
