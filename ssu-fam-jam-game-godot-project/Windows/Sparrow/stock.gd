extends Line2D


var stockpeak = 200
var stockmin = 0.01

var volatility = randf_range(0.1, 10)
var volatility_cycle = randf_range(1, 10)

var stock_time = 0.25
var stock_timer = stock_time

var current_stock = ""

var price_history = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
var price = 0
var old_price = 0


func _ready() -> void:
	current_stock = GlobalData.stocks.keys()[0]


func _process(delta: float) -> void:
	stock_timer -= delta
	if old_price != price:
		old_price = price
		$AudioStreamPlayer.play()
	if stock_timer < 0:
		stock_timer = stock_time
		display_stock(current_stock)

func display_stock(stock_name:String):
	if stock_name != "":
		price_history = GlobalData.stocks[stock_name]
		price = price_history[-1]
		clear_points()
		for i in range(price_history.size()):
			add_point(Vector2((get_window().size.x/24.0)*i, get_window().size.y*(1-(price_history[i]-stockmin)/(stockpeak-stockmin))))
