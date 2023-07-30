extends TextureRect
class_name drag_texture

signal picked_up_changed(picked)

var offset: Vector2 = -size/2
@export_range(0, 1) var smooth_weight: float = 0.2
var picked_up: bool = false :
	set(b):
		if not b:
			global_position = get_global_mouse_position() +offset
		picked_up = b
		picked_up_changed.emit(b)

func _ready() -> void:
	gui_input.connect(on_gui_input)
	pivot_offset = offset

func _process(delta: float) -> void:
	if picked_up:
		global_position = lerp(global_position, get_global_mouse_position() +offset, smooth_weight)
		
	if Input.is_action_just_released("mouse_left_button") and picked_up:
		picked_up = false

func on_gui_input(event: InputEvent):
	if event.is_pressed():
		picked_up = true
