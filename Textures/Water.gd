extends MeshInstance3D

var speed = 6.0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_surface_override_material(0).uv1_offset.y -= delta + speed	
	pass
