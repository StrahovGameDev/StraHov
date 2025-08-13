extends Area3D

var quest_from_sort: String = tr("QUEST1_NAME")
var sortos_description: String = tr("QUEST1_DESCRIPTION1") + "," + tr("QUEST1_DESCRIPTION2") + "," + tr("QUEST1_DESCRIPTION3") + "," + tr("QUEST1_DESCRIPTION4")


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		npc_quest(quest_from_sort, sortos_description)

func npc_quest(quest_name, description) -> void:
	QuestManager.add_quest(quest_name, description)
