extends CharacterBody2D

var health = Stats.player["health"]
var health_current = Stats.player["health_current"]
var speed = Stats.player["speed"]
var damage = Stats.player["damage"]

var direction = Vector2.ZERO
var shoot_vector = Vector2.ZERO

var spell_scene = preload("res://Scenes/spell.tscn")

func _physics_process(delta):
	direction = Input.get_vector("left", "right", "up", "down")
	if direction:
		velocity = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)
	
	move_and_slide()

func _process(delta):
	get_shoot()
	if Input.is_action_just_pressed("shoot"):
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
