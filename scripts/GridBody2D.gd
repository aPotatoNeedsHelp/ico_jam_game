extends CharacterBody2D
class_name GridBody2D

var grid_pos: Vector2i
@export var tile_size: int = 128
@export var sprite: Node
#@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var ray_front
var ray_back
var collision_shape

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
	
	collision_shape = CollisionShape2D.new()
	var shape = RectangleShape2D.new()
	shape.size = Vector2(tile_size *0.9, tile_size *0.9)
	collision_shape.shape = shape
	add_child(collision_shape)

func step():
	print(name)

func get_rotation_to(dir):
	return directions[dir].angle() + PI/2

func animate(node, dir):
	node.position -= directions[dir] * tile_size
	var tween = create_tween()
	tween.tween_property(node, "position", Vector2(), 0.1)

func check_dir(ray, dir, inverse: bool = false) -> bool:
	var direction = directions[dir]
	if inverse: direction = -directions[dir]
	ray.target_position = direction * tile_size
	ray.force_raycast_update()
	return ray.is_colliding()

func move(dir) -> bool:
	if check_dir(ray_front, dir):
		if ray_front.get_collider().is_in_group("Push"):
			if !ray_front.get_collider().move(dir):
				return false
		else:
			return false
	
	position += directions[dir] * tile_size
	if sprite:
		animate(sprite, dir)
	return true

