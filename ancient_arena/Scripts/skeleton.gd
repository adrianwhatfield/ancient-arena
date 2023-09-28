extends Area2D

var stats = preload("res://Resources/player_stats.tres")

var health = 10
var damage = 4
var speed = 100.0
var score = 15

var target = Vector2.ZERO

func _process(delta):
	if health < 0:
		stats.score += score
		queue_free()

func _physics_process(delta):
	target = get_parent().get_node("Player")
	if position.distance_to(target.position) > 10:
		position = position.move_toward(target.position, delta * speed)
