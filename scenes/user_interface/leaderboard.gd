extends CanvasLayer

var row_scene: PackedScene = preload("res://scenes/user_interface/leaderboard_row.tscn")

func _ready() -> void:
	for i in range(0, 100):
		add_row('Bob', 999999)

func add_row(username: String, score: int):
	var row = row_scene.instantiate()
	row.set_text(username, score)
	$ScrollContainer/Table.add_child(row)
