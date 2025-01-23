extends Node2D

var ball_scene: PackedScene = preload("res://scenes/ball/ball.tscn")
var ball_count = 1
@export var ball_start_pos = Vector2(576, 536)
var game_over = false

var columns = 32
var rows = 15
var margin = 50

var brick_scenes: Array[PackedScene] = [
	preload("res://scenes/bricks/brick.tscn"),
	preload("res://scenes/bricks/brick.tscn"),
	preload("res://scenes/bricks/brick.tscn"),
	preload("res://scenes/bricks/brick.tscn"),
	preload("res://scenes/bricks/brick.tscn"),
	preload("res://scenes/bricks/brick.tscn"),
	preload("res://scenes/bricks/brick.tscn"),
	preload("res://scenes/bricks/brick.tscn"),
	preload("res://scenes/bricks/brick.tscn"),
	preload("res://scenes/bricks/brick.tscn"),
	preload("res://scenes/bricks/blue_brick.tscn"),
	preload("res://scenes/bricks/green_brick.tscn"),
	preload("res://scenes/bricks/orange_brick.tscn"),
	preload("res://scenes/bricks/pink_brick.tscn"),
	preload("res://scenes/bricks/red_brick.tscn")
]

signal balls_deleted

func setup_level():
	for r in rows:
		for c in columns:
			var rn = randi_range(0, 2)
			if rn > 0:
				var i = randi_range(0, len(brick_scenes) - 1)
				var brick = brick_scenes[i].instantiate()
				brick.position = Vector2(margin + (34 * c), margin + (18 * r))
				$Bricks.add_child(brick)

func _process(_delta: float) -> void:
	if Globals.health <= 0 and not game_over:
		delete_balls()
		await balls_deleted
		$Player.stop()
		$UI.game_over()
		game_over = true
	if $Bricks.get_child_count() <= 0 and not game_over:
		delete_balls()
		await balls_deleted
		$Player.stop()
		$UI.game_over()
		game_over = true

func _ready() -> void:
	setup_level()
	var blue_bricks = get_tree().get_nodes_in_group('blue_brick')
	for bb in blue_bricks:
		bb.connect('more_balls', add_more_balls)
	var green_bricks = get_tree().get_nodes_in_group('green_brick')
	for gb in green_bricks:
		gb.connect('green_brick_hit', on_green_brick_hit)

func delete_balls():
	var balls = $Balls.get_children()
	for ball in balls:
		var audio = ball.get_node_or_null("AudioStreamPlayer")
		if audio:
			audio.stop()
		ball.queue_free()
	balls_deleted.emit()

func add_more_balls(pos: Vector2):
	if Globals.health > 0:
		var ball = ball_scene.instantiate()
		ball.position = pos
		$Balls.add_child(ball)
		ball_count += 1

func on_green_brick_hit(ball: Node2D):
	ball.speed *= 1.5


func _on_bottom_wall_body_entered(body: Node2D) -> void:
	body.queue_free()
	ball_count -= 1
	if ball_count <= 0:
		Globals.health -= 1
		$HealthLoseAudioStreamPlayer.play()
		await get_tree().create_timer(1).timeout
		add_more_balls(ball_start_pos)

func _on_ui_restart() -> void:
	game_over = false
	Globals.restart()
	get_tree().reload_current_scene()
