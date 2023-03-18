extends Node

var controller_input = false

####

var bullet_direction = ""
var speed = 200
var vector_speed = Vector2(0, 0)

func get_vector_speed():
	if bullet_direction == "left":
		vector_speed = Vector2(-speed, 0)
	elif bullet_direction == "right":
		vector_speed = Vector2(speed, 0)
