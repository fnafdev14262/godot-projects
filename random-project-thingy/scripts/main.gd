extends Node

var health = 100

func _ready() -> void:
	print("Hello, World ")
	$Label.text = "Hello, World"
	$Label4.text = "Hi, Universe"
	$Label2.text = "Hola, Planet"
	$Label3.text = "Press Space to Attack"
	$Label.modulate = Color.GREEN
	$Label2.modulate = Color.RED
	$Label4.modulate = Color.ORANGE
	$ProgressBar.value = health
	$Label.scale = Vector2(1, 1)
	$Label3.scale = Vector2(1, 1)
	$Label2.scale = Vector2(1, 1)
	$Label4.scale = Vector2(1, 1)
	
	var custom_style = $ProgressBar.get_theme_stylebox("fill").duplicate() if $ProgressBar.has_theme_stylebox_override("fill") else StyleBoxFlat.new()
	custom_style.set_corner_radius_all(10)
	custom_style.set_border_width_all(3)
	custom_style.border_color = Color.from_string("#484848", Color.GRAY)
	
	$ProgressBar.add_theme_stylebox_override("fill", custom_style)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("my_action"):
		var health_tween = create_tween()
		$AudioStreamPlayer2D.play()
		$Label.modulate = Color.RED
		health -= 20
		health_tween.tween_property($ProgressBar, "value", health, 0.52).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
		$Label2.modulate = Color.YELLOW
		var dead_style = StyleBoxFlat.new()
		dead_style.bg_color = Color.from_string("#400000", Color.RED)
		dead_style.set_corner_radius_all(10)
		dead_style.set_border_width_all(3)
		dead_style.border_color = Color.from_string("#484848", Color.GRAY)
		$ProgressBar.add_theme_stylebox_override("fill", dead_style)
		$Label4.modulate = Color.AQUAMARINE
		await get_tree().create_timer(0.52).timeout
		
		dead_style.bg_color = Color.from_string("#ff0000", Color.RED)
		$ProgressBar.add_theme_stylebox_override("fill", dead_style)
		
		if health <= 0:
			await get_tree().create_timer(0.52).timeout
			$AudioStreamPlayer2D1.play()
			$Label.text = "YOU DIE"
			$Label3.text = 'Press "R" to Restart'
			health = 0
			
	if event.is_action_released("my_action"):
		$Label.modulate = Color.GREEN
		$Label2.modulate = Color.RED
		$Label4.modulate = Color.ORANGE
		if health <=  0:
			$Label.text = "YOU DIE"
			$Label3.text = 'Press "R" to Restart'
			health = 0
			$AudioStreamPlayer2D1.play()
			
	if event.is_action_pressed("my_restart") and health <= 0:
		get_tree().reload_current_scene()
	if event.is_action_released("my_restart") and health <= 0:
		get_tree().reload_current_scene()
	if event.is_action_pressed("my_quit") and health <= 0:
		get_tree().quit() 
