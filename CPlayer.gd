extends CSaveable
class_name CPlayer

@export var player_position : Vector3
@export var player_rotation : Vector3
	
var player : Node3D
var was_in_Tree : bool
	
func _init(given : Node3D) -> void:
	player = given

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

func isInTree() -> bool:
	return player.is_inside_tree()
	
func wasInTree() -> bool:
	return was_in_Tree
	
func save() -> void:
	savePosition()
	saveRotation()

func load() -> void:
	loadPosition()
	loadRotation()
