extends CharacterBody2D

var health = Stats.player["health"]
var health_current = Stats.player["health_current"]
var speed = Stats.player["speed"]
var damage = Stats.player["damage"]

var aim_dist = 3
var aim_speed = 1
const MAX_AIM = 35

var spell_scene = preload("res://Scenes/spell.tscn")

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
	elif velocity.x > 0:
		$Sprite2D.flip_h = false

	move_and_slide()

func _process(delta):
	if Input.is_action_pressed("aim_left"):
		$Wand.position.x -= aim_dist * aim_speed
		Manager.bullet_direction = "left"
	
	if Input.is_action_pressed("aim_right"):
		$Wand.position.x += aim_dist * aim_speed
		Manager.bullet_direction = "right"
	
	if Input.is_action_pressed("aim_up"):
		$Wand.position.y -= aim_dist * aim_speed
		Manager.bullet_direction = "up"
	
	if Input.is_action_pressed("aim_down"):
		$Wand.position.y += aim_dist * aim_speed
		Manager.bullet_direction = "down"
	
	# RIGHT
	if $Wand.position.x > MAX_AIM:
		$Wand.position.x = MAX_AIM
	
	# LEFT
	if $Wand.position.x < -MAX_AIM:
		$Wand.position.x = -MAX_AIM
	
	# DOWN
	if $Wand.position.y > MAX_AIM:
		$Wand.position.y = MAX_AIM
	
	# UP
	if $Wand.position.y < -MAX_AIM:
		$Wand.position.y = -MAX_AIM
	
	if Input.is_action_just_pressed("shoot"):
		var s = spell_scene.instantiate()
		Manager.get_vector_speed()
		get_tree().root.add_child(s)
		s.position = $Wand.global_position
