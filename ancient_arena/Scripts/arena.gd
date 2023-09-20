extends Node2D

@onready var hit_sound = $Sounds/HitSound
@onready var explode_sound = $Sounds/ExplodeSound

func _process(delta):
	if Input.is_action_just_pressed("menu"):
		get_tree().change_scene_to_file("res://Scenes/Scenes/Menu/main_menu.tscn")


func _on_player_player_hit():
	hit_sound.play()


func _on_player_spell_fired():
	explode_sound.play()
