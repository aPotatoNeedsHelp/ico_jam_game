extends CharacterBody2D
class_name GridBody2D

var grid_pos: Vector2i
@export var tile_size: int = 128
@onready var ray = $RayCast2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var directions = {"right": Vector2.RIGHT,
			"left": Vector2.LEFT,
			"up": Vector2.UP,
			"down": Vector2.DOWN}

func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	#grid_pos = position /tile_size
	position -= Vector2.ONE * tile_size/2

func rotate_to(dir):
	animated_sprite_2d.rotation = directions[dir].angle() + PI/2

func check_dir(dir) -> bool:
	ray.target_position = directions[dir] * tile_size
	ray.force_raycast_update()
	return ray.is_colliding()

func move(dir) -> bool:
	if check_dir(dir):
		if ray.get_collider().is_in_group("Push"):
			if !ray.get_collider().move(dir):
				return false
		else:
			return false
	
	position += directions[dir] * tile_size
	return true

