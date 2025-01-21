extends Node2D

var ball_scene: PackedScene = preload("res://scenes/ball/ball.tscn")
var ball_count = 1
@export var ball_start_pos = Vector2(576, 536)

func _process(_delta: float) -> void:
	if Globals.health <= 0:
		$Player.stop()
		$UI.game_over()

func _ready() -> void:
	Globals.brick_count = $Bricks.get_child_count()
	var blue_bricks = get_tree().get_nodes_in_group('blue_brick')
	for bb in blue_bricks:
		bb.connect('more_balls', add_more_balls)
	var green_bricks = get_tree().get_nodes_in_group('green_brick')
	for gb in green_bricks:
		gb.connect('green_brick_hit', on_green_brick_hit)

func add_more_balls(pos: Vector2):
	if Globals.health > 0:
		var ball = ball_scene.instantiate()
		ball.position = pos
		add_child(ball)
		ball_count += 1

func on_green_brick_hit(ball: Node2D):
	ball.speed *= 1.5


func _on_bottom_wall_body_entered(body: Node2D) -> void:
	ball_count -= 1
	if ball_count <= 0:
		Globals.health -= 1
		await get_tree().create_timer(1).timeout
		add_more_balls(ball_start_pos)

func _on_ui_restart() -> void:
	Globals.restart()
	Globals.brick_count = $Bricks.get_child_count()
	get_tree().reload_current_scene()
