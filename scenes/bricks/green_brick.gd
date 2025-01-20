extends Brick

signal green_brick_hit(ball: Node2D)

func green_hit(ball: Node2D):
	green_brick_hit.emit(ball)
