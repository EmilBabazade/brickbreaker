extends Node

signal score_changed
signal health_changed

var score = 0:
	get:
		return score
	set(value):
		score = value
		score_changed.emit()

var max_health = 3
var health = max_health:
	get:
		return health
	set(value):
		health = value
		health_changed.emit()

var mouse_controls = true

func restart():
	score = 0
	health = max_health

var prevscene: String

var player_name: String
