extends Area2D


var flipped: bool = false
func _on_body_entered(body: Node2D) -> void:
	if body.has_method("flip") and !flipped:
		body.flip()
		flipped = true
		$Timer.start(1)
	pass # Replace with function body.



func _on_timer_timeout() -> void:
	flipped = false
	pass # Replace with function body.
