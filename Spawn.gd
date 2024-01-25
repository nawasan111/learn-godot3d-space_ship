extends Node3D

var spawn_rate = 0.0
var spawn_show = 4.0
var randomr = 0.0
var random_x = 0.0
var random_y = 0.0

const enemy = preload("res://Charactors/Enemy.tscn")


func _ready():
	pass # Replace with function body.


func _process(delta):
	spawn_rate += delta
	if spawn_rate > spawn_show:
		spawn_rate = 0
		var enemy_spawn = enemy.instantiate()
		enemy_spawn.set_name("enemy(Clone)")
		get_node(".").add_child(enemy_spawn)
		
		randomr = RandomNumberGenerator.new()
		random_x = randomr.randf_range(-10, 1)
		random_y = randomr.randf_range(0, 10)
		enemy_spawn.transform.origin = Vector3(random_x, random_y, -50)
	pass
