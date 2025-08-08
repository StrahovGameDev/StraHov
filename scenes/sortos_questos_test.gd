extends Area3D

var quest_from_sort: String = "This is your first quest."
var sortos_description: String = "This is a description of the first quest. Your task is truly hard and spectacular but there is no time to explain it, hence I am out, bye."


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		npc_quest(quest_from_sort, sortos_description)

func npc_quest(quest_name, description) -> void:
	QuestManager.add_quest(quest_name, description)
