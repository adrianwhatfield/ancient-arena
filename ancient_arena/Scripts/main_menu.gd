extends Control

var stats = preload("res://Resources/player_stats.tres")
var settings = preload("res://Resources/player_settings.tres")

func _ready():
	$VBoxContainer/Start.grab_focus()
	stats.reset()
	set_settings()

func set_settings():
	if settings.fullscreen == true:
		settings.set_fullscreen()
	else:
		settings.set_res()
	settings.set_volume()

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Scenes/Menu/store_screen.tscn")


func _on_button_3_pressed():
	get_tree().quit()


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/Scenes/Menu/settings_menu.tscn")


func _on_save_pressed():
	SaveGame.save_game()


func _on_load_pressed():
	SaveGame.load_game()
	set_settings()
