extends Resource
class_name Settings

@export var gamepad: bool
@export var fullscreen: bool
@export var volume: float

enum Resolution {RES_1080, RES_800, RES_720}
@export var resolution: Resolution

func set_res():
	match resolution:
		Resolution.RES_1080:
			DisplayServer.window_set_size(Vector2i(1920, 1080))
		Resolution.RES_800:
			DisplayServer.window_set_size(Vector2i(1280, 800))
		Resolution.RES_720:
			DisplayServer.window_set_size(Vector2i(1280, 720))

func set_fullscreen():
	var resolution = DisplayServer.screen_get_size()
	DisplayServer.window_set_size(resolution)
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)

func set_volume():
	AudioServer.set_bus_volume_db(0, linear_to_db(volume))
