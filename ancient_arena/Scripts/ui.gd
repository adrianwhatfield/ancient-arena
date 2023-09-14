extends CanvasLayer

@onready var player_health = $UI/PlayerHealth
@onready var player_magic = $UI/PlayerMagic
@onready var score = $UI/Score

func _process(delta):
	player_health.max_value = Stats.health
	player_health.value = Stats.health_current
	
	player_magic.max_value = Stats.magic
	player_magic.value = Stats.magic_current
	
	score.text = "Score: " + str(Stats.score)
