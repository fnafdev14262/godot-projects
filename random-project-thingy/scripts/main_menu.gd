
extends Control



func _ready() -> void:
	print("Don't Read This")
	$Button.pressed.connect(_on_button_pressed)
	$Button2.pressed.connect(_on_button_2_pressed)
	$Button3.pressed.connect(_on_button_3_pressed)

func _on_button_pressed():
	$Label.text = "Menuju Scene Hasil"
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://scenes/games.tscn")


func _on_button_2_pressed() -> void:
	$Label.text = "Menuju Scene About"
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://scenes/about.tscn")

func _on_button_3_pressed() -> void:
	$Label.text = "Byeeee! Semoga Kembali"
	await get_tree().create_timer(1).timeout
	get_tree().quit()
