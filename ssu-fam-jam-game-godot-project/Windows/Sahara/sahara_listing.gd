extends Control

@export var image:CompressedTexture2D
@export var item_name:String
@export var item_description:String
@export var item_cost:float
@export var dict_key:String
@export var dict_value:int
@export var multipurchase:bool = false



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print("doin it")
	$HBoxContainer/TextureRect.texture = image
	$"HBoxContainer/VBoxContainer/Item Name".text = item_name +": $%f"%item_cost
	$"HBoxContainer/VBoxContainer/Item Description".text = item_description
	update_cost()
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_cost():
	if GlobalData.inventory.has(dict_key):
		for i in range(GlobalData.inventory[dict_key]):
			item_cost = item_cost * 1.127
	$"HBoxContainer/VBoxContainer/Item Name".text = item_name +": $%.2f"%item_cost
		


func _on_button_pressed() -> void:
	if GlobalData.balance >= item_cost:
		GlobalData.balance -= item_cost
		GlobalData.inventory[dict_key] += dict_value
		if !multipurchase:
			$HBoxContainer/Button.disabled = true
			$HBoxContainer/Button.text = "Out of Stock!"
		item_cost = item_cost * 1.127
		update_cost()
		
