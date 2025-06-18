extends AnimationPlayer

func _ready() -> void:
	#play("cutscene1.1")
	pass

func sound_stop():
	$AudioStreamPlayer.stop()
