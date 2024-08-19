extends Node2D

var BALL = preload("res://ball.tscn")
var direction = [-1,1]
# Called when the node enters the scene tree for the first time.
func _ready():
	spawn()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_goal_body_entered(body):
	if body.name.begins_with("Ball"):
		body.queue_free()
		var score = $P1.get_node("Label")
		score.text = str(int(score.text)+1)
		spawn()
		
func _on_goal_2_body_entered(body):
	if body.name.begins_with("Ball"):
		body.queue_free()
		var score = $P2.get_node("Label")
		score.text = str(int(score.text)+1)
		spawn()

func spawn():
	var rand_angle = randf_range(-0.5,0.5)
	var rand_dir = direction.pick_random()
	var instance = BALL.instantiate()
	add_child(instance)
	instance.name = "Ball"
	instance.global_position = Vector2(100, 100)  # Set the initial position of the new ball
	instance.speed = 200
	instance.velocity = Vector2(rand_dir,rand_angle)


