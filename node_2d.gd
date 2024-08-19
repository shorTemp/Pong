extends Node2D

var BALL = preload("res://ball.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_goal_body_entered(body):
	print(body.name)
	if body.name.begins_with("Ball"):
		body.queue_free()
		spawn()

func spawn():
	var instance = BALL.instantiate()
	add_child(instance)
	instance.name = "Ball"
	instance.global_position = Vector2(100, 100)  # Set the initial position of the new ball
