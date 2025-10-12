extends TextureRect

var working = false
var focused = false

func _ready() -> void:
	if GlobalData.inventory.has("license"):
		$Warning.queue_free()
		
func _process(delta: float) -> void:
	if working and focused:
		$ColorRect/ProgressBar.value += delta
		if $ColorRect/ProgressBar.value >= $ColorRect/ProgressBar.max_value:
			working = false
			$Export.visible = true


func _on_doodlr_window_close_requested() -> void:
	GlobalData.open_tabs.erase("doodlr")
	get_parent().queue_free()


func _on_button_pressed() -> void:
	if GlobalData.inventory.has("license"):
		$Warning.queue_free()


func _on_new_project_pressed() -> void:
	working = true
	$ColorRect/ProgressBar.value = 0


func _on_export_pressed() -> void:
	$Export.visible = false
	$ColorRect/ProgressBar.value = 0
	GlobalData.art_finished = true


func _on_doodlr_window_focus_entered() -> void:
	focused = true


func _on_doodlr_window_focus_exited() -> void:
	focused = false
