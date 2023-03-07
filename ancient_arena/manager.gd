extends Node

var controller_input = false

####

var bullet_direction = ""
var speed = 200
var vector_speed = Vector2(0, 0)

func get_vector_speed():
	if bullet_direction == "left":
		vector_speed = Vector2(-speed, 0)
	if bullet_direction == "right":
		vector_speed = Vector2(speed, 0)
	
	if bullet_direction == "up":
		vector_speed = Vector2(0, -speed)
	if bullet_direction == "down":
		vector_speed = Vector2(0, speed)
