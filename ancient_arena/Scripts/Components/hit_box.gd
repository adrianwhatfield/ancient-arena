extends Area2D

signal hit(area: Area2D)


func _on_area_entered(area: Area2D) -> void:
	hit.emit(area)
