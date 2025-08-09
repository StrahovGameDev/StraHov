extends Node3D

@onready var smth = $Persistent


var pos : Vector3
var config = ConfigFile.new()
var section : String

func _ready() -> void:
	section = "player"
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event: InputEvent) -> void:
	var pos_x
	var pos_y
	var pos_z
	
	if event.is_action_pressed("save"):
		pos = $Player.position
		config.set_value(section, "pos_x", pos.x)
		config.set_value(section, "pos_y", pos.y)
		config.set_value(section, "pos_z", pos.z)
		config.save("user://scores.cfg")
		print("done")
		
	if event.is_action_pressed("load"):
		print("here")
		config.load("user://scores.cfg")
		pos_x = config.get_value(section, "pos_x")
		pos_y = config.get_value(section, "pos_y")
		pos_z = config.get_value(section, "pos_z")
		$Player.position = Vector3(pos_x, pos_y, pos_z)
		
