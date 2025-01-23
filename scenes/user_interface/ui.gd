extends CanvasLayer

signal restart

func _ready() -> void:
	if Globals.player_name:
		$VBoxContainer/TextEdit.text = Globals.player_name
	reset()
	Globals.connect('score_changed', on_score_changed)
	Globals.connect('health_changed', on_health_changed)

func on_score_changed():
	$Score.text = str(Globals.score)

func on_health_changed():
	$HBoxContainer/Health.text = str(Globals.health)

func game_over():
	if Globals.health <= 0:
		$VBoxContainer/GameOver.text = 'YOU LOST!'
		$GameOverAudioStreamPlayer.play()
	else:
		$VBoxContainer/GameOver.text = 'YOU WIN!'
		$GameWonAudioStreamPlayer2.play()
	$VBoxContainer/FinalScore.text = 'Score: ' + str(Globals.score)
	$VBoxContainer.visible = true

func reset():
	$VBoxContainer.visible = false
	on_score_changed()
	on_health_changed()


func _on_restart_button_pressed() -> void:
	reset()
	restart.emit()


func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/user_interface/main_menu.tscn")


func _on_leaderboard_pressed() -> void:
	Globals.prevscene = get_tree().current_scene.scene_file_path
	get_tree().change_scene_to_file("res://scenes/user_interface/leaderboard.tscn")


func _on_text_edit_text_changed() -> void:
	Globals.player_name = $VBoxContainer/TextEdit.text
