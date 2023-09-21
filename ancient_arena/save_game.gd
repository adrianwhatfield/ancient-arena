extends Node

const SAVE_PATH = "user://saves/"
const STATS_SAVE_FILE = "stats.tres"
const SETTINGS_SAVE_FILE = "settings.tres"

#@export var stats: Stats
#@export var settings: Settings

func verify_save_directory(path: String):
	DirAccess.make_dir_absolute(path)

func save_game():
	pass
	#ResourceSaver.save(stats, SAVE_PATH + STATS_SAVE_FILE)
	#ResourceSaver.save(settings, SAVE_PATH + SETTINGS_SAVE_FILE)

func load_game():
	pass
	#stats = ResourceLoader.load(SAVE_PATH + STATS_SAVE_FILE).duplicate(true)
	#settings = ResourceLoader.load(SAVE_PATH + SETTINGS_SAVE_FILE).duplicate(true)

func _ready():
	verify_save_directory(SAVE_PATH)
