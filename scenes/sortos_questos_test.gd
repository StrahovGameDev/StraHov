extends Area3D

var quest_from_sort: String = "This is your first quest."


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		npc_quest(quest_from_sort)

func npc_quest(quest) -> void:
	QuestManager.add_quest(quest)
