extends Node


var config = ConfigFile.new()
const CONFIG_FILE = "user://config.ini"

func _ready():
	if !FileAccess.file_exists(CONFIG_FILE):
		# Keybind settings
		config.set_value("keybinding", "forward", "W")
		config.set_value("keybinding", "left", "A")
		config.set_value("keybinding", "backward", "S")
		config.set_value("keybinding", "right", "D")
		config.set_value("keybinding", "jump", "Spacebar")
		config.set_value("keybinding", "fly_up", "Spacebar")
		config.set_value("keybinding", "fly_down", "Ctrl")
		config.set_value("keybinding", "duck", "Ctrl")
		config.set_value("keybinding", "enter", "Enter")
		config.set_value("keybinding", "sprint", "Shift")
		config.set_value("keybinding", "accept", "E")
		config.set_value("keybinding", "phone", "Q")
		config.set_value("keybinding", "weapon_select", "G")
		config.set_value("keybinding", "t", "T")
		config.set_value("keybinding", "y", "Y")
		
		# Video settings
		config.set_value("video", "fullscreen", false)
		config.set_value("video", "screen_shake", true)
		config.set_value("video", "viewport_width", 1152)
		config.set_value("video", "viewport_height", 648)
		
		# Audio settings
		config.set_value("audio", "master_volume", 1.0)
		config.set_value("video", "sfx_volume", 1.0)
		
		config.save(CONFIG_FILE)
	else:
		config.load(CONFIG_FILE)
	
	# Need to apply the settings on load
	# ProjectSettings.set_setting("display/window/size/mode", DisplayServer.WINDOW_MODE_FULLSCREEN)

func save_setting(section, key, value):
	config.set_value(section, key, value)
	config.save(CONFIG_FILE)

func load_settings(section):
	var settings = {}
	for key in config.get_section_keys(section):
		settings[key] = config.get_value(section, key)
	return settings

func save_keybind(action, event):
	var event_str
	if event is InputEventKey:
		event_str = OS.get_keycode_string(event)
	elif event is InputEventMouseButton:
		event_str = "mouse_" + str(event.button_index)
	
	config.set_value("keybinding", action, event_str)


func load_keybindings():
	var keybindings
	var keys = config.get_section_keys("keybinding")
	for key in keys:
		var input_event
		var event_str = config.get_value("keybinding", key)
		
		if event_str.contains("mouse_"):
			input_event = InputEventMouseButton.new()
			input_event.button_index = int(event_str.split("_")[1])
		else:
			input_event = InputEventKey.new()
			input_event.keycode = OS.find_keycode_from_string(event_str)
		
		keybindings[key] = input_event
	return keybindings
	
	
	
