extends RigidBody2D

var velocity : Vector2 = Vector2(1,0)
var speed : int = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	gravity_scale = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move_and_collide(velocity.normalized()*delta*speed)

func _on_paddle_1_body_entered(body):
	print("collided")
