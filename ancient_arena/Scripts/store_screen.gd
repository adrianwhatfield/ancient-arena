extends Control

@onready var coins_label = $VBoxContainer/Coins
@onready var health_rank = $VBoxContainer/VBoxContainer/HBoxContainer/Health/Rank
@onready var magic_rank = $VBoxContainer/VBoxContainer/HBoxContainer/Magic/Rank
@onready var speed_rank = $VBoxContainer/VBoxContainer/HBoxContainer2/Speed/Rank
@onready var damage_rank = $VBoxContainer/VBoxContainer/HBoxContainer2/Damage/Rank

@onready var health_cost = $VBoxContainer/VBoxContainer/HBoxContainer/Health/Cost
@onready var magic_cost = $VBoxContainer/VBoxContainer/HBoxContainer/Magic/Cost
@onready var speed_cost = $VBoxContainer/VBoxContainer/HBoxContainer2/Speed/Cost
@onready var damage_cost = $VBoxContainer/VBoxContainer/HBoxContainer2/Damage/Cost

@onready var health_button = $VBoxContainer/VBoxContainer/HBoxContainer/Health/RankUp
@onready var magic_button = $VBoxContainer/VBoxContainer/HBoxContainer/Magic/RankUp
@onready var speed_button = $VBoxContainer/VBoxContainer/HBoxContainer2/Speed/RankUp
@onready var damage_button = $VBoxContainer/VBoxContainer/HBoxContainer2/Damage/RankUp

var stats = preload("res://Resources/player_stats.tres")

func _process(delta):
	coins_label.text = "Coins: " + str(stats.coins)
	health_rank.text = "Health Rank: " + str(stats.health.rank)
	magic_rank.text = "Magic Rank: " + str(stats.mana.rank)
	speed_rank.text = "Speed Rank: " + str(stats.speed.rank)
	damage_rank.text = "Damage Rank: " + str(stats.damage.rank)
	
	health_cost.text = str(stats.health.cost)
	magic_cost.text = str(stats.mana.cost)
	speed_cost.text = str(stats.speed.cost)
	damage_cost.text = str(stats.damage.cost)
	
	if check_afford(stats.health) == false:
		health_button.disabled = true
	
	if check_afford(stats.mana) == false:
		magic_button.disabled = true
	
	if check_afford(stats.damage) == false:
		damage_button.disabled = true
	
	if check_afford(stats.speed) == false:
		speed_button.disabled = true

func check_afford(stat):
	if stat.cost >= stats.coins:
		return false
	else:
		return true

func _on_health_rank_up_pressed():
	stats.coins -= stats.health.cost
	stats.health.rank_up()
	stats.health_current = stats.health.value


func _on_magic_rank_up_pressed():
	stats.coins -= stats.mana.cost
	stats.mana.rank_up()
	stats.mana_current = stats.mana.value


func _on_speed_rank_up_pressed():
	stats.coins -= stats.speed.cost
	stats.speed.rank_up()


func _on_damage_rank_up_pressed():
	stats.coins -= stats.damage.cost
	stats.damage.rank_up()


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/Scenes/Game/arena.tscn")
