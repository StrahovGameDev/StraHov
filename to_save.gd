extends Resource
class_name CToSave

@export var player : CPlayer

func _init() -> void:
	player = CPlayer.new()
