extends Control

signal set_player_variables(var_name: String, value: Variant)
var escape_enabled: bool = false


func _ready() -> void:
	hide()

func _input(event: InputEvent) -> void:
#	When skippable event occurs, e.g., cutscenes, discord app is open etc.
	if escape_enabled:
		return
	
	
	if event.is_action_pressed("enter") and !visible and get_parent().god_mode_switch:
		get_parent().console_visible = true
		show()
		$LineEdit.caret_blink = true
		$LineEdit.caret_blink_interval = 0.6
		$LineEdit.call_deferred("grab_focus")



func _on_line_edit_text_submitted(new_text: String) -> void:
	var parts = new_text.strip_edges().split("=")
	if parts.size() == 2:
		var var_name = parts[0].strip_edges()
		var value_str = parts[1].strip_edges()
		var value = value_str.to_float()
		emit_signal("set_player_variables", var_name, value)
	else:
		print("Undefined")
	
	$LineEdit.clear()
	get_parent().console_visible = false
	call_deferred("hide")
