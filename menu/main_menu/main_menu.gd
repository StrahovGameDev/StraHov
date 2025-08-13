extends CanvasLayer

# Emits when start button was pressed
signal start

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$main_menu/VBoxContainer/Start.text = tr("START")
	$main_menu/VBoxContainer/Options.text = tr("OPTIONS")
	$main_menu/VBoxContainer/Quit.text = tr("QUIT")
	
func _on_start_pressed() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$".".queue_free()
	$"../CutsceneManager".play_cutscene("cutscene1_1")
	start.emit()

func _on_options_pressed() -> void:
	pass # Replace with function body.
	
func _on_quit_pressed() -> void:
	get_tree().quit()
