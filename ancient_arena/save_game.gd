extends Node

const SAVE_PATH = "user://saves/"
const STATS_SAVE_FILE = "stats.tres"
const SETTINGS_SAVE_FILE = "settings.tres"

@onready var stats: Stats = preload("res://Resources/player_stats.tres")
@onready var settings: Settings = preload("res://Resources/player_settings.tres")

func verify_save_directory(path: String):
	DirAccess.make_dir_absolute(path)

func save_game():
	ResourceSaver.save(stats, SAVE_PATH + STATS_SAVE_FILE)
	ResourceSaver.save(settings, SAVE_PATH + SETTINGS_SAVE_FILE)

func load_game():
	var loaded_stats = ResourceLoader.load(SAVE_PATH + STATS_SAVE_FILE).duplicate(true)
	var loaded_settings = ResourceLoader.load(SAVE_PATH + SETTINGS_SAVE_FILE).duplicate(true)
	
	stats.health = loaded_stats.health
	stats.health_regen = loaded_stats.health_regen
	stats.mana = loaded_stats.mana
	stats.mana_regen = loaded_stats.mana_regen
	stats.damage = loaded_stats.damage
	stats.speed = loaded_stats.speed
	stats.coins = loaded_stats.coins
	
	settings.gamepad = loaded_settings.gamepad
	settings.fullscreen = loaded_settings.fullscreen
	settings.volume = loaded_settings.volume
	settings.resolution = loaded_settings.resolution
	

func _ready():
	verify_save_directory(SAVE_PATH)
