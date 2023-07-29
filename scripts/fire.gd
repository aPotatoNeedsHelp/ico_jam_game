extends Area2D


var grid_pos: Vector2i
@export var tile_size: int = 128
func _ready() -> void:
	position = position.snapped(Vector2.ONE * tile_size)
	#grid_pos = position /tile_size
	position -= Vector2.ONE * tile_size/2

func _process(delta: float) -> void:
	pass
