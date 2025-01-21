extends StaticBody2D
class_name Brick

@export var score = 1
@export var health = 1

func hit():
	Globals.score += score
	Globals.brick_count -= 1
	health -= 1
	if health <= 0:
		queue_free()
