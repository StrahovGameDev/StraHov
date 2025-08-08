extends Control

@onready var vbox = $VBoxContainer

func _ready() -> void:
	QuestManager.quest_added.connect(add_quest_label)


func add_quest_label(index) -> void:
	var button: Button = Button.new()
	button.text = QuestManager.quest_array[index].get("name")
	button.pressed.connect(_on_quest_button_pressed.bind(index))
	vbox.add_child(button)

func _on_quest_button_pressed(index):
	var quest = QuestManager.quest_array[index].get("description")
	print(quest)
	
