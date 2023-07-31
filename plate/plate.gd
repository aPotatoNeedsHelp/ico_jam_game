extends Area2D



var entered_body_list: Array

var conditions = ["bread", "meat_grilled"]
var conditions_check : int
var result = "res://plate/results/meat_bread.tscn"
func _process(delta: float) -> void:
	for entered_body in entered_body_list:
		for i in conditions.size():
			if entered_body.title == conditions[i]:
				conditions_check += 1
	if conditions_check == conditions.size():
		spawn_result(result)
	conditions_check = 0

func spawn_result(path: String):
	result = load(path).instantiate()
	result.position = position
	get_parent().add_child(result)
	for entered_body in entered_body_list:
		entered_body.queue_free()

func _on_body_entered(body: Node2D) -> void:
	entered_body_list.append(body)
	pass # Replace with function body.


func _on_body_exited(body: Node2D) -> void:
	entered_body_list.erase(body)
	pass # Replace with function body.
