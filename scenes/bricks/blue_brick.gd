extends Brick

signal more_balls(position: Vector2)

func hit():
	if not dying:
		more_balls.emit(global_position)
	super()
