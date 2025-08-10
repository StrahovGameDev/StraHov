extends CSaveable
class_name CPlayer

@export var player_position : Vector3
@export var player_rotation : Vector3

var player : Node3D

func savePosition() -> void:
	player_position = player.position

func saveRotation() -> void:
	player_rotation = player.rotation

func loadPosition() -> void:
	player.position = player_position

func loadRotation() -> void:
	player.rotation = player_rotation

func save(given : Node3D) -> void:
	player = given
	savePosition()
	saveRotation()
	
func _load(node : Node3D) -> void:
	player = node
	loadPosition()
	loadRotation()
	
