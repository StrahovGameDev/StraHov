extends CanvasLayer

var pausable = true

func _ready() -> void:
	$".".visible = false

func _input(event: InputEvent) -> void:
	
	if event.is_action_pressed("escape") and pausable:
		get_tree().paused = true
		$".".visible = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	

func _on_resume_pressed() -> void:
	get_tree().paused = false
	$".".visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _on_quit_pressed() -> void:
	get_tree().quit()
	
func _on_cutscene_manager_started() -> void:
	pausable = false
	
func _on_cutscene_manager_finished() -> void:
	pausable = true
