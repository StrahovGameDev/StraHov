extends AnimationPlayer

func _ready() -> void:
	play("cutscene1.1")

func sound_stop():
	$AudioStreamPlayer.stop()
