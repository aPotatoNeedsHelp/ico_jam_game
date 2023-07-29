extends GridBody2D
class_name Food

func _init() -> void:
	add_to_group("Push", true)


@export var burned_food_preload: String
func burn(dir: Vector2):
	if !burned_food_preload: return
	print("burned")
	var burned_food = load(burned_food_preload).instantiate()
	burned_food.global_position = global_position
	get_parent().add_child(burned_food)
	burned_food.move(dir)
	get_parent().step()
	queue_free()

