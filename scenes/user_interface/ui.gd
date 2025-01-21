extends CanvasLayer

func _ready() -> void:
	on_score_changed()
	on_health_changed()
	Globals.connect('score_changed', on_score_changed)
	Globals.connect('health_changed', on_health_changed)

func on_score_changed():
	$Score.text = str(Globals.score)

func on_health_changed():
	$HBoxContainer/Health.text = str(Globals.health)

func game_over():
	if Globals.health <= 0:
		$VBoxContainer/GameOver.text = 'YOU LOST!'
	else:
		$VBoxContainer/GameOver.text = 'YOU WIN!'
	$VBoxContainer/FinalScore.text = 'Score: ' + str(Globals.score)
	$VBoxContainer.visible = true

func reset():
	$VBoxContainer.visible = false
	on_score_changed()
	on_health_changed()
