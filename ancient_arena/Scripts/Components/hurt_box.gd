extends Area2D

signal hurt(damage: float)


func _on_area_entered(area: Area2D) -> void:
	hurt.emit(get_parent().damage)
