extends Node2D

var ball_scene: PackedScene = preload("res://scenes/ball/ball.tscn")

func _ready() -> void:
	var blue_bricks = get_tree().get_nodes_in_group('blue_brick')
	for bb in blue_bricks:
		bb.connect('more_balls', add_more_balls)

func add_more_balls(pos: Vector2):
	var ball = ball_scene.instantiate()
	ball.position = pos
	add_child(ball)
