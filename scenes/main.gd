extends Node2D

var ball_scene: PackedScene = preload("res://scenes/ball/ball.tscn")

func _ready() -> void:
	var blue_bricks = get_tree().get_nodes_in_group('blue_brick')
	for bb in blue_bricks:
		bb.connect('more_balls', add_more_balls)
	var green_bricks = get_tree().get_nodes_in_group('green_brick')
	for gb in green_bricks:
		gb.connect('green_brick_hit', on_green_brick_hit)

func add_more_balls(pos: Vector2):
	var ball = ball_scene.instantiate()
	ball.position = pos
	add_child(ball)

func on_green_brick_hit(ball: Node2D):
	ball.speed *= 1.5
