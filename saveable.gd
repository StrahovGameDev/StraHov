extends Resource
class_name CSaveable

func _init(_given : Node) -> void:
	push_error("operator new(...) needs to be overloaded in subclass")

func isInTree() -> bool :
	push_error("isInTree() needs to be overloaded in subclass")
	return false

#false is set by default 
func wasInTree() -> bool:
	push_error("wasInTree() needs to be overloaded in subclass")
	return false

func save() -> void:
	push_error("save() needs to be overloaded in subclass")

func load() -> void :
	push_error("load() needs to be overloaded in subclass")
