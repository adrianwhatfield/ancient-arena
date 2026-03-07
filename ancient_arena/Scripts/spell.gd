extends Area2D

var damage: float = 1
const SPEED = 250
var stats = preload("res://Resources/player_stats.tres")

func _ready():
	$Sprite2D.play("default")
	damage = stats.damage.value * damage

func _process(delta):
	position += transform.x * SPEED * delta

func _on_timer_timeout():
	queue_free()
