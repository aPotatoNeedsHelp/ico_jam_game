extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var frame: Node2D = $Frame
var puzzle_path: String = ""

func spawn_puzzle():
	var puzzle = load(puzzle_path).instantiate()
	frame.add_child(puzzle)


func _on_counters_puzzle_selected(new_puzzle_path):
	animation_player.play("fade_in")
	puzzle_path = new_puzzle_path

