extends Control

@onready var score_label = $VBoxContainer/Score
@onready var coins_label = $VBoxContainer/Coins
var stats = preload("res://Resources/player_stats.tres")

func _ready():
	score_label.text = "Score: " + str(stats.score)
	stats.calculate_coins()
	coins_label.text = "Coins: " + str(stats.coins)


func _on_restart_pressed():
	stats.reset()
	get_tree().change_scene_to_file("res://Scenes/Scenes/Game/arena.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/Scenes/Menu/main_menu.tscn")
