extends Node

signal score_changed

var score = 0:
	get:
		return score
	set(value):
		score = value
		score_changed.emit()
