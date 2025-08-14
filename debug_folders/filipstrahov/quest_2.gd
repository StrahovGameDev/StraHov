extends Area3D


func _on_body_entered(body: Node3D) -> void:
	$Quest.add_quest()
	QuestManager.update_description("unique", "new description")
