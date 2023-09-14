extends CharacterBody2D

var direction = Vector2.ZERO
var shoot_vector = Vector2.ZERO

var spell_scene = preload("res://Scenes/spell.tscn")

signal spell_fired
signal player_hit

func _physics_process(delta):
	direction = Input.get_vector("left", "right", "up", "down")
	if direction:
		velocity = direction * Stats.speed
	else:
		velocity.x = move_toward(velocity.x, 0, Stats.speed)
		velocity.y = move_toward(velocity.y, 0, Stats.speed)
	move_and_slide()
	
	if velocity.x > 0:
		$Sprite2D.flip_h = true
	elif velocity.x < 0:
		$Sprite2D.flip_h = false

func _process(delta):
	get_shoot()
	if Input.is_action_just_pressed("shoot") and Stats.magic_current >= 10:
		Stats.magic_current -= 10
		spell_fired.emit()
		shoot()

func shoot():
	var s = spell_scene.instantiate()
	owner.add_child(s)
	s.transform = $Wand/Shoot.global_transform

func get_shoot():
	var screen_rect = DisplayServer.window_get_size()
	var screen_height = screen_rect.x
	var screen_width = screen_rect.y
	
	if Stats.gamepad == true:
		shoot_vector = Input.get_vector("aim_left", "aim_right", "aim_up", "aim_down")
		shoot_vector.normalized()
		
		shoot_vector.x *= (screen_width * 2.25)
		shoot_vector.y *= (screen_height * 2.25)
		
		$Wand.look_at(shoot_vector)
	elif Stats.gamepad == false:
		$Wand.look_at(get_global_mouse_position())


func _on_timer_timeout():
	Stats.health_current += Stats.health_regen
	Stats.magic_current += Stats.magic_regen


func _on_hit_box_area_entered(area):
	player_hit.emit()
	Stats.health_current -= area.damage
