extends Node3D

var score = 0.0

func _ready():
	set_process(true)
	pass
	
func get_point():
	score = score + 1
	print("score:", score)
	pass
