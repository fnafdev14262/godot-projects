extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button.pressed.connect(on_button_pressed)
	$Button2.pressed.connect(on_button2_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame
func on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game_220626.tscn")
func on_button2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game_290626.tscn")
