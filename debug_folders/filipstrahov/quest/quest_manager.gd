extends Node

# I do not have to type quest_added(quest_index), it works without it... so be it
signal quest_added
signal quest_removed

signal description_updated
signal quest_completed

var quest_dictionary: Dictionary = {}


func add_quest(quest_unique_name: String) -> void:
	var quest: Resource = _find_quest(quest_unique_name)
	print(quest)
	quest_added.emit(quest)

func update_description(quest_unique_name: String, new_description: String) -> void:
	var quest: Resource = _find_quest(quest_unique_name)
	quest.quest_description += "\n" + new_description
	description_updated.emit(quest.quest_description)


func update_requirements(quest_unique_name: String, key: String, value: bool) -> void:
	var quest: Resource = _find_quest(quest_unique_name)
	quest.quest_requirements[key] = value


func check_requirements(quest_unique_name: String, key: String) -> bool:
	var quest: Resource = _find_quest(quest_unique_name)
	return quest.quest_requirements[key]



func complete_quest(quest_unique_name: String) -> void:
	var quest: Resource = _find_quest(quest_unique_name)
	quest.quest_completed = true
	quest_completed.emit(quest)


func _find_quest(quest_unique_name: String) -> Resource:
	var quest: Resource = quest_dictionary[quest_unique_name]
	return quest








func fail_quest():
	pass
