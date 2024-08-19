extends AnimatableBody2D

@export var velocity : Vector2
@export var speed : int

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var collision = move_and_collide(velocity.normalized()*delta*speed)
	var collider = collision.get_collider() if collision else null
	
	if collider != null:
		print(collider)
	if collider == $"../Paddle1":
		bounce_off_paddle(collider)
	elif collider == $"../Paddle2":
		bounce_off_paddle(collider)
	elif collider == $"../Walls":
		velocity.y *= -1

func bounce_off_paddle(paddle: Node2D):
	var paddle_sprite = paddle.get_node("Sprite2D")
	var size = paddle_sprite.texture.get_size()
	speed += 20
	
	var ball_position = global_position.y
	var paddle_position = paddle.global_position.y
	var difference = ball_position - paddle_position
	var normalized_difference = difference / (size.y / 2)
	if normalized_difference > 1:
		normalized_difference = 1
	elif normalized_difference <-1:
		normalized_difference = -1
	velocity.y = normalized_difference
	velocity.x *= -1
	print(normalized_difference)

func bounce_off_wall():
	velocity.y *= -1
