extends Brick

func hit():
	if not dying:
		Globals.health += 1
	super()
