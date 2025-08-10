extends Node3D

#1 zavola new na svoje premeny
#2 priradi node ku premenam
#3 save do seba a potom sa prekopiruje do sg
#4 load do sg a potom z sg do seba
class builder:
	#stays
	var to_save : CToSave 

	var player : CPlayer
	var node : Node3D
	
	func _init(given : Node3D) -> void:
		player = CPlayer.new()
		to_save = CToSave.new()
		node = given

	func _save() -> void:
		player.save(node)
		to_save.player = player
		ResourceSaver.save(to_save, "user://save.tres")
		
	func _load() -> void:
		to_save = ResourceLoader.load("user://save.tres")
		player._load(to_save.player, node)
		 

@onready var bt : builder = builder.new($Player)

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("save"):
		print("saving")
		bt._save()

	if event.is_action_pressed("load"):
		print("loading")
		bt._load()
