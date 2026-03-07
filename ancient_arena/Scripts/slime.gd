extends CharacterBody2D
class_name Slime

var stats = preload("res://Resources/player_stats.tres")

var health = 5
var damage = 2
var speed = 65.0
var score = 10

var target = Vector2.ZERO

func _process(delta):
	if health <= 0:
		stats.score += score
		self.remove_from_group("Slimes")
		queue_free()

func _physics_process(delta):
	target = get_parent().get_node("Player")
	if position.distance_to(target.position) > 10:
		position = position.move_toward(target.position, delta * speed)


func _on_hit_box_hit(area) -> void:
	if area is not Skeleton or area is not Slime:
		health -= area.damage
