extends Brick

signal more_balls(position: Vector2)

func hit():
	more_balls.emit(global_position)
	queue_free()
