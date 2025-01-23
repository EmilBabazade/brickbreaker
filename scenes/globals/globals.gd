extends Node

signal score_changed
signal health_changed

var score = 0:
	get:
		return score
	set(value):
		score = value
		score_changed.emit()

var max_health = 3
var health = max_health:
	get:
		return health
	set(value):
		health = value
		health_changed.emit()

var mouse_controls = true

func restart():
	score = 0
	health = max_health

var prevscene: String

var player_name: String

var scores: Array = []

var _savefile = 'user://savegame.save'
func save_scores():
	var save_file = FileAccess.open(_savefile, FileAccess.WRITE)
	var json_string = JSON.stringify(scores)
	save_file.store_line(json_string)

func load_scores():
	if not FileAccess.file_exists(_savefile):
		return
	var save_file = FileAccess.open(_savefile, FileAccess.READ)
	var json_string = save_file.get_line()
	var json = JSON.new()
	var parse_result = json.parse(json_string)
	if not parse_result == OK:
		print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
		return
	scores = json.data
