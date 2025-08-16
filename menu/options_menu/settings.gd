extends CanvasLayer

@onready var fullscreen_check = $ScrollContainer/VBoxContainer/FullscreenCheck
@onready var shake_check = $ScrollContainer/VBoxContainer/ShakeCheck
@onready var volume_slider = $ScrollContainer/VBoxContainer/VolumeSlider
@onready var sfx_slider = $ScrollContainer/VBoxContainer/SFXSlider

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var video_settings = ConfigFileHandler.load_settings("video")
	fullscreen_check.button_pressed = video_settings.fullscreen
	if (fullscreen_check.button_pressed):
		ProjectSettings.set_setting("display/window/size/mode", DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		ProjectSettings.set_setting("display/window/size/mode", DisplayServer.WINDOW_MODE_WINDOWED)
		
	shake_check.button_pressed = video_settings.screen_shake
	
	print(ConfigFileHandler.CONFIG_FILE)
	
	#var audio_settings = ConfigFileHandler.load_settings("audio")
	#volume_slider.value = min(audio_settings.master_volume, 1.0) * 100
	#sfx_slider.value = min(audio_settings.sfx_volume, 1.0) * 100


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_fullscreen_check_toggled(toggled_on: bool) -> void:
	ConfigFileHandler.save_setting("video", "fullscreen", toggled_on)


func _on_shake_check_toggled(toggled_on: bool) -> void:
	ConfigFileHandler.save_setting("video", "screen_shake", toggled_on)


func _on_volume_slider_drag_ended(value_changed: bool) -> void:
	if (value_changed):
		ConfigFileHandler.save_setting("audio", "master_volume", volume_slider)


func _on_sfx_slider_drag_ended(value_changed: bool) -> void:
	if (value_changed):
		ConfigFileHandler.save_setting("audio", "sfx_volume", sfx_slider)
