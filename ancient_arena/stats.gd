extends Resource
class_name Stats

@export_group("Health")
@export var health: Upgrade
@export var health_regen: int
@export var health_current: float

@export_group("Mana")
@export var mana: Upgrade
@export var mana_regen: int
@export var mana_current: float

@export_group("Other")
@export var damage: Upgrade
@export var speed: Upgrade
@export var score: int
@export var coins: float

func calculate_coins():
	coins += score * 0.1

func reset():
	health_current = 20
	mana_current = 50
	score = 0
