extends Node3D
#"user://scores.cfg"
@onready var save = CToSave.new()
@onready var player = save.CPlayer.new($Player)

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event: InputEvent) -> void:
	
	if event.is_action_pressed("save"):
		print("saving")
		player.save()
		#player.savePosition($Player)
		#player.saveRotation($Player)
		ResourceSaver.save(save, "user://save.tres")
		
	if event.is_action_pressed("load"):
		print("loading")
		save = ResourceLoader.load("user://save.tres")
		player.load()
		#player.loadPosition($Player)
		#player.loadRotation($Player)
		
