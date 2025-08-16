extends CanvasLayer

@onready var vbox = $QuestLabels/VBoxContainer

func _ready() -> void:
	QuestManager.quest_added.connect(add_quest_label)
	QuestManager.description_updated.connect(_on_description_updated)
	visible = false


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("quest_label"):
		visible = !visible
		if visible:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func add_quest_label(quest_unique_name) -> void:
	var button: Button = Button.new()
	button.text = quest_unique_name.quest_name
	button.pressed.connect(_on_quest_button_pressed.bind(quest_unique_name))
	vbox.add_child(button)
func _on_quest_button_pressed(quest_unique_name):
	var quest = quest_unique_name.quest_description
	$QuestLabels/ColorRect/QuestDescription.text = quest
	$QuestLabels/ColorRect.show()

func _on_button_pressed() -> void:
	hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _on_description_updated(quest_description):
	$QuestLabels/ColorRect/QuestDescription.text = quest_description
