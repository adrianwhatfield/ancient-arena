extends Area2D

var health = Stats.slime["health"]
var health_current = Stats.slime["health_current"]
var speed = Stats.slime["speed"]
var damage = Stats.slime["damage"]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_area_entered(area):
	Stats.player["score"] += 1
	queue_free()


func _on_body_entered(body):
	Stats.player["health_current"] -= damage
