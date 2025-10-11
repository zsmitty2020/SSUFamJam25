extends TextureRect


var stocks = []
var stockIndex = 0

func _ready() -> void:
	stocks = GlobalData.stocks.keys()
	$Stock.current_stock = stocks[stockIndex]


func _process(_delta: float) -> void:
	$StockTitle.text = "Current Stock: " + $Stock.current_stock
	$Price.text = "Price: $%.2f"%$Stock.price
	if GlobalData.inventory.has(stocks[stockIndex]):
		$VBoxContainer/Owned.text = "Owned: " + str(GlobalData.inventory[stocks[stockIndex]])
	else:
		$VBoxContainer/Owned.text = "Owned: 0"


func _on_sparrow_window_close_requested() -> void:
	GlobalData.open_tabs.erase("sparrow")
	get_parent().queue_free()


func _on__pressed() -> void:
	stockIndex = wrapi(stockIndex+1, 0, stocks.size()-1)
	$Stock.current_stock = stocks[stockIndex]


func _on_left_pressed() -> void:
	stockIndex = wrapi(stockIndex-1, 0, stocks.size()-1)
	$Stock.current_stock = stocks[stockIndex]


func _on_buy_pressed() -> void:
	if GlobalData.balance >= $Stock.price:
		GlobalData.balance -= $Stock.price
		if GlobalData.inventory.has(stocks[stockIndex]):
			GlobalData.inventory[stocks[stockIndex]] += 1
		else:
			GlobalData.inventory[stocks[stockIndex]] = 1


func _on_sell_pressed() -> void:
	if GlobalData.inventory.has(stocks[stockIndex]):
		if GlobalData.inventory[stocks[stockIndex]] > 0:
			GlobalData.inventory[stocks[stockIndex]] -= 1
			GlobalData.balance += $Stock.price
