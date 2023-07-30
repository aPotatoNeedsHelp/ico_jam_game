extends Control

@onready var fps_label = $FPSLabel
@onready var fullscreen_button = $FullscreenButton


func _process(_delta):
	fps_label.text = "FPS:" + str(Engine.get_frames_per_second())

func _on_fullscreen_button_pressed():
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)

