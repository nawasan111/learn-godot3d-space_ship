extends CharacterBody3D

const SPEED = 2.0
const JUMP_VELOCITY = 4.5
var wait_time = 0.0
var end_time = 0.1
var destroy_time = 0.5

func 	_ready():
	set_process(true)
	pass
	
func _physics_process(delta):
	wait_time += delta
	translate(Vector3(0, 0, delta + SPEED))
	if wait_time > end_time:
		if wait_time >= destroy_time:
			destroy()
	pass

func destroy():
	queue_free()
