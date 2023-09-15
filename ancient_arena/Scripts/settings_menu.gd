extends Control

@onready var gamepad = $Settings/Gamepad/CheckBox
@onready var fullscreen_check = $Settings/Fullscreen/FullscreenCheck
@onready var volume = $Settings/Sound/Volume

var bus_name = "Master"
var bus_index = 0

func _ready():
	gamepad.grab_focus()
	if Stats.gamepad == true:
		gamepad.button_pressed = true
	volume.value = db_to_linear(AudioServer.get_bus_volume_db(bus_index))
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		fullscreen_check.button_pressed = true

func _process(delta):
	Stats.set_res(Stats.current_res)

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
		0: Stats.current_res = Stats.res_1080
		1: Stats.current_res = Stats.res_800
		2: Stats.current_res = Stats.res_720


func _on_mute_toggled(button_pressed):
	if button_pressed == true:
		AudioServer.set_bus_mute(bus_index, true)
	else:
		AudioServer.set_bus_mute(bus_index, false)


func _on_volume_value_changed(value):
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))


func _on_check_box_toggled(button_pressed):
	if button_pressed == true:
		Stats.gamepad = true
	else:
		Stats.gamepad = false
