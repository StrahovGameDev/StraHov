extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var current_time = Time.get_time_string_from_system()
	$Background/Time/TimeLabel.text = current_time
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("phone"):
		self.visible = !self.visible
	
