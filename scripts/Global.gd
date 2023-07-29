extends Node

var history: Array[Array]

func add_step(step: Array[Dictionary]):
	history.append(step)
