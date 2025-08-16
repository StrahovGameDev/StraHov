extends Resource
class_name QuestData

## A single unique word as quest identifier
@export var quest_unique_name: String
## Quest name is shown inside game
@export var quest_name: String
@export_multiline var quest_description: String
@export var quest_completed: bool
@export var quest_requirements: Dictionary
