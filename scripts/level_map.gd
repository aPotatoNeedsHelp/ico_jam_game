extends TileMap


func _ready() -> void:
	for cell in get_used_cells(0):
		var scene_name = get_cell_tile_data(0, cell).get_custom_data("scene_name")
		var scene = load(str("res://scenes/puzzle/", scene_name,".tscn")).instantiate()
		scene.position = map_to_local(cell)
		add_child(scene)