extends Sprite2D


@export_file("*.tscn") var puzzle_path = ""

func change_shader_color(amount:float):
	material.set_shader_parameter("whitening",amount)
