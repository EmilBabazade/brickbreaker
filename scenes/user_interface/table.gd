extends Control

var row_scene: PackedScene = preload("res://scenes/user_interface/leaderboard_row.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func add_row(name: String, score: int):
	var row = row_scene.instantiate()
	row.set_text(name, score)
	row.position 
