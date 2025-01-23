extends CanvasLayer

var row_scene: PackedScene = preload("res://scenes/user_interface/leaderboard_row.tscn")

func _ready() -> void:
	add_player_score()
	set_scores()

func add_player_score():
	if Globals.player_name and Globals.score != 0:
		var player_score = {
			'name': Globals.player_name, 
			'score': Globals.score, 
			'date': Time.get_datetime_dict_from_system(true)
		}
		Globals.scores.append(player_score)
		Globals.score = 0

func sort_descending(a, b):
	return a['score'] > b['score']

func set_scores():
	Globals.scores.sort_custom(sort_descending)
	for r in Globals.scores:
		add_row(r['name'], r['score'], r['date'])

func add_row(username: String, score: int, date: Dictionary):
	var row = row_scene.instantiate()
	row.set_text(username, score, date)
	$ScrollContainer/Table.add_child(row)


func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file(Globals.prevscene)
