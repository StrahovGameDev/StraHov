extends Area3D

var quest_from_franta: String = tr("QUEST2_NAME")
var description_franta: String = tr("QUEST2_DESCRIPTION1") + "," + tr("QUEST2_DESCRIPTION2") + "," + tr("QUEST2_DESCRIPTION3") + "," + tr("QUEST2_DESCRIPTION4")


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		npc_quest(quest_from_franta, description_franta)

func npc_quest(quest_name, description) -> void:
	QuestManager.add_quest(quest_name, description)
