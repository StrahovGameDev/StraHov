extends Control

@onready var vbox = $VBoxContainer

func _ready() -> void:
	QuestManager.quest_added.connect(add_quest_label)


func add_quest_label(index) -> void:
	var label: Label = Label.new()
	label.text = QuestManager.quest_array[index]
	vbox.add_child(label)

func remove_quest_label() -> void:
	pass
	
