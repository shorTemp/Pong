extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	gravity_scale = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.y = lerp(global_position.y,get_global_mouse_position().y,20*delta)
	pass
