extends StaticBody2D

var orange_health = 5

func hit():
	orange_health -= 1
	if orange_health <= 0:
		Globals.score *= 2
		queue_free()
