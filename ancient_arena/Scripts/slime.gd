extends Area2D

var health = 5
var damage = 2
var speed = 75.0

var target = Vector2.ZERO

func _process(delta):
	if health < 0:
		queue_free()

func _physics_process(delta):
	target = get_parent().get_node("Player")
	if position.distance_to(target.position) > 10:
		position = position.move_toward(target.position, delta * speed)
