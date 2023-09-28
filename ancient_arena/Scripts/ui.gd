extends CanvasLayer

var stats = preload("res://Resources/player_stats.tres")
@onready var player_health = $UI/PlayerHealth
@onready var player_magic = $UI/PlayerMagic
@onready var score = $UI/Score

func _process(delta):
	player_health.max_value = stats.health.value
	player_health.value = stats.health_current
	
	player_magic.max_value = stats.mana.value
	player_magic.value = stats.mana_current
	
	score.text = "Score: " + str(stats.score)
