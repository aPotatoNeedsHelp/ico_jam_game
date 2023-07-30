extends RigidBody2D

const DELTA_MULTIPLIER = 40
var velocity: Vector2
@export_range(0.0,128*2)var speed: float = 128
var directions = {
		"right": Vector2.RIGHT,
		"left": Vector2.LEFT,
		"up": Vector2.UP,
		"down": Vector2.DOWN
}

func _physics_process(delta: float) -> void:
	var dir = Input.get_vector("left", "right", "up", "down")
	if dir.x != 0 and dir.y != 0:
		dir.y = 0
	velocity = dir.normalized() * speed  * delta * DELTA_MULTIPLIER
	
	apply_central_impulse(dir * speed)
