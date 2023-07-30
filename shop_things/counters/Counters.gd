extends Node2D

signal puzzle_selected(puzzle_path)

const WHITENING_AMOUNT = 0.4
const MAX_PUZZLES_INDEX = 2

@onready var puzzle_acces_liste:= []

var selected_puzzle = 0
var is_in_shop:bool = true

func _ready():
	for child in get_children():
		if child is Sprite2D:
			puzzle_acces_liste.append(child)
	
	puzzle_acces_liste[0].change_shader_color(WHITENING_AMOUNT)

func _unhandled_input(event):
	if event.is_action_pressed("right"):
		change_selected_puzzle(-1)
	
	if event.is_action_pressed("left"):
		change_selected_puzzle(1)
	
	if event.is_action_pressed("space"):
		print("selected_puzzle: ", selected_puzzle)
		change_input_take(false)
		var path = puzzle_acces_liste[selected_puzzle].puzzle_path
		puzzle_selected.emit(path)
		print("emited path: ", path)
		#get_tree().change_scene_to_file(path)
		Global.puzzle_path = path

func change_selected_puzzle(amount):
	selected_puzzle += amount
	
	if selected_puzzle > MAX_PUZZLES_INDEX:
		selected_puzzle = 0
	elif selected_puzzle < 0:
		selected_puzzle = MAX_PUZZLES_INDEX
	
	for i in range(0,MAX_PUZZLES_INDEX + 1):
		var selected_color = 0.0
		if selected_puzzle == i:
			selected_color = WHITENING_AMOUNT
		
		puzzle_acces_liste[i].change_shader_color(selected_color)

func change_input_take(can_take_inputs:bool):
	set_process_unhandled_input(can_take_inputs)
	is_in_shop = can_take_inputs
