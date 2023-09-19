extends Node

var gamepad = false

var res_1080 = Vector2(1920, 1080)
var res_800 = Vector2(1280, 800)
var res_720 = Vector2(1280, 720)
var current_res = res_720

var health = 20
var health_current = 20
var health_regen = 0

var magic = 50
var magic_current = 50
var magic_regen = 5

var speed = Upgrade.new()
var damage = Upgrade.new()
var score = 0
var coins = 0.0

func _ready():
	damage.upgrade = 5.0
	damage.cost = 15.0
	damage.rank = 0
	
	speed.upgrade = 150.0
	speed.cost = 10.0
	speed.rank = 0

func calculate_coins():
	coins += score * 0.1

func reset():
	health_current = 20
	magic_current = 50
	score = 0

func set_res(resolution):
	DisplayServer.window_set_size(resolution)
