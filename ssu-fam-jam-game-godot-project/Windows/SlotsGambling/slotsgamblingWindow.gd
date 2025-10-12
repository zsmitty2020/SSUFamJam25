extends Window




func _on_close_requested():
	GlobalData.open_tabs.erase("slotsgambling")
	GlobalData.slotsCredits = $Container.money
	self.queue_free()
