extends Area2D

var health = Stats.skeleton["health"]
var health_current = Stats.skeleton["health_current"]
var speed = Stats.skeleton["speed"]
var damage = Stats.skeleton["damage"]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ProgressBar.max_value = health
	$ProgressBar.value = health_current


func _on_area_entered(area):
	Stats.player["score"] += 1
	queue_free()


func _on_body_entered(body):
	Stats.player["health_current"] -= damage
