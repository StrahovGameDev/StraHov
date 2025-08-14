extends Area3D


func _on_body_entered(body: Node3D) -> void:
	$Quest.quest_data.quest_completed = true
	$Quest.is_complete()
