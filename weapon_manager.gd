extends Node

func _ready() -> void:
	$CanvasLayer/WeaponSelector.hide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("weapon_select"):
		#print("weapon selector")
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		$CanvasLayer/WeaponSelector.show()
		$AnimationPlayer.play("weapons_appear")
	elif event.is_action_released("weapon_select"):
		#print("select gun")
		weapon_match()
		
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		

var weapon

func _on_weapon_1_mouse_entered() -> void:
	weapon = "Beer"
	#print("hovered")


func _on_weapon_1_mouse_exited() -> void:
	weapon = -1

func weapon_match():
	match weapon:
		"Beer":
			print("Beer seleced")
		"Gun":
			print("Gun selected")
		"Knife":
			print("Knife selected")
		"Grenade":
			print("Grenade selected")
		_:
			print("nothing selected")
	$CanvasLayer/WeaponSelector.hide()


func _on_weapon_2_mouse_entered() -> void:
	weapon = "Gun"


func _on_weapon_2_mouse_exited() -> void:
	weapon = -1


func _on_weapon_3_mouse_entered() -> void:
	weapon = "Grenade"


func _on_weapon_3_mouse_exited() -> void:
	weapon = -1


func _on_weapon_4_mouse_entered() -> void:
	weapon = "Knife"


func _on_weapon_4_mouse_exited() -> void:
	weapon = -1
