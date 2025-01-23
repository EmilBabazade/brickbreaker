extends CanvasLayer

func _ready() -> void:
	set_control_text()

func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_controls_pressed() -> void:
	Globals.mouse_controls = !Globals.mouse_controls
	set_control_text()

func set_control_text():
	if Globals.mouse_controls:
		$VBoxContainer/Controls.text = 'CONTROLS: MOUSE'
	else:
		$VBoxContainer/Controls.text = 'CONTROLS: KEYBOARD'


func _on_start_button_pressed() -> void:
#	if you finish a game then go to menu then start again score and health 
#	and ball count need to be reset
	Globals.restart()
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_leaderboard_pressed() -> void:
	Globals.prevscene = get_tree().current_scene.scene_file_path
	get_tree().change_scene_to_file("res://scenes/user_interface/leaderboard.tscn")
