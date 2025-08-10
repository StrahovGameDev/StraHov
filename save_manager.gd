extends Node

@onready var to_save : CToSave = CToSave.new()

var list : Array = [
	[ CPlayer.new() , "../Player" ]
]

func _save() -> void:
	for i in range(0, list.size(), 1) :
		list[i][0].save(get_node(list[i][1]))
	to_save.list = list
	ResourceSaver.save(to_save, "user://save.tres")
	
func _load() -> void:
	to_save = ResourceLoader.load("user://save.tres")
	for i in range(0, to_save.list.size(), 1):
		to_save.list[i][0]._load(get_node(list[i][1]))

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("save"):
		print("saving")
		_save()

	if event.is_action_pressed("load"):
		print("loading")
		_load()
