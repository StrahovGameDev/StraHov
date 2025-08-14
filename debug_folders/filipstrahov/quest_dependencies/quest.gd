extends Node
class_name Quest

@export var quest_data: QuestData


func add_quest():
	#var new_quest: Resource = quest_data.duplicate(true)
	QuestManager.quest_array.append(quest_data)
	QuestManager.add_quest()
	#queue_free()
	



func is_complete():
	if quest_data.quest_completed:
		print("quest completed")
	else:
		print("quest not completed")
