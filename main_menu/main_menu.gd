extends Control

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_start_pressed() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$".".queue_free()

func _on_options_pressed() -> void:
	pass # Replace with function body.
	
	
func _on_quit_pressed() -> void:
	get_tree().quit()
