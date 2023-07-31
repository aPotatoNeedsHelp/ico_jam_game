extends CharacterBody2D

const DELTA_MULTIPLIER = 40

@export var lock_diagonals: bool = false
@export_range(0.0,128*10)var speed: float = 128


@onready var grab_area = $GrabArea
@onready var follow_position = $FollowPosition

var current_object = null
var is_object_inrange:bool = false
var is_object_picked_up:bool = false
var directions = {
		"right": Vector2.RIGHT,
		"left": Vector2.LEFT,
		"up": Vector2.UP,
		"down": Vector2.DOWN
}

func _physics_process(delta: float) -> void:
	var dir = Input.get_vector("left", "right", "up", "down")
	
	if dir.x != 0 and dir.y != 0 and lock_diagonals:
		dir.y = 0
	
	velocity = dir.normalized() * speed  * delta * DELTA_MULTIPLIER
	
	move_and_slide()

func _unhandled_input(event):
	update_current_object()
	
	if event.is_action_pressed("pick_up") and current_object != null:
		is_object_picked_up = !is_object_picked_up
		
		current_object.player_interaction(self,is_object_picked_up)
		
		if !is_object_picked_up:
			current_object = null

func update_current_object():
	if grab_area.has_overlapping_bodies():
		is_object_inrange = true
		if current_object == null:
			current_object = grab_area.get_overlapping_bodies()[0]
	else:
		is_object_inrange = false
		current_object = null
