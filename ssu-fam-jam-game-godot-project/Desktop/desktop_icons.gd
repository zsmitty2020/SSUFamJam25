
extends TextureButton
class_name DesktopIcon


@export var link:PackedScene
@export var image:CompressedTexture2D
@export var label:String = "Title"



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.texture_normal = image
	get_node("Label").text = label
	




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_pressed() -> void:
	var thing = link.instantiate()
	self.get_parent().add_child(thing)
