extends Area3D

var only_once: bool = true

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player") and only_once:
		only_once = false
		print("Ou, hello, hello, my dear student. WELCOME TO STRAHOV")
		$AudioStreamPlayer3D.play()
		$AnimationPlayer.play("welcome")
	else:
		pass


func _on_timer_timeout() -> void:
	$AnimationPlayer/CanvasLayer/Label3.queue_free()
