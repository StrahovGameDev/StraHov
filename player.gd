extends CharacterBody3D

@onready var head = $Head
@onready var dialog_label = $CanvasLayer/EnterDialog
@onready var dialog = $CanvasLayer/Dialog

@export var speed = 5.0
const DEFAULT_SPEED = 5.0
const JUMP_VELOCITY = 4.5

var mouse_sens = 0.5

var current_dialog = ""

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

var weapon_selector: bool = false

#region
# GodMode variables
var console_visible: bool = false
var flying: bool = false
var god_mode_switch: bool = false
var flying_speed: float = 10.0
var last_space_pressed_time: float
# GodMode only avaible after completing special quest; now for debug always avaible, in game
# add this var as another and if statement
var god_mode_acquired: bool = false
#endregion

func _ready():
	$Console.set_player_variables.connect(_on_set_player_variables)
	dialog_label.visible = false
	dialog.visible = false


func _input(event: InputEvent) -> void:
	if console_visible:
		return

	if event is InputEventMouseMotion and !weapon_selector:
		rotate_y(deg_to_rad(-event.relative.x * mouse_sens))
		head.rotate_x(deg_to_rad(-event.relative.y * mouse_sens))
		head.rotation.x = clamp(head.rotation.x, deg_to_rad(-80), deg_to_rad(90))
	
	
	#region
	if event.is_action_pressed("god_mode") and !god_mode_switch:
		print("GOD MODE ON")
		god_mode_switch = true
	elif event.is_action_pressed("god_mode") and god_mode_switch:
		print("GOD MODE OFF")
		god_mode_switch = false
		flying = false
		
	if god_mode_switch and (event.is_action_pressed("jump") or event.is_action_pressed("fly_down")):
		var current_time = Time.get_ticks_msec() / 1000.0
		if current_time - last_space_pressed_time <= 0.3:
			flying_toggle()
		last_space_pressed_time = current_time
	#endregion
	
	if event.is_action_pressed("accept") and !dialog.visible:
		dialog.text = current_dialog
		dialog_label.visible = false
		dialog.visible = true
	elif event.is_action_pressed("accept") and dialog.visible:
		dialog.visible = false
		dialog_label.visible = true

func flying_toggle():
	flying = !flying
	if flying:
		print("flying ON")
	else:
		print("flying OFF")



func _process(delta):
	# Debug, delete later
	$FPS.text = "FPS: " + str(Engine.get_frames_per_second())
	
	if console_visible:
		return
	
	
	if flying:
		velocity.y = 0
		if Input.is_action_pressed("fly_up"):
			velocity.y = flying_speed
		if Input.is_action_pressed("fly_down"):
			velocity.y = -flying_speed
	
	else:
		if not is_on_floor():
			velocity.y -= gravity * delta
		
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
	
	speed = DEFAULT_SPEED
	
	if Input.is_action_pressed("sprint"):
		speed = 20
		#print("sprint")
	
	if Input.is_action_pressed("duck") and !weapon_selector:
		speed = 2
		$CollisionShape3D.disabled = true
		$CollisionShape3D2.disabled = false
		head.position.y -= 15 * delta
	else:
		if !weapon_selector:
			$CollisionShape3D.disabled = false
			$CollisionShape3D2.disabled = true
			head.position.y += 15 * delta

	
	head.position.y = clamp(head.position.y, -0.5, 1.0)
	
	var input_dir = Input.get_vector("left", "right", "forward", "backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction and !weapon_selector:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
	move_and_slide()

# If special quest completed, add GodMode
func god_function():
	god_mode_acquired = true
	var god_mode_scene = (load("uid://blnv74irts5gj")).instantiate()
	add_child(god_mode_scene)
	god_mode_scene.connect("set_player_variables", _on_set_player_variables)

func _on_set_player_variables(var_name: String, value: Variant):
	set(var_name, value)


func _on_weapon_manager_g_pressed() -> void:
	weapon_selector = true


func _on_weapon_manager_g_released() -> void:
	weapon_selector = false
