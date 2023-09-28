extends Control

var settings = preload("res://Resources/player_settings.tres")

@onready var gamepad = $Settings/Gamepad/CheckBox
@onready var fullscreen_check = $Settings/Fullscreen/FullscreenCheck
@onready var volume = $Settings/Sound/Volume

var bus_name = "Master"
var bus_index = 0

func _ready():
	gamepad.grab_focus()
	if settings.gamepad == true:
		gamepad.button_pressed = true
	volume.value = db_to_linear(AudioServer.get_bus_volume_db(bus_index))
	if settings.fullscreen == true:
		fullscreen_check.button_pressed = true

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Scenes/Menu/main_menu.tscn")


func _on_fullscreen_check_toggled(button_pressed):
	if button_pressed == true:
		settings.set_fullscreen()
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_resolution_item_selected(index):
	match index:
		0: settings.resolution = settings.Resolution.RES_1080
		1: settings.resolution = settings.Resolution.RES_800
		2: settings.resolution = settings.Resolution.RES_720
	settings.set_res()


func _on_mute_toggled(button_pressed):
	settings.volume = 0
	settings.set_volume()


func _on_volume_value_changed(value):
	settings.volume = value
	settings.set_volume()


func _on_check_box_toggled(button_pressed):
	if button_pressed == true:
		settings.gamepad = true
	else:
		settings.gamepad = false
