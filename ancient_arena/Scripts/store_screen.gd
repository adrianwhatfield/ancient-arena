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


func _process(delta):
	coins_label.text = "Coins: " + str(Stats.coins)
	health_rank.text = "Health Rank: " + str(Stats.health.rank)
	magic_rank.text = "Magic Rank: " + str(Stats.magic.rank)
	speed_rank.text = "Speed Rank: " + str(Stats.speed.rank)
	damage_rank.text = "Damage Rank: " + str(Stats.damage.rank)
	
	health_cost.text = str(Stats.health.cost)
	magic_cost.text = str(Stats.magic.cost)
	speed_cost.text = str(Stats.speed.cost)
	damage_cost.text = str(Stats.damage.cost)
	
	if Stats.health.check_afford() == false:
		health_button.disabled = true
	
	if Stats.magic.check_afford() == false:
		magic_button.disabled = true
	
	if Stats.damage.check_afford() == false:
		damage_button.disabled = true
	
	if Stats.speed.check_afford() == false:
		speed_button.disabled = true


func _on_health_rank_up_pressed():
	Stats.health.rank_up()
	Stats.health_current = Stats.health.upgrade


func _on_magic_rank_up_pressed():
	Stats.magic.rank_up()
	Stats.magic_current = Stats.magic.upgrade


func _on_speed_rank_up_pressed():
	Stats.speed.rank_up()


func _on_damage_rank_up_pressed():
	Stats.damage.rank_up()


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/Scenes/Game/arena.tscn")
