extends Resource
class_name CSaveable

func save(_given : Node3D) -> void:
	push_error("save() needs to be overloaded in subclass")

func load(_given : Node3D) -> void :
	push_error("load() needs to be overloaded in subclass")
