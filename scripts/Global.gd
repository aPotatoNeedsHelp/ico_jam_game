extends Node

var history: Array[Array]

var puzzle_path: String = "":
	set(b):
		puzzle_selected.emit(b)
		puzzle_path = b

signal puzzle_selected(path: String)
func add_step(step: Array[Dictionary]):
	history.append(step)
