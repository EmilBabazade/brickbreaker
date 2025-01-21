extends CharacterBody2D

@export var speed: float = 400
var direction: Vector2

func _ready() -> void:
	var rng = RandomNumberGenerator.new()
	var random_num = rng.randi_range(0, 100)
	direction = Vector2(0.3, -1) if random_num % 2 == 0 else Vector2(-0.3, -1)
	velocity = direction * speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var collision = move_and_collide(direction * speed * delta)
	if collision:
		var collider = collision.get_collider()
		var collision_normal = Vector2.ZERO
		if collider.is_in_group('entity'):
			collision_normal = (global_position - collider.global_position).normalized()
		else:
			collision_normal = collision.get_normal()
		$BounceAudioStreamPlayer.pitch_scale = randf_range(0.8, 1.2)
		$BounceAudioStreamPlayer.play()
		direction = direction.bounce(collision_normal).normalized()
		if 'hit' in collider:
			collider.hit()
		if 'green_hit' in collider:
			collider.green_hit(self)
