extends GridBody2D

func _input(event: InputEvent) -> void:
	for dir in directions.keys():
		if event.is_action_pressed(str("ui_", dir)):
			move(dir)
			$Player.rotation = get_rotation_to(dir)
			
