extends Window

@onready var flappyListing = $"Sahara/ScrollContainer/HBoxContainer/VBoxContainer/SaharaListing4"
@onready var flappyListingName = $"Sahara/ScrollContainer/HBoxContainer/VBoxContainer/SaharaListing4/HBoxContainer/VBoxContainer/Item Name"
@onready var flappyListingButton = $"Sahara/ScrollContainer/HBoxContainer/VBoxContainer/SaharaListing4/HBoxContainer/Button"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.size_changed.connect(_on_viewport_size_changed)
	flappyListingButton.text = "Convert Now!"
	_on_viewport_size_changed()


func _on_viewport_size_changed():
	var viewport_size = self.size
	$Sahara.set_size(viewport_size)
	#print("thing")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	flappyListing.item_cost = GlobalData.flappy_tokens * 0.25
	flappyListingName.text = flappyListing.item_name +": $%0.2f"%flappyListing.item_cost

func _on_close_requested() -> void:
	GlobalData.open_tabs.erase("Sahara")
	self.queue_free()
