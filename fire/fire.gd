extends Area2D


var grid_pos: Vector2i
@export var tile_size: int = 128
var burning: bool = true
func _ready() -> void:
	position = position.snapped(Vector2.ONE * tile_size)
	#grid_pos = position /tile_size
	position -= Vector2.ONE * tile_size/2


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("burn") and burning:
		burning = false
		body.burn(Vector2.LEFT)
	pass # Replace with function body.


var burn_of_counter: int
func _on_body_exited(_body: Node2D) -> void:
	burn_of_counter += 1
	if burn_of_counter >= 2:
		burn_of_counter = 0
		burning = true
	pass # Replace with function body.
