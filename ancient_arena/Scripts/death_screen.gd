extends Control

@onready var score = $VBoxContainer/Score

func _process(delta):
	score.text = "Score: " + str(Stats.score)


func _on_restart_pressed():
	Stats.reset()
	get_tree().change_scene_to_file("res://Scenes/arena.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
