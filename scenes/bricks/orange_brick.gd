extends Brick

var orange_health = 5

func hit():
	orange_health -= 1
	if orange_health <= 0:
		Globals.score *= 2
		Globals.brick_count -= 1
		queue_free()
