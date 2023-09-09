extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$UI/UI/PlayerHealth.value = Stats.player["health_current"]
	$UI/UI/PlayerHealth.max_value = Stats.player["health"]
	$UI/UI/PlayerMagic.value = Stats.player["magic_current"]
	$UI/UI/PlayerMagic.max_value = Stats.player["magic"]
	if Input.is_action_just_pressed("menu"):
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
