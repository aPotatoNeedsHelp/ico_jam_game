extends GridBody2D

var directions = {
		"right": Vector2.RIGHT,
		"left": Vector2.LEFT,
		"up": Vector2.UP,
		"down": Vector2.DOWN
}

func _input(event: InputEvent) -> void:
	for dir in directions.keys():
		if event.is_action_pressed(str("ui_", dir)):
			move(directions[dir])
			$Player.rotation = get_rotation_to(directions[dir])
			get_parent().step()
			
