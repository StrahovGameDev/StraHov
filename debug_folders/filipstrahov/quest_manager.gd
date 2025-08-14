extends Node

# I do not have to type quest_added(quest_index), it works without it... so be it
signal quest_added
signal quest_removed

var quest_array: Array = []


func add_quest():
	var quest_index: int = quest_array.size() - 1
#	This goes directly into QuestLabels function add_quest_label(index)
	quest_added.emit(quest_index)

func update_description(quest_unique_name: String, new_description: String) -> void:
	var found: bool = false
	for quest in quest_array:
		if quest.quest_unique_name == quest_unique_name:
			quest.quest_description += "\n" + new_description
			found = true
			break
	if !found:
		push_error("Quest Unique Name missing")

func fail_quest():
	pass


func complete_quest(quest_name) -> void:
	pass
