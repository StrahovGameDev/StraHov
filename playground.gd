extends Node3D

@onready var sg : CToSave = CToSave.new()

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("save"):
		print("saving")
		
		sg.player.save($Player)
		ResourceSaver.save(sg, "user://save.tres")

	if event.is_action_pressed("load"):
		print("loading")

		sg = ResourceLoader.load("user://save.tres") 
		sg.player.load($Player)
