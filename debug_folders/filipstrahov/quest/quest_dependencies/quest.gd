extends Node
class_name Quest

@export var quest_data: QuestData


func add_quest(unique_quest_name: String) -> void:
	QuestManager.quest_dictionary[quest_data.quest_unique_name] = quest_data
	QuestManager.add_quest(unique_quest_name)
	



func is_complete():
	if quest_data.quest_completed:
		print("quest completed")
	else:
		print("quest not completed")
