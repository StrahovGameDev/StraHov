extends Control


func _on_start_pressed() -> void:
	$".".queue_free()



func _on_options_pressed() -> void:
	pass # Replace with function body.
	
	
func _on_quit_pressed() -> void:
	get_tree().quit()
