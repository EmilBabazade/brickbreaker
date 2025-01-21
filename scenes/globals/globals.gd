extends Node

signal score_changed
signal health_changed

var score = 0:
	get:
		return score
	set(value):
		score = value
		score_changed.emit()

var health = 3:
	get:
		return health
	set(value):
		health = value
		health_changed.emit()

# just some nonzero intial value
var brick_count: int = -1
