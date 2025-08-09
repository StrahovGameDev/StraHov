extends Resource
class_name CToSave

class CPlayer:
	@export var player_position : Vector3
	@export var player_rotation : Vector3
	
	var player : Node3D
	
	func _init(given : Node3D) -> void:
		player = given
	
	func savePosition() -> void:
		player_position = player.position
	func saveRotation() -> void:
		player_rotation = player.rotation
	func loadPosition() -> void:
		player.position = player_position
	func loadRotation() -> void:
		player.rotation = player_rotation	
		
	func save() -> void:
		savePosition()
		saveRotation()
	func load() -> void:
		loadPosition()
		loadRotation()
