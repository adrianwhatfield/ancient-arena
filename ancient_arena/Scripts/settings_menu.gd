extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$HBoxContainer/CheckBox.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_check_box_pressed():
	Stats.gamepad = true


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
