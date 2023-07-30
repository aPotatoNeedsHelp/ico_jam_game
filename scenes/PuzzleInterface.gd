extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var frame: Node2D = $Frame
var puzzle_path: String = ""
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.puzzle_selected.connect(on_puzzle_selected)

func on_puzzle_selected(path):
	animation_player.play("fade_in")
	puzzle_path = path

func spawn_puzzle():
	var puzzle = load(puzzle_path).instantiate()
	frame.add_child(puzzle)
