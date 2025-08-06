extends CanvasLayer

# Emits when start button was pressed
signal start

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func _on_start_pressed() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$".".queue_free()
	$"../CutsceneManager".play_cutscene("cutscene1_1")
	start.emit()

func _on_options_pressed() -> void:
	pass # Replace with function body.
	
func _on_quit_pressed() -> void:
	get_tree().quit()
