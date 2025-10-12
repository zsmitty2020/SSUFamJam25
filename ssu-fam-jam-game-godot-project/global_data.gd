extends Node

var previous_accounts = Save.new()

var inventory = {"Active Cars":0,"Total Cars":0}
var balance:float = 0.00
var open_tabs:Array[String] = []

var survey_time:float = 120
var survey_timer:float = survey_time
var survey_count:int = 3

var converse_credits = 0
var clipboard = null
var conversed = false

var adview_bank = 0

var update_timer = 30
var num_updates = 0

var stocks:Dictionary[String, Array] = {}
var volatility:Dictionary[String, float] = {}
var volatility_cycle:Dictionary[String, int] = {}
var stockpeak = 200
var stockmin = 0.01
var stocktime = 15
var stocktimer = stocktime

func _ready():
	if ResourceLoader.exists("user://previousaccounts.tres"):
		previous_accounts = previous_accounts.load_save()
	else:
		previous_accounts.write_save()
	
	var letters:Array[String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
	var title:String = ""
	for i in range(10):
		title = ""
		for v in range(3):
			title += letters.pick_random()
		stocks[title] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
		volatility[title] = randf_range(0.01, 10)
		volatility_cycle[title] = randi_range(1, 10)
	for i in stocks.keys():
		for v in range(25):
			update_stock(i)

func _process(delta: float) -> void:
	update_timer -= delta
	if update_timer < 0:
		num_updates += 1
		update_timer = randf_range(30, max(30, 240.0*(1.0/max(1, num_updates/4.0))))
		get_tree().get_root().add_child(preload("res://Windows/Winwoes/Winwoes.tscn").instantiate())
	survey_timer -= delta
	if survey_timer < 0:
		survey_count += 3
		survey_timer = survey_time
	stocktimer -= delta
	if stocktimer < 0:
		stocktimer = stocktime
		for i in stocks.keys():
			update_stock(i)


func update_stock(stock_name:String):
	var price = stocks[stock_name][stocks[stock_name].size()-1]
	if randi()%2==1:
		price = min(stockpeak, price+volatility[stock_name])
	else:
		price = max(stockmin, price-volatility[stock_name])
	stocks[stock_name].append(price)
	stocks[stock_name].remove_at(0)
	volatility_cycle[stock_name] -= 1
	if volatility_cycle[stock_name] <= 0:
		volatility_cycle[stock_name] = randi_range(1, 10)
		volatility[stock_name] = randf_range(0.01, 10)


func reset():
	previous_accounts.previous_accounts.insert(0, balance)
	while previous_accounts.previous_accounts.size() > 10:
		previous_accounts.previous_accounts.remove_at(previous_accounts.previous_accounts.size()-1)
	previous_accounts.write_save()
	inventory = {"Active Cars":0,"Total Cars":0}
	balance = 0.0
	open_tabs = []
	survey_time = 120
	survey_timer = survey_time
	survey_count = 3
	converse_credits = 0
	clipboard = null
	conversed = false
	adview_bank = 0
	update_timer = 30
	num_updates = 0
	stocks = {}
	volatility = {}
	volatility_cycle = {}
	stockpeak = 200
	stockmin = 0.01
	stocktime = 15
	stocktimer = stocktime
	var letters:Array[String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
	var title:String = ""
	for i in range(10):
		title = ""
		for v in range(3):
			title += letters.pick_random()
		stocks[title] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
		volatility[title] = randf_range(0.01, 10)
		volatility_cycle[title] = randi_range(1, 10)
	for i in stocks.keys():
		for v in range(25):
			update_stock(i)
