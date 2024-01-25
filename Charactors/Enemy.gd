extends CharacterBody3D

var wait_time = 0.0
var end_time = 0.1
var hp = 1
var destroy_time = 0.2
var speed = 5.0


func _ready():
	set_process(true)
	pass
	
func _physics_process(delta):
	translate(Vector3(0, 0, delta * speed))
	var collision = move_and_collide(Vector3(0, 0, delta * speed))
	if collision:
		if collision.get_collider().name == "bullet(Clone)":
			print("Hit")
			hp -= 1
		if collision.get_collider().name == "Player":
			print("Hit")
			hp -= 1
			get_tree().change_scene_to_file("res://game_over.tscn")
	#check hp
	if hp <= 0:
		wait_time += delta
		if wait_time  > end_time:
			translate(Vector3(0, 0, 0))
			if wait_time >= destroy_time:
				destroy()

func destroy():
	Global.get_point()
	queue_free()
