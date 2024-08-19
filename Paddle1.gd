extends AnimatableBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var mouse_position = get_viewport().get_mouse_position()
	var viewport_rect = get_viewport_rect()
	var sprite_size = 64
	
	mouse_position.y = clamp(mouse_position.y, 0, viewport_rect.size.y - sprite_size / 2)
	
	global_position.y = mouse_position.y
