extends CharacterBody2D
class_name GridBody2D

var grid_pos: Vector2i
@export var tile_size: int = 128
#@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var ray_front
var ray_back
var is_pull: bool = false

var directions = {"right": Vector2.RIGHT,
			"left": Vector2.LEFT,
			"up": Vector2.UP,
			"down": Vector2.DOWN}

func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	#grid_pos = position /tile_size
	position -= Vector2.ONE * tile_size/2
	ray_front = RayCast2D.new()
	add_child(ray_front)
	ray_back = RayCast2D.new()
	add_child(ray_back)

func get_rotation_to(dir):
	return directions[dir].angle() + PI/2

func check_dir(ray, dir, inverse: bool = false) -> bool:
	var direction = directions[dir]
	if inverse: direction = -directions[dir]
	ray.target_position = direction * tile_size
	ray.force_raycast_update()
	return ray.is_colliding()

func move(dir) -> bool:
	if check_dir(ray_front, dir) and !is_pull:
		if ray_front.get_collider().is_in_group("Push"):
			if !ray_front.get_collider().move(dir):
				return false
		else:
			return false
	
	if check_dir(ray_back, dir, true) and is_pull:
		if ray_front.get_collider().is_in_group("Push"):
			if !ray_front.get_collider().move(dir):
				return false
		else:
			return false
	
	position += directions[dir] * tile_size
	return true

