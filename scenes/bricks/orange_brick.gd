extends Brick

var orange_health = 5

func hit():
	if not dying:
		score = Globals.score
	super()
