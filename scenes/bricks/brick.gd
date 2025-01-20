extends StaticBody2D
class_name Brick

@export var score = 1

func hit():
	Globals.score += score
	queue_free()
