extends Node2D

var skeleton_scene = preload("res://Scenes/skeleton.tscn")
var slime_scene = preload("res://Scenes/slime.tscn")


func _on_timer_timeout():
	var skeleton = skeleton_scene.instantiate()
	var slime = slime_scene.instantiate()
	
	var chance = randf()
	
	if chance <= 0.6:
		owner.add_child(skeleton)
		skeleton.transform = global_transform
	elif chance >= 0.3:
		owner.add_child(slime)
		slime.transform = global_transform
