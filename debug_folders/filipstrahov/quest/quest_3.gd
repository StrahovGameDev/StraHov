extends Area3D


func _on_body_entered(body: Node3D) -> void:
	if QuestManager.quest_array[0].quest_requirements == "good":
		QuestManager.update_description("quest1", "Your job here is done")
	else:
		print("You cant finish this quest yet.")
