extends StaticBody2D
class_name Brick

@export var score = 1
@export var health = 1
var dying = false

func hit():
	if dying:
		return
	Globals.score += score
	health -= 1
	if health <= 0:
		if $AudioStreamPlayer.stream:
			$AudioStreamPlayer.play()
			dying = true
			$CollisionShape2D.disabled = true
			$Sprite2D.visible = false
			await $AudioStreamPlayer.finished
		queue_free()
