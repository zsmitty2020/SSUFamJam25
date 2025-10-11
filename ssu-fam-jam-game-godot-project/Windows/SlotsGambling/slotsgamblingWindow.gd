extends Window




func _on_close_requested():
	GlobalData.open_tabs.erase("slotsgambling")
	self.queue_free()
