extends Area3D


func _on_body_entered(body: Node3D) -> void:
	QuestManager.update_description("quest1", "Well done, now see the bean like shape.")
	QuestManager.update_requirements("quest1", "req", true)
