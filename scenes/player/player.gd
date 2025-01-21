extends StaticBody2D

@export var speed = 600
var direction: Vector2 = Vector2.ZERO

func _process(_delta: float) -> void:
	get_input()

func _physics_process(delta: float) -> void:
	move(delta)

func get_input():
	if Globals.health > 0:
		direction.x = Input.get_axis('left', 'right')

func move(delta: float):
	move_and_collide(direction * delta * speed)
