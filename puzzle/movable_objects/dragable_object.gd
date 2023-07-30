extends RigidBody2D

const PLAYER_LAYER = 2

@export_range(0,20) var follow_speed = 5
@export var follow_offset:Vector2 = Vector2(0.0,20.0)
@export_range(0,1000) var distance_limit = 200

@onready var collision_shape_2d = $CollisionShape2D

var is_picked_up:bool = false
var inside_tileset:bool = false
var player = null


func player_interaction(itself,picked_up):
##	Makes sure that we don't throw the object when it's inside collisions
#	if picked_up == false:
#		itself.is_object_picked_up = true
#		return
	
	set_collision_mask_value(PLAYER_LAYER,is_picked_up)
	is_picked_up = picked_up
	player = itself

func _physics_process(_delta):
	if is_picked_up:
		linear_velocity = ((player.follow_position.global_position + follow_offset ) - global_transform.origin) * follow_speed
	else:
		linear_velocity = lerp(linear_velocity,Vector2.ZERO,0.5)
