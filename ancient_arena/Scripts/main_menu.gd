extends Control

func _ready():
	$VBoxContainer/Start.grab_focus()
	Stats.reset()

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Scenes/Menu/store_screen.tscn")


func _on_button_3_pressed():
	get_tree().quit()


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/Scenes/Menu/settings_menu.tscn")
