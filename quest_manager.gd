extends Node

# I do not have to type quest_added(index), it works without it... so be it
signal quest_added

var quest_array: Array = []


func add_quest(quest_name, description):
	var new_quest: Dictionary = {
		"name": quest_name,
		"description": description
	}
	quest_array.append(new_quest)
	var quest_index: int = quest_array.size() - 1
#	This goes directly into QuesLabels function add_quest_label(index)
	quest_added.emit(quest_index)
	print(quest_array)
