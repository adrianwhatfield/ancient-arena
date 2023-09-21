extends Area2D

const SPEED = 250
var stats = preload("res://Resources/player_stats.tres")

func _ready():
	$Sprite2D.play("default")

func _process(delta):
	position += transform.x * SPEED * delta

func _on_timer_timeout():
	queue_free()

func _on_area_entered(area):
	area.health -= stats.damage.value
