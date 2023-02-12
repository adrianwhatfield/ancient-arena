extends Area2D

var speed = Manager.vector_speed
# Called when the node enters the scene tree for the first time.
func _ready():
	var speed = Manager.vector_speed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += speed * delta


func _on_timer_timeout():
	queue_free()
