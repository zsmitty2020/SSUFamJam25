extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().root.size_changed.connect(_on_viewport_size_changed)
	_on_viewport_size_changed()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_viewport_size_changed():
	var viewport_size = get_tree().root.size
	set_size(viewport_size)
	print("thing")
