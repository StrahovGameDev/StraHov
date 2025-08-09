extends Node3D
#"user://scores.cfg"

var list : Dictionary

@onready var sg : CToSave = CToSave.new()


func _ready() -> void:
	list = {
		"Player" : func(): return CPlayer.new($Player)
	}
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	for elem in list.values():
		sg.data.append(elem.call())

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("save"):
		print("saving")
		for elem in sg.data:
			elem.save()
		ResourceSaver.save(sg, "user://save.tres")
		
	if event.is_action_pressed("load"):
		print("loading")
		sg = ResourceLoader.load("user://save.tres") 
		for elem in sg.data:
			elem.load()
