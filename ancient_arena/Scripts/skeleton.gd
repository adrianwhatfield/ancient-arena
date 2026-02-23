extends Area2D
class_name Skeleton

var stats = preload("res://Resources/player_stats.tres")

var health = 10
var damage = 4
var speed = 25.0
var score = 15

var velocity = Vector2()
var acceleration = Vector2()
var boids = []

var perception_radius = 50.0 #50
var centralisation_force_radius = 10.0 #10

var centralisation_force = 1.0 #0.5
var steer_force = 100.0 #50.0
var alignment_force = 2.4 #1.2
var cohesion_force = 1.0 #0.5
var seperation_force = 2.0 #1.0

var target = Vector2.ZERO

func _ready() -> void:
	var boid_group = get_tree().get_nodes_in_group("Skeletons")
	for boid in boid_group:
		boids.append(boid)

func _process(_delta):
	if health < 0:
		stats.score += score
		self.remove_from_group("Skeletons")
		queue_free()

func _physics_process(delta):
	var neighbors = get_neighbors(perception_radius)
	target = stats.position
	
	acceleration += process_alignments(neighbors) * alignment_force
	acceleration += process_cohesion(neighbors) * cohesion_force
	acceleration += process_seperation(neighbors) * seperation_force
	acceleration += process_centrailisation(target) * centralisation_force
	
	velocity += acceleration * delta
	# TODO: Clamp velocity to max speed
	
	translate(velocity * delta)

func steer(towards):
	var steer_dir = towards - velocity
	steer_dir = steer_dir.normalized()
	return steer_dir

func process_seperation(neighbors):
	var vector: Vector2 = Vector2()
	var close_neighbors = []
	for boid in neighbors:
		if position.distance_to(boid.position) < perception_radius / 2:
			close_neighbors.push_back(boid)
		
	if close_neighbors.is_empty():
		return vector
		
	for boid in close_neighbors:
		var difference: Vector2 = position - boid.position
		vector += difference.normalized() / difference.length()
	
	vector /= close_neighbors.size()
	
	return steer(vector.normalized() * speed)

func process_alignments(neighbors):
	var vector: Vector2 = Vector2()
	if neighbors.is_empty():
		return vector
	
	for boid in neighbors:
		vector += boid.velocity
	vector /= neighbors.size()
	
	return steer(vector.normalized() * speed)

func process_cohesion(neighbors):
	var vector: Vector2 = Vector2()
	if neighbors.is_empty():
		return vector
	for boid in neighbors:
		vector += boid.position
	vector /= neighbors.size()
	
	return steer((vector - position).normalized() * speed)

func process_centrailisation(centre: Vector2):
	if position.distance_to(centre) < centralisation_force_radius:
		return Vector2()
	
	return steer((centre - position).normalized() * speed)

func get_neighbors(view_radius):
	var neighbors = []
	
	for boid in boids:
		if position.distance_to(boid.position) <= view_radius and not boid == self:
			neighbors.push_back(boid)
		
		return neighbors
