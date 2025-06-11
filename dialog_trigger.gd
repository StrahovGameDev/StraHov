extends Node3D

@export var text = "Default text"

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		body.dialog_label.visible = true
		body.current_dialog = text


func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.is_in_group("player"):
		body.dialog_label.visible = false
		body.current_dialog = ""
