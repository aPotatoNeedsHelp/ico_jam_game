extends CharacterBody2D
class_name GridBody2D

var grid_pos: Vector2i
@export var tile_size: int = 128
@export var sprite: Node
var tile_offset: Vector2 = Vector2.ONE * tile_size/2
#@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var ray_front
var ray_back
var collision_shape

var direction: Vector2

func _ready():
	grid_pos = position /tile_size
	position = Vector2(grid_pos) * tile_size +tile_offset
	
	ray_front = RayCast2D.new()
	ray_front.collision_mask = collision_mask
	add_child(ray_front)
	ray_back = RayCast2D.new()
	ray_back.collision_mask = collision_mask
	add_child(ray_back)
	
	if !has_node("CollisionShape2D"):
		collision_shape = CollisionShape2D.new()
		var shape = RectangleShape2D.new()
		shape.size = Vector2(tile_size *0.9, tile_size *0.9)
		collision_shape.shape = shape
		call_deferred("add_child",collision_shape)

func step():
	if has_method("_step"):call("_step")
	position = Vector2(grid_pos) * tile_size +tile_offset
#	if sprite and direction:
#		animate(sprite, direction)
	var _dir = direction
	direction = Vector2()
	return {self: grid_pos}

func get_rotation_to(dir):
	return dir.angle() + PI/2

func animate(node, dir: Vector2):
	node.position -= dir * tile_size
	var tween = create_tween()
	tween.tween_property(node, "position", Vector2(), 0.1)

func check_dir(ray, dir: Vector2, inverse: bool = false) -> bool:
	var _dir = dir
	if inverse: _dir = -dir
	ray.target_position = _dir * tile_size
	ray.force_raycast_update()
	return ray.is_colliding()

func move(dir: Vector2) -> bool:
	if check_dir(ray_front, dir):
		if ray_front.get_collider().is_in_group("Push"):
			if !ray_front.get_collider().move(dir):
				return false
		else:
			return false
	
	grid_pos += Vector2i(dir)
	direction = dir
	# position += directions[dir] * tile_size
	#if sprite:
	#	animate(sprite, dir)
	return true

