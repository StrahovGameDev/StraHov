extends VideoStreamPlayer

var last_time_escape_pressed: float
var escape_held: bool = false

## emited when cutscene starts
signal started 

var cutscenes: Dictionary = {
	"cutscene1.1": "res://cutscenes/cutscene1_1.ogv",
}


func _unhandled_input(event: InputEvent) -> void:
	if stream != null:
		if event.is_action("escape") and event.is_pressed() and !escape_held:
			var current_time1 = Time.get_ticks_msec() / 1000.0
			if current_time1 - last_time_escape_pressed <= 0.3:
				skip_cutscene()
				print("SKIP")
			last_time_escape_pressed = current_time1
			escape_held = true
		if event.is_action("escape") and event.is_pressed() and escape_held:
			var current_time2 = Time.get_ticks_msec() / 1000.0
			if current_time2 - last_time_escape_pressed >= 2:
				escape_held = false
				skip_cutscene()
				print("držím")
		
		elif event.is_action("escape") and !event.is_pressed():
			escape_held = false


func play_cutscene(cutscene_id: String) -> void:
	if cutscenes.has(cutscene_id):
		started.emit()
		stream = load(cutscenes[cutscene_id])
		play()
	else:
		print("UNKNOWN CUTSCENE ID")


func skip_cutscene() -> void:
	stop()
	stream = null
	finished.emit()
