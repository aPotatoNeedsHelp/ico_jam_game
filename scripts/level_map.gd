extends TileMap


func _ready() -> void:
	for cell in get_used_cells(1):
		var scene_name = get_cell_tile_data(1, cell).get_custom_data("scene_name")
		var scene = load(str("res://", scene_name,"/", scene_name,".tscn")).instantiate()
		scene.position = map_to_local(cell)
		add_child(scene)
		#clear cell
		set_cell(1, cell)

var active_body

func step():
	var step_list: Array[Dictionary] = []
	for child in get_children():
		if child.has_method("step"):
			step_list.append(await child.step())
	
	Global.add_step(step_list)
	print("\nstep: ", step_list)
	
