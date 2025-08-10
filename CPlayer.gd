extends CSaveable
class_name CPlayer

@export var player_position : Vector3
@export var player_rotation : Vector3
var player : Node3D

var was_in_Tree : bool

func _init() -> void:
	print("hello")

func savePosition() -> void:
	player_position = player.position

func saveRotation() -> void:
	player_rotation = player.rotation

func loadPosition() -> void:
	print(player_position)
	player.position = player_position

func loadRotation() -> void:
	print(player_rotation)
	player.rotation = player_rotation

func save(given : Node3D) -> void:
	player = given
	savePosition()
	saveRotation()

func _load(given : CPlayer, node : Node3D) -> void:
	player = node
	player_rotation = given.player_rotation
	player_position = given.player_position
	loadPosition()
	loadRotation()
	
