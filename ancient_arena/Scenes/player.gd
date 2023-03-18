extends CharacterBody2D

var health = Stats.player["health"]
var health_current = Stats.player["health_current"]
var speed = Stats.player["speed"]
var damage = Stats.player["damage"]

var spell_scene = preload("res://Scenes/spell.tscn")

var is_left_facing = false

func _physics_process(delta):
	
	# Movement
	var directionX = Input.get_axis("left", "right")
	if directionX:
		velocity.x = directionX * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	var directionY = Input.get_axis("up", "down")
	if directionY:
		velocity.y = directionY * speed
	else:
		velocity.y = move_toward(velocity.y, 0, speed)
	
	if velocity.x < 0:
		$Sprite2D.flip_h = true
		$Wand.position.x = -20
		is_left_facing = true
	elif velocity.x > 0:
		$Sprite2D.flip_h = false
		$Wand.position.x = 20
		is_left_facing = false

	move_and_slide()

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot(is_left_facing)

func shoot(direction):
	Stats.player["magic_current"] -= 5
	
	if direction == true:
		Manager.bullet_direction = "left"
	else:
		Manager.bullet_direction = "right"
	
	var s = spell_scene.instantiate()
	Manager.get_vector_speed()
	get_tree().root.add_child(s)
	s.position = $Wand.global_position
