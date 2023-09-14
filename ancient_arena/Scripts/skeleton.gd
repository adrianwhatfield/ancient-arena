extends Area2D

var health = 10
var damage = 4
var speed = 100.0

var target = Vector2.ZERO

func _process(delta):
	if health < 0:
		queue_free()

func _physics_process(delta):
	target = get_parent().get_node("Player")
	if position.distance_to(target.position) > 10:
		position = position.move_toward(target.position, delta * speed)

func _on_area_entered(area):
	health -= Stats.damage

func _on_body_entered(body):
	Stats.health_current -= damage
