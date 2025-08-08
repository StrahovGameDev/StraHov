extends Area3D

var quest_from_franta: String = "This is your SECOND quest."
var description_franta: String = "Aha, I see, you are truly quest hunting beast. This quest is not easy, so listen up..."


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		npc_quest(quest_from_franta, description_franta)

func npc_quest(quest_name, description) -> void:
	QuestManager.add_quest(quest_name, description)
