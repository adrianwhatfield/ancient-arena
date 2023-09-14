extends Control

@onready var gamepad = $Settings/Gamepad/CheckBox

var bus_name = "Master"
var bus_index = 0

func _ready():
	gamepad.grab_focus()

func _on_check_box_pressed():
	Stats.gamepad = true

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_fullscreen_check_toggled(button_pressed):
	if button_pressed == true:
		var resolution = DisplayServer.screen_get_size()
		DisplayServer.window_set_size(resolution)
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_resolution_item_selected(index):
	match index:
		0: DisplayServer.window_set_size(Vector2(1920, 1080))
		1: DisplayServer.window_set_size(Vector2(1280, 800))
		2: DisplayServer.window_set_size(Vector2(1280, 720))


func _on_mute_toggled(button_pressed):
	if button_pressed == true:
		AudioServer.set_bus_mute(bus_index, true)
	else:
		AudioServer.set_bus_mute(bus_index, false)


func _on_volume_value_changed(value):
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
