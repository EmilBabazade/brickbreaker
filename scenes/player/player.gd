extends StaticBody2D

@export var max_speed = 600
var speed = max_speed
var direction: Vector2 = Vector2.ZERO
var follow_mouse = true

func _ready() -> void:
	speed = max_speed
	if Globals.mouse_controls:
		input_pickable = true
		mouse_entered.connect(handle_mouse_entered)
		mouse_exited.connect(handle_mouse_exited)

func _physics_process(delta: float) -> void:
	move(delta)

func _process(_delta: float) -> void:
	get_input()

func get_input():
	if Globals.health > 0:
		if Globals.mouse_controls and follow_mouse:
			var mouse_loc = get_global_mouse_position()
			var mouse_dir_x = global_position.direction_to(mouse_loc).x
			direction.x = mouse_dir_x
		else:
			direction.x = Input.get_axis('left', 'right')

func handle_mouse_entered():
	follow_mouse = false
	print('mouse entered')

func handle_mouse_exited():
	follow_mouse = true
	print('mouse exited')

func move(delta: float):
	move_and_collide(direction * delta * speed)

func stop():
	speed = 0
