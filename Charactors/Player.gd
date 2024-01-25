extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

#attack
var is_attack_pressed = false
var fire_rate = 0.0
var next_fire = 0.3

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
const bullet_path = preload("res://Objects/bullet.tscn")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		pass
		# velocity.y = JUMP_VELOCITY
		
	if Input.is_action_pressed("ui_accept"):
		if is_attack_pressed == false:
			fire()
		else:
			is_attack_pressed = true

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, input_dir.y, 0)).normalized()
	if direction:
		velocity.x = -direction.x * SPEED
		velocity.y = -direction.y * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
	fire_rate += delta
	if fire_rate >= next_fire:
		fire_rate = 0
		is_attack_pressed = false

func fire():
	var bullet = bullet_path.instantiate()
	bullet.set_name("bullet(Clone)")
	get_node("Pivot").add_child(bullet)
	pass
