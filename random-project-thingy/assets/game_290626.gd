extends Control
var score = 0
func _ready() -> void:
	$Label.text = "Score: %s" % score
	$Button.pressed.connect(on_button_pressed)
	
	
	
func on_button_pressed():
	score += 1
	$Label.text = "Score: %s" % score
	$AudioStreamPlayer2D.play()
