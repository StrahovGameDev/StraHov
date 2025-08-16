extends Area3D


func _on_body_entered(body: Node3D) -> void:
	var req = QuestManager.check_requirements("quest1", "req")
	if req:
		QuestManager.update_description("quest1", "Your job here is done")
		QuestManager.complete_quest("quest1")
	else:
		print("You cant finish this quest yet.")
