extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://world.tscn")
	if Input.is_action_pressed("ui_text_clear_carets_and_selection"):
		get_tree().change_scene_to_file("res://start_game.tscn")
	pass
