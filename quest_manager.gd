extends Node

# I do not have to type quest_added(index), it works without it... so be it
signal quest_added

var quest_array: Array = []


func add_quest(quest):
	quest_array.append(quest)
	var quest_index: int = quest_array.size() - 1
#	This goes directly into QuesLabels function add_quest_label(index)
	quest_added.emit(quest_index)
	print(quest_array)
