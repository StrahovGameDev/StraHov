extends VideoStreamPlayer

var cutscenes: Dictionary = {
	"cutscene1.1": "res://cutscenes/cutscene1_1.ogv",
}

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action("escape"):
		skip_cutscene()


func play_cutscene(cutscene_id: String) -> void:
	if cutscenes.has(cutscene_id):
		stream = load(cutscenes[cutscene_id])
		play()
	else:
		print("UNKNOWN CUTSCENE ID")


func skip_cutscene() -> void:
	stop()
	stream = null
