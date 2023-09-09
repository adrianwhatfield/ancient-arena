extends Area2D

const SPEED = 250

func _process(delta):
	position += transform.x * SPEED * delta

func _on_timer_timeout():
	queue_free()
