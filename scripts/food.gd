extends GridBody2D
class_name Food

func _init() -> void:
	add_to_group("Push", true)


@export var burned_food_preload: PackedScene
func burn(dir):
	if !burned_food_preload: return
	var burned_food = burned_food_preload.instantiate()
	burned_food.global_position = global_position
	get_parent().add_child(burned_food)
	queue_free()
