extends Sprite2D


@onready var title_label: Label = $Title
@export_file("*.tscn") var puzzle_path = ""

@export var title: String = "untitled"

func _ready() -> void:
	title_label.text = title
func change_shader_color(amount:float):
	material.set_shader_parameter("whitening",amount)
